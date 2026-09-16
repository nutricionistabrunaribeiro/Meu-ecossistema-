let PROXIMOS_PASSOS_CLIENTE = [];
let filtroProximosPassos = 'bruna';

async function carregarProximosPassosSupabase(){
  const {data,error}=await supa.from('proximos_passos_cliente').select('*').order('criado_em',{ascending:false});
  if(error){dispararAutomacao('Erro ao carregar próximos passos',error.message);return;}
  PROXIMOS_PASSOS_CLIENTE=data||[];
}
function ppHoje(){const d=new Date(),o=d.getTimezoneOffset();return new Date(d.getTime()-o*60000).toISOString().slice(0,10);}
function ppResp(v){return v==='cliente'?'Cliente':v==='terceiro'?'Terceiro':'Bruna';}
function ppStatus(v){return v==='concluido'?'Concluída':v==='andamento'?'Em andamento':'Pendente';}
function ppOrigem(v){return v==='checklist'?'Checklist':v==='documentacao'?'Documentação':'Manual';}
function ppSugereResp(texto,origem){
  const t=String(texto||'').toLowerCase();
  if(/praga|dedet|caixa d.?água|análise de água|coifa|extint|calibra|laborat|manuten|fornecedor|terceir/.test(t))return 'terceiro';
  if(/estrutura|piso|parede|teto|ralo|tela|equipamento|reparo|substitu|vestiário|lixeira|limpeza|organiza/.test(t))return 'cliente';
  return origem==='documentacao'?'bruna':'cliente';
}
function ppSugestoes(c){
  const existentes=new Set(PROXIMOS_PASSOS_CLIENTE.filter(p=>p.cliente_id===c.id&&p.origem_id).map(p=>p.origem+':'+p.origem_id));
  const out=[];
  const ultima=VISITAS.filter(v=>v.clienteId===c.id&&v.status==='concluida').sort((a,b)=>String(b.dataAplicacaoISO||'').localeCompare(String(a.dataAplicacaoISO||'')))[0];
  (ultima?.checklist||[]).filter(i=>i.resultado==='nao_conforme'&&i.respostaId).forEach(i=>{
    if(!existentes.has('checklist:'+i.respostaId))out.push({origem:'checklist',origem_id:i.respostaId,titulo:'Corrigir: '+i.desc,observacoes:i.obs||'',responsavel:ppSugereResp(i.desc+' '+(i.obs||''),'checklist'),prioridade:'alta'});
  });
  const hoje=ppHoje();
  (c.documentacao||[]).filter(d=>d.aplicavel!==false).forEach(d=>{
    const validade=normalizarDataISO(d.validade),vencido=!!validade&&validade<hoje,pendente=d.statusOperacional==='pendente',registro=d.categoria==='registros'&&d.statusOperacional!=='implantado';
    if((vencido||pendente||registro)&&!existentes.has('documentacao:'+d.id)){
      const verbo=vencido?'Regularizar':registro?'Implantar':'Providenciar';
      out.push({origem:'documentacao',origem_id:d.id,titulo:verbo+': '+d.nome,observacoes:[vencido?'Documento vencido em '+validade.split('-').reverse().join('/'):null,d.observacoes].filter(Boolean).join(' · '),responsavel:ppSugereResp(d.nome+' '+(d.observacoes||''),'documentacao'),prioridade:vencido?'alta':'media'});
    }
  });
  return out;
}
function proximosPassosClienteHTML(c){
  const todos=PROXIMOS_PASSOS_CLIENTE.filter(p=>p.cliente_id===c.id),abertos=todos.filter(p=>p.status!=='concluido');
  const grupos={bruna:abertos.filter(p=>p.responsavel==='bruna'),cliente:abertos.filter(p=>p.responsavel==='cliente'),terceiro:abertos.filter(p=>p.responsavel==='terceiro'),concluidas:todos.filter(p=>p.status==='concluido')};
  const lista=grupos[filtroProximosPassos]||grupos.bruna;
  const minhasParaEntrega=grupos.bruna.filter(p=>!p.entrega_id);
  return `<div class="module-explainer"><strong>Seu plano de ação real.</strong> Gere sugestões com base no último checklist concluído e no controle de documentação. Nada vira entrega sem sua confirmação.</div>
  <div class="passos-toolbar"><div class="passos-actions"><button class="btn-primario" onclick="ppRevisar('${c.id}')">✦ Gerar próximos passos</button><button class="btn-secundario" onclick="ppNovo('${c.id}')">+ Incluir manualmente</button>${minhasParaEntrega.length?`<button class="btn-secundario" onclick="ppAbrirLoteEntregas('${c.id}')">Adicionar ações às Entregas (${minhasParaEntrega.length})</button>`:''}</div></div>
  <div class="passos-resumo"><div class="passos-metrica"><strong>${grupos.bruna.length}</strong><span>minhas ações</span></div><div class="passos-metrica"><strong>${grupos.cliente.length}</strong><span>ações do cliente</span></div><div class="passos-metrica"><strong>${grupos.terceiro.length}</strong><span>ações de terceiros</span></div><div class="passos-metrica"><strong>${grupos.concluidas.length}</strong><span>concluídas</span></div></div>
  <div class="passos-filtros">${[['bruna','Minhas ações'],['cliente','Ações do cliente'],['terceiro','Terceiros'],['concluidas','Concluídas']].map(([id,n])=>`<button class="passos-filtro ${filtroProximosPassos===id?'active':''}" onclick="filtroProximosPassos='${id}';renderTela()">${n}</button>`).join('')}</div>
  <div style="margin-top:14px">${lista.length?lista.map(ppCard).join(''):'<div class="placeholder">Nenhuma ação nesta lista.</div>'}</div>`;
}
function ppCard(p){
  const prazo=p.prazo?p.prazo.split('-').reverse().join('/'):'Sem prazo';
  return `<div class="passo-card ${p.prioridade} ${p.status==='concluido'?'concluido':''}"><div class="passo-titulo">${textoHTML(p.titulo)}</div><div class="passo-meta"><span class="passo-origem">${ppOrigem(p.origem)}</span><span>${ppResp(p.responsavel)}</span><span>${p.prioridade==='alta'?'Alta':p.prioridade==='baixa'?'Baixa':'Média'} prioridade</span><span>Prazo: ${prazo}</span><span>${ppStatus(p.status)}</span>${p.entrega_id?'<span>✓ Nas Entregas</span>':''}</div>${p.observacoes?`<div style="font-size:11.5px;color:var(--cor-texto-suave);margin-top:8px">${textoHTML(p.observacoes)}</div>`:''}<div class="passo-botoes"><button onclick="ppEditar('${p.id}')">Editar</button>${p.status!=='concluido'?`<button onclick="ppMudarStatus('${p.id}','${p.status==='andamento'?'pendente':'andamento'}')">${p.status==='andamento'?'Voltar a pendente':'Iniciar'}</button><button onclick="ppMudarStatus('${p.id}','concluido')">✓ Concluir</button>`:`<button onclick="ppMudarStatus('${p.id}','pendente')">Reabrir</button>`}</div></div>`;
}
function ppRevisar(clienteId){
  const c=CLIENTES.find(x=>x.id===clienteId),sugestoes=ppSugestoes(c);
  if(!sugestoes.length){dispararAutomacao('Plano de ação atualizado','Não há novas sugestões no checklist mais recente ou na documentação.');return;}
  window.__ppSugestoes=sugestoes;
  abrirModalSistema(`<div class="system-modal-head"><div><h2>Revisar próximos passos</h2><p>${sugestoes.length} sugestão(ões). Selecione e ajuste antes de salvar.</p></div><button class="system-modal-close" onclick="fecharModalSistema()">✕</button></div><div style="max-height:58vh;overflow:auto">${sugestoes.map((x,i)=>`<div class="passo-preview"><label style="display:flex;gap:8px;font-size:12px;font-weight:700"><input type="checkbox" id="ppSel${i}" checked><span>${textoHTML(x.titulo)}</span></label><div class="passo-preview-grid"><input id="ppTit${i}" value="${textoHTML(x.titulo)}"><select id="ppResp${i}"><option value="bruna" ${x.responsavel==='bruna'?'selected':''}>Bruna</option><option value="cliente" ${x.responsavel==='cliente'?'selected':''}>Cliente</option><option value="terceiro" ${x.responsavel==='terceiro'?'selected':''}>Terceiro</option></select><select id="ppPrio${i}"><option value="alta" ${x.prioridade==='alta'?'selected':''}>Alta</option><option value="media" ${x.prioridade==='media'?'selected':''}>Média</option><option value="baixa">Baixa</option></select><input type="date" id="ppPrazo${i}"></div></div>`).join('')}</div><div class="system-modal-actions"><button class="btn-secundario" onclick="fecharModalSistema()">Cancelar</button><button class="btn-primario" onclick="ppSalvarSugestoes('${clienteId}')">Salvar selecionadas</button></div>`);
}
async function ppSalvarSugestoes(clienteId){
  const s=window.__ppSugestoes||[],sel=s.map((x,i)=>({x,i})).filter(o=>document.getElementById('ppSel'+o.i)?.checked);
  if(!sel.length){alert('Selecione pelo menos uma sugestão.');return;}
  const {data:{user}}=await supa.auth.getUser();
  const linhas=sel.map(({x,i})=>({user_id:user.id,cliente_id:clienteId,origem:x.origem,origem_id:x.origem_id,titulo:document.getElementById('ppTit'+i).value.trim()||x.titulo,observacoes:x.observacoes||null,responsavel:document.getElementById('ppResp'+i).value,prioridade:document.getElementById('ppPrio'+i).value,prazo:document.getElementById('ppPrazo'+i).value||null}));
  const {data,error}=await supa.from('proximos_passos_cliente').insert(linhas).select();
  if(error){dispararAutomacao('Erro ao salvar próximos passos',error.message);return;}
  PROXIMOS_PASSOS_CLIENTE.unshift(...(data||[]));fecharModalSistema();dispararAutomacao('Plano de ação criado',linhas.length+' ação(ões) confirmada(s).');renderTela();
}
function ppForm(p,clienteId){
  return `<div class="system-modal-head"><div><h2>${p?'Editar ação':'Nova ação'}</h2><p>O registro só entra no plano depois de salvar.</p></div><button class="system-modal-close" onclick="fecharModalSistema()">✕</button></div><div class="form-grid"><div class="form-field full"><label>Ação</label><input id="ppAcaoTitulo" value="${textoHTML(p?.titulo||'')}"></div><div class="form-field"><label>Responsável</label><select id="ppAcaoResp"><option value="bruna" ${p?.responsavel==='bruna'||!p?'selected':''}>Bruna</option><option value="cliente" ${p?.responsavel==='cliente'?'selected':''}>Cliente</option><option value="terceiro" ${p?.responsavel==='terceiro'?'selected':''}>Terceiro</option></select></div><div class="form-field"><label>Prioridade</label><select id="ppAcaoPrio"><option value="alta" ${p?.prioridade==='alta'?'selected':''}>Alta</option><option value="media" ${p?.prioridade==='media'||!p?'selected':''}>Média</option><option value="baixa" ${p?.prioridade==='baixa'?'selected':''}>Baixa</option></select></div><div class="form-field"><label>Prazo</label><input type="date" id="ppAcaoPrazo" value="${p?.prazo||''}"></div><div class="form-field"><label>Status</label><select id="ppAcaoStatus"><option value="pendente" ${p?.status==='pendente'||!p?'selected':''}>Pendente</option><option value="andamento" ${p?.status==='andamento'?'selected':''}>Em andamento</option><option value="concluido" ${p?.status==='concluido'?'selected':''}>Concluída</option></select></div><div class="form-field full"><label>Observações</label><textarea id="ppAcaoObs" rows="3">${textoHTML(p?.observacoes||'')}</textarea></div></div><div class="system-modal-actions"><button class="btn-secundario" onclick="fecharModalSistema()">Cancelar</button><button class="btn-primario" onclick="ppSalvarManual('${clienteId}','${p?.id||''}')">Salvar</button></div>`;
}
function ppNovo(clienteId){abrirModalSistema(ppForm(null,clienteId));}
function ppEditar(id){const p=PROXIMOS_PASSOS_CLIENTE.find(x=>x.id===id);if(p)abrirModalSistema(ppForm(p,p.cliente_id));}
async function ppSalvarManual(clienteId,id=''){
  const titulo=document.getElementById('ppAcaoTitulo').value.trim();if(!titulo){alert('Informe a ação.');return;}
  const valores={cliente_id:clienteId,titulo,observacoes:document.getElementById('ppAcaoObs').value.trim()||null,responsavel:document.getElementById('ppAcaoResp').value,prioridade:document.getElementById('ppAcaoPrio').value,prazo:document.getElementById('ppAcaoPrazo').value||null,status:document.getElementById('ppAcaoStatus').value,atualizado_em:new Date().toISOString()};
  let resultado;
  if(id)resultado=await supa.from('proximos_passos_cliente').update({...valores,concluido_em:valores.status==='concluido'?new Date().toISOString():null}).eq('id',id).select().single();
  else{const {data:{user}}=await supa.auth.getUser();resultado=await supa.from('proximos_passos_cliente').insert({...valores,user_id:user.id,origem:'manual'}).select().single();}
  if(resultado.error){dispararAutomacao('Erro ao salvar ação',resultado.error.message);return;}
  const pos=PROXIMOS_PASSOS_CLIENTE.findIndex(x=>x.id===resultado.data.id);if(pos>=0)PROXIMOS_PASSOS_CLIENTE[pos]=resultado.data;else PROXIMOS_PASSOS_CLIENTE.unshift(resultado.data);
  await ppSincronizarEntrega(resultado.data);
  fecharModalSistema();renderTela();
}
async function ppMudarStatus(id,status){
  const p=PROXIMOS_PASSOS_CLIENTE.find(x=>x.id===id);if(!p)return;
  const valores={status,concluido_em:status==='concluido'?new Date().toISOString():null,atualizado_em:new Date().toISOString()};
  const {error}=await supa.from('proximos_passos_cliente').update(valores).eq('id',id);
  if(error){dispararAutomacao('Erro ao atualizar ação',error.message);renderTela();return;}Object.assign(p,valores);await ppSincronizarEntrega(p);renderTela();
}
function ppAbrirLoteEntregas(clienteId){
  const c=CLIENTES.find(x=>x.id===clienteId);
  const acoes=PROXIMOS_PASSOS_CLIENTE.filter(p=>p.cliente_id===clienteId&&p.responsavel==='bruna'&&p.status!=='concluido'&&!p.entrega_id);
  if(!acoes.length){dispararAutomacao('Entregas atualizadas','Todas as suas ações deste cliente já estão vinculadas.');return;}
  const prazos=acoes.map(p=>p.prazo).filter(Boolean).sort();
  window.__ppLoteEntregas=acoes;
  abrirModalSistema(`<div class="system-modal-head"><div><h2>Uma entrega, várias ações</h2><p>Selecione as ações de ${textoHTML(c?.nome||'cliente')} que devem ficar juntas no mesmo card.</p></div><button class="system-modal-close" onclick="fecharModalSistema()">✕</button></div>
  <div class="form-grid"><div class="form-field full"><label>Nome do card em Entregas</label><input id="ppLoteTitulo" value="Plano de ação — ${textoHTML(c?.nome||'Cliente')}"></div><div class="form-field"><label>Prazo do conjunto</label><input type="date" id="ppLotePrazo" value="${prazos[0]||''}"></div></div>
  <div style="max-height:42vh;overflow:auto;margin-top:12px">${acoes.map((p,i)=>`<label class="passo-preview" style="display:flex;gap:9px;align-items:flex-start"><input type="checkbox" id="ppLoteSel${i}" checked style="margin-top:2px;accent-color:var(--cor-primaria)"><span><strong style="font-size:12px">${textoHTML(p.titulo)}</strong><small style="display:block;color:var(--cor-texto-suave);margin-top:3px">${p.prazo?'Prazo individual: '+p.prazo.split('-').reverse().join('/'):'Sem prazo individual'}</small></span></label>`).join('')}</div>
  <div class="system-modal-actions"><button class="btn-secundario" onclick="fecharModalSistema()">Cancelar</button><button class="btn-primario" onclick="ppSalvarLoteEntregas('${clienteId}')">Criar um único card</button></div>`);
}
let ppLoteSalvando=false;
async function ppSalvarLoteEntregas(clienteId){
  if(ppLoteSalvando)return;
  ppLoteSalvando=true;
  try{return await ppPersistirLoteEntregas(clienteId);}
  finally{ppLoteSalvando=false;}
}
async function ppPersistirLoteEntregas(clienteId){
  const acoes=window.__ppLoteEntregas||[];
  const selecionadas=acoes.filter((p,i)=>document.getElementById('ppLoteSel'+i)?.checked);
  if(!selecionadas.length){alert('Selecione pelo menos uma ação.');return;}
  const titulo=document.getElementById('ppLoteTitulo').value.trim();
  const prazo=document.getElementById('ppLotePrazo').value;
  if(!titulo){alert('Informe o nome do card.');return;}
  if(!prazo){alert('Informe o prazo do conjunto.');return;}
  const observacoes='Ações deste plano de trabalho:\n'+selecionadas.map((p,i)=>`${i+1}. ${p.titulo}${p.observacoes?' — '+p.observacoes:''}`).join('\n');
  const {data:{user}}=await supa.auth.getUser();
  const {data:entrega,error}=await supa.from('entregas').insert({user_id:user.id,titulo,prazo,observacoes}).select().single();
  if(error){dispararAutomacao('Erro ao criar entrega',error.message);return;}
  const {data:vinculo,error:erroVinculo}=await supa.from('entrega_clientes').insert({user_id:user.id,entrega_id:entrega.id,cliente_id:clienteId}).select().single();
  if(erroVinculo){await supa.from('entregas').delete().eq('id',entrega.id);dispararAutomacao('Erro ao vincular entrega',erroVinculo.message);return;}
  const ids=selecionadas.map(p=>p.id);
  const {error:erroPasso}=await supa.from('proximos_passos_cliente').update({entrega_id:entrega.id,atualizado_em:new Date().toISOString()}).in('id',ids);
  if(erroPasso){await supa.from('entrega_clientes').delete().eq('id',vinculo.id);await supa.from('entregas').delete().eq('id',entrega.id);dispararAutomacao('Erro ao agrupar ações',erroPasso.message);return;}
  ENTREGAS.push(entrega);ENTREGA_CLIENTES.push(vinculo);selecionadas.forEach(p=>p.entrega_id=entrega.id);
  fecharModalSistema();dispararAutomacao('Entrega agrupada criada',`${selecionadas.length} ações reunidas em um único card.`);renderTela();
}

