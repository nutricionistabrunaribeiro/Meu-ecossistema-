/* V62 — Histórico de não conformidades no preenchimento do checklist.
   Somente visual: não altera respostas nem grava dados novos. */
(function(){
  'use strict';

  const STYLE_ID='historico-nc-style-v62';
  const BADGE_CLASS='historico-nc-badge-v62';
  const MODAL_CLASS='historico-nc-modal-v62';
  let historico=new Map();
  let carregado=false;
  let timer=null;

  function escapeHtml(value){
    return String(value ?? '').replace(/&/g,'&amp;').replace(/</g,'&lt;')
      .replace(/>/g,'&gt;').replace(/"/g,'&quot;').replace(/'/g,'&#039;');
  }

  function dataBR(value){
    if(!value) return 'Data não informada';
    const p=String(value).slice(0,10).split('-');
    return p.length===3 ? `${p[2]}/${p[1]}/${p[0]}` : String(value);
  }

  function instalarEstilos(){
    if(document.getElementById(STYLE_ID)) return;
    const style=document.createElement('style');
    style.id=STYLE_ID;
    style.textContent=`
      .${BADGE_CLASS}{
        display:inline-flex;align-items:center;gap:5px;margin-top:6px;
        padding:4px 8px;border-radius:7px;background:#FFF4E9;color:#A85820;
        border:1px solid #F1D2B9;font-size:10.5px;font-weight:700;
        line-height:1.25;cursor:pointer;
      }
      .${BADGE_CLASS}:hover{background:#FCE9D8}
      html[data-tema-interface="escuro"] .${BADGE_CLASS}{
        background:#3B2B20;color:#FFC58E;border-color:#65442D;
      }
      .${MODAL_CLASS}-backdrop{
        position:fixed;inset:0;background:rgba(20,24,21,.38);z-index:99999;
        display:flex;align-items:center;justify-content:center;padding:18px;
      }
      .${MODAL_CLASS}{
        width:min(560px,100%);max-height:min(720px,90vh);overflow:auto;
        background:var(--cor-superficie,#fff);color:var(--cor-texto,#22231F);
        border:1px solid var(--cor-borda,#E2E0D6);border-radius:18px;
        box-shadow:0 22px 70px rgba(0,0,0,.22);padding:20px;
      }
      .${MODAL_CLASS}-head{display:flex;justify-content:space-between;gap:14px;align-items:flex-start;margin-bottom:14px}
      .${MODAL_CLASS}-head h3{font-family:'Fraunces',serif;font-size:19px;font-weight:500;margin:0}
      .${MODAL_CLASS}-head p{font-size:11.5px;color:var(--cor-texto-suave,#6C6B62);margin-top:5px;line-height:1.4}
      .${MODAL_CLASS}-close{width:30px;height:30px;border-radius:9px;border:1px solid var(--cor-borda,#E2E0D6);color:var(--cor-texto,#22231F);font-size:16px}
      .${MODAL_CLASS}-intro{padding:10px 12px;border-radius:10px;background:var(--cor-fundo,#F7F5EF);font-size:11px;color:var(--cor-texto-suave,#6C6B62);line-height:1.45;margin-bottom:10px}
      .${MODAL_CLASS}-occ{padding:12px 0;border-bottom:1px solid var(--cor-borda,#E2E0D6)}
      .${MODAL_CLASS}-date{font-size:11px;font-weight:800;margin-bottom:5px}
      .${MODAL_CLASS}-obs{font-size:12px;color:var(--cor-texto-suave,#6C6B62);line-height:1.5;white-space:pre-wrap}
      .${MODAL_CLASS}-foot{display:flex;justify-content:flex-end;margin-top:14px}
      .${MODAL_CLASS}-foot button{padding:8px 13px;border-radius:9px;border:1px solid var(--cor-borda,#E2E0D6);background:var(--cor-superficie,#fff);color:var(--cor-texto,#22231F);font-weight:600;font-size:11px}
    `;
    document.head.appendChild(style);
  }

  async function carregarHistorico(){
    if(typeof supa==='undefined'||!supa?.from) return false;

    const [{data:visitas,error:erroVisitas},{data:respostas,error:erroRespostas}]=await Promise.all([
      supa.from('visitas').select('id,cliente_id,data,status'),
      supa.from('checklist_respostas_itens')
        .select('visita_id,item_modelo_id,resultado,observacao,atualizado_em')
        .eq('resultado','nao_conforme')
    ]);

    if(erroVisitas||erroRespostas) return false;

    const visitasMap=new Map((visitas||[]).map(v=>[v.id,v]));
    const mapa=new Map();

    (respostas||[]).forEach(r=>{
      const v=visitasMap.get(r.visita_id);
      if(!v||v.status!=='concluida'||!v.cliente_id||!r.item_modelo_id) return;
      const chave=`${v.cliente_id}|${r.item_modelo_id}`;
      if(!mapa.has(chave)) mapa.set(chave,[]);
      mapa.get(chave).push({
        visitaId:v.id,
        data:v.data,
        observacao:r.observacao||'',
        atualizadoEm:r.atualizado_em||null
      });
    });

    mapa.forEach(lista=>lista.sort((a,b)=>String(b.data||'').localeCompare(String(a.data||''))));
    historico=mapa;
    carregado=true;
    return true;
  }

  function obterItemAtual(el){
    const botao=el.querySelector('[onclick*="marcarResultadoItem("]');
    if(!botao) return null;
    const m=String(botao.getAttribute('onclick')||'')
      .match(/marcarResultadoItem\(['"]([^'"]+)['"],\s*['"]([^'"]+)['"]/);
    return m ? {visitaId:m[1],itemId:m[2]} : null;
  }

  function obterClienteId(visitaId){
    const v=(typeof VISITAS!=='undefined') ? VISITAS.find(x=>x.id===visitaId) : null;
    return v?.clienteId||v?.cliente_id||null;
  }

  function abrirHistorico(descricao,ocorrencias){
    document.querySelector('.'+MODAL_CLASS+'-backdrop')?.remove();
    const backdrop=document.createElement('div');
    backdrop.className=MODAL_CLASS+'-backdrop';

    const cards=ocorrencias.map(o=>`
      <div class="${MODAL_CLASS}-occ">
        <div class="${MODAL_CLASS}-date">${escapeHtml(dataBR(o.data))}</div>
        <div class="${MODAL_CLASS}-obs">${escapeHtml(o.observacao||'Não foi registrada observação.')}</div>
      </div>`).join('');

    backdrop.innerHTML=`
      <div class="${MODAL_CLASS}" role="dialog" aria-modal="true">
        <div class="${MODAL_CLASS}-head">
          <div>
            <h3>Histórico do item</h3>
            <p>${escapeHtml(descricao||'Item do checklist')}</p>
          </div>
          <button class="${MODAL_CLASS}-close" type="button" aria-label="Fechar">✕</button>
        </div>
        <div class="${MODAL_CLASS}-intro">
          Este item já foi apontado como <strong>Não conforme</strong>
          ${ocorrencias.length===1?'uma vez':`${ocorrencias.length} vezes`} em checklist(s) anterior(es).
        </div>
        ${cards}
        <div class="${MODAL_CLASS}-foot"><button type="button">Fechar</button></div>
      </div>`;

    const fechar=()=>backdrop.remove();
    backdrop.addEventListener('click',e=>{if(e.target===backdrop)fechar();});
    backdrop.querySelector('.'+MODAL_CLASS+'-close').onclick=fechar;
    backdrop.querySelector('.'+MODAL_CLASS+'-foot button').onclick=fechar;
    document.body.appendChild(backdrop);
  }

  function decorar(){
    if(!carregado) return;
    document.querySelectorAll('.checklist-item').forEach(el=>{
      if(el.querySelector('.'+BADGE_CLASS)) return;

      const atual=obterItemAtual(el);
      if(!atual) return;

      const clienteId=obterClienteId(atual.visitaId);
      if(!clienteId) return;

      const lista=(historico.get(`${clienteId}|${atual.itemId}`)||[])
        .filter(x=>x.visitaId!==atual.visitaId);
      if(!lista.length) return;

      const desc=el.querySelector('.checklist-item-desc');
      if(!desc) return;

      const badge=document.createElement('button');
      badge.type='button';
      badge.className=BADGE_CLASS;
      badge.textContent=`⚠ Já apontado anteriormente${lista.length>1?` · ${lista.length}x`:''}`;
      badge.title='Ver histórico deste item';

      const descricao=desc.firstChild?.textContent?.trim()||desc.textContent.trim();
      badge.addEventListener('click',()=>abrirHistorico(descricao,lista));
      desc.appendChild(badge);
    });
  }

  function agendarDecoracao(){
    clearTimeout(timer);
    timer=setTimeout(decorar,80);
  }

  async function iniciar(){
    instalarEstilos();
    for(let i=0;i<30&&typeof supa==='undefined';i++)
      await new Promise(r=>setTimeout(r,100));

    await carregarHistorico();
    decorar();

    const alvo=document.getElementById('app')||document.querySelector('main')||document.body;
    new MutationObserver(agendarDecoracao).observe(alvo,{childList:true,subtree:true});

    document.addEventListener('click',e=>{
      const b=e.target.closest?.('[onclick*="abrirVisita("]');
      if(b) setTimeout(decorar,150);
    });
  }

  if(document.readyState==='loading')
    document.addEventListener('DOMContentLoaded',iniciar,{once:true});
  else iniciar();
})();
