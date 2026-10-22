import React, { useEffect, useState } from 'react';

/** Pass an authenticated Supabase client through `supabase`. */
export default function MinhaClareza({ supabase }) {
  const [texto, setTexto] = useState('');
  const [origem, setOrigem] = useState('texto');
  const [itens, setItens] = useState([]);
  const [registroId, setRegistroId] = useState(null);
  const [status, setStatus] = useState('');
  const [busy, setBusy] = useState(false);
  const [recognition, setRecognition] = useState(null);
  useEffect(() => () => recognition?.stop(), [recognition]);

  function extrairItens(conteudo) {
    // Heurística local provisória: não é IA. Usuário revisa antes de salvar.
    return conteudo.split(/\n|[.;]+/).map(s => s.trim()).filter(Boolean).map((titulo, i) => ({
      chave: i, titulo, tipo: /ideia|pensei em/i.test(titulo) ? 'ideia' : /lembrar|não esquecer/i.test(titulo) ? 'lembrete' : 'tarefa',
      categoria: 'geral', ambiente: 'pessoal', selecionado: true, checklist: []
    }));
  }
  async function gravarRascunho() {
    if (!texto.trim()) return setStatus('Escreva ou dite algo primeiro.');
    setBusy(true);
    try {
      const { data: { user }, error: authError } = await supabase.auth.getUser();
      if (authError || !user) throw new Error('Entre na sua conta para salvar.');
      const sugestoes = extrairItens(texto);
      const payload = { user_id: user.id, texto, categoria: 'geral', status: 'rascunho', origem, itens_sugeridos: sugestoes };
      const { data, error } = await supabase.from('minha_clareza').insert(payload).select('id').single();
      if (error) throw error;
      setRegistroId(data.id); setItens(sugestoes); setStatus('Rascunho salvo. Revise os itens antes de aprovar.');
    } catch (e) { setStatus(e.message); } finally { setBusy(false); }
  }
  async function aprovar() {
    if (!registroId) return;
    setBusy(true);
    try {
      const { data: { user }, error: authError } = await supabase.auth.getUser();
      if (authError || !user) throw new Error('Sessão expirada.');
      const selecionados = itens.filter(i => i.selecionado);
      if (!selecionados.length) throw new Error('Selecione pelo menos um item.');
      const { error } = await supabase.from('minha_clareza_itens').insert(selecionados.map(i => ({
        registro_id: registroId, user_id: user.id, titulo: i.titulo, tipo: i.tipo,
        categoria: i.categoria, ambiente: i.ambiente, checklist: i.checklist, aprovado: true
      })));
      if (error) throw error;
      const { error: updateError } = await supabase.from('minha_clareza').update({
        status: 'aprovado', revisado_em: new Date().toISOString(), aprovado_em: new Date().toISOString()
      }).eq('id', registroId).eq('user_id', user.id);
      if (updateError) throw updateError;
      setStatus('Itens aprovados e salvos no Minha Clareza.'); setRegistroId(null); setItens([]); setTexto('');
    } catch (e) { setStatus(e.message); } finally { setBusy(false); }
  }
  function iniciarDitado() {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (!SpeechRecognition) return setStatus('Ditado não disponível neste navegador. Use o teclado ou outro navegador compatível.');
    const r = new SpeechRecognition(); r.lang = 'pt-BR'; r.continuous = true; r.interimResults = false;
    r.onresult = e => { const partes = Array.from(e.results).slice(e.resultIndex).map(x => x[0].transcript).join(' '); setTexto(t => (t + ' ' + partes).trim()); };
    r.onerror = e => setStatus(`Erro no ditado: ${e.error}`);
    r.onend = () => setRecognition(null);
    r.start(); setRecognition(r); setOrigem('audio'); setStatus('Ouvindo...');
  }
  const editar = (idx, campo, valor) => setItens(prev => prev.map((i,j) => j === idx ? {...i, [campo]: valor} : i));
  return <section style={{maxWidth:650,margin:'auto',fontFamily:'inherit',color:'inherit'}}>
    <h2>✨ Minha Clareza</h2>
    <p>Fale ou escreva. Revise e aprove antes de salvar.</p>
    <textarea aria-label="Seu pensamento" rows={5} value={texto} disabled={!!registroId} onChange={e => setTexto(e.target.value)} style={{width:'100%',boxSizing:'border-box',borderRadius:12,padding:12}} />
    {!registroId && <div style={{display:'flex',gap:8,marginTop:12}}>
      <button type="button" onClick={recognition ? () => recognition.stop() : iniciarDitado}>{recognition ? 'Parar ditado' : '🎙️ Falar'}</button>
      <button type="button" disabled={busy} onClick={gravarRascunho}>Organizar e revisar</button>
    </div>}
    {registroId && <div style={{marginTop:20}}>
      <h3>Prévia para aprovação</h3>
      <p>As sugestões abaixo são iniciais. Edite antes de aprovar.</p>
      {itens.map((item,idx) => <div key={item.chave} style={{padding:12,marginBottom:10,border:'1px solid #d9c4e8',borderRadius:12}}>
        <label><input type="checkbox" checked={item.selecionado} onChange={e=>editar(idx,'selecionado',e.target.checked)}/> Incluir</label>
        <input aria-label="Título" value={item.titulo} onChange={e=>editar(idx,'titulo',e.target.value)} style={{display:'block',width:'100%',boxSizing:'border-box',margin:'8px 0'}}/>
        <select aria-label="Tipo" value={item.tipo} onChange={e=>editar(idx,'tipo',e.target.value)}>{['tarefa','checklist','ideia','lembrete','compromisso','nota'].map(t=><option key={t}>{t}</option>)}</select>{' '}
        <select aria-label="Ambiente" value={item.ambiente} onChange={e=>editar(idx,'ambiente',e.target.value)}><option value="pessoal">Pessoal</option><option value="trabalho">Trabalho</option></select>
        <input aria-label="Categoria" value={item.categoria} onChange={e=>editar(idx,'categoria',e.target.value)} placeholder="Categoria" style={{display:'block',marginTop:8}}/>
        {item.tipo === 'checklist' && <textarea aria-label="Itens do checklist, um por linha" placeholder="Uma etapa por linha" value={item.checklist.join('\n')} onChange={e=>editar(idx,'checklist',e.target.value.split('\n').filter(Boolean))} style={{display:'block',width:'100%',boxSizing:'border-box',marginTop:8}}/>}
      </div>)}
      <button type="button" disabled={busy} onClick={aprovar}>Aprovar e salvar</button>
    </div>}
    {status && <p role="status">{status}</p>}
  </section>;
}