function ppTopicosEntregaHTML(e){
  const passos=PROXIMOS_PASSOS_CLIENTE.filter(p=>p.entrega_id===e.id);
  const obs=e.observacoes&&!e.observacoes.startsWith('Ações deste plano de trabalho:')?`<p style="white-space:pre-wrap;font-size:12px">${textoHTML(e.observacoes)}</p>`:'';
  if(!passos.length)return e.observacoes?`<p style="white-space:pre-wrap;font-size:12px">${textoHTML(e.observacoes)}</p>`:'';
  return obs+`<div style="margin:12px 0"><small>${passos.filter(p=>p.status==='concluido').length} de ${passos.length} tópicos concluídos</small>${passos.map(p=>`<div class="item-lista-simples" style="gap:12px;align-items:flex-start"><label style="display:flex;gap:10px;flex:1;min-width:0"><input type="checkbox" ${p.status==='concluido'?'checked':''} onchange="this.disabled=true;ppMudarStatus('${p.id}',this.checked?'concluido':'pendente')"><span style="overflow-wrap:anywhere;${p.status==='concluido'?'text-decoration:line-through;opacity:.65':''}">${textoHTML(p.titulo)}${p.prazo?`<small style="display:block">Prazo: ${dataBR(p.prazo)}</small>`:''}${p.observacoes?`<small style="display:block;white-space:pre-wrap">${textoHTML(p.observacoes)}</small>`:''}</span></label><button class="btn-secundario" onclick="ppEditar('${p.id}')">Editar</button></div>`).join('')}</div>`;
}
async function ppSincronizarEntrega(p){
  if(!p.entrega_id)return;
  const vinculo=ENTREGA_CLIENTES.find(v=>v.entrega_id===p.entrega_id&&v.cliente_id===p.cliente_id);
  if(!vinculo)return;
  const passos=PROXIMOS_PASSOS_CLIENTE.filter(x=>x.entrega_id===p.entrega_id&&x.cliente_id===p.cliente_id);
  const status=passos.every(x=>x.status==='concluido')?'entregue':'pendente';
  if(vinculo.status===status)return;
  const valores={status,concluido_em:status==='entregue'?new Date().toISOString():null};
  const {error}=await supa.from('entrega_clientes').update(valores).eq('id',vinculo.id);
  if(error){dispararAutomacao('Ação salva; entrega não sincronizada',error.message+' Abra Entregas para conferir o status do cliente.');return;}
  Object.assign(vinculo,valores);
}
