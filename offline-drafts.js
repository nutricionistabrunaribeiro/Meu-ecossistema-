/* Rascunhos de checklist: armazenamento local por conta e envio confirmado. */
let rascunhoUsuario=null;
let rascunhoSincronizando=false;
let rascunhoErroLocal=false;
let modoConsultaOffline=false;
function chaveRascunhos(){return 'me-checklist-v49:'+rascunhoUsuario;}
function lerRascunhos(){if(!rascunhoUsuario)return {};try{return JSON.parse(localStorage.getItem(chaveRascunhos())||'{}');}catch(e){rascunhoErroLocal=true;return {};}}
function gravarRascunhos(dados){try{localStorage.setItem(chaveRascunhos(),JSON.stringify(dados));rascunhoErroLocal=false;return true;}catch(e){rascunhoErroLocal=true;dispararAutomacao('Não foi possível guardar no aparelho','Armazenamento indisponível ou cheio. Mantenha esta tela aberta e conecte-se antes de sair.');return false;}}
function novoIdRascunho(){
  if(crypto?.randomUUID)return crypto.randomUUID();
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,c=>{
    const r=Math.random()*16|0,v=c==='x'?r:(r&3|8);return v.toString(16);
  });
}
function valoresRascunho(item){return {resultado:item.resultado||null,observacao:item.obs||null,validade:item.validade||null,categoria_snapshot:item.categoria,descricao_snapshot:item.desc};}
function guardarRascunhoLocal(v,item){
  if(!rascunhoUsuario||v.status==='concluida')return false;
  const fila=lerRascunhos(),key=v.id+':'+item.id,anterior=fila[key];
  item.respostaId=item.respostaId||novoIdRascunho();
  const visita={id:v.id,clienteId:v.clienteId,clienteNome:v.clienteNome,status:v.status,modeloId:v.modeloId,modeloNome:v.modeloNome,data:v.data,dataAplicacaoISO:v.dataAplicacaoISO};
  fila[key]={key,visita,item:{...item,fotos:[]},base:anterior?anterior.base:(item._serverUpdatedAt||null),revisao:novoIdRascunho(),payload:{id:item.respostaId,visita_id:v.id,item_modelo_id:item.id,...valoresRascunho(item)}};
  return gravarRascunhos(fila);
}
function aplicarRascunhosLocais(){
  Object.values(lerRascunhos()).forEach(r=>{
    let v=VISITAS.find(x=>x.id===r.visita.id);
    if(!v&&modoConsultaOffline){v={...r.visita,checklist:[]};VISITAS.push(v);}
    if(!v||v.status==='concluida')return;
    let item=v.checklist.find(x=>x.id===r.item.id);
    if(item)Object.assign(item,{...r.item,fotos:item.fotos||[]});else v.checklist.push(r.item);
  });
}
async function enviarRascunho(r,forcar=false){
  if(!navigator.onLine||!rascunhoUsuario)return false;
  try{
    const {data:visita,error:ev}=await supa.from('visitas').select('status').eq('id',r.visita.id).maybeSingle();
    if(ev||!visita||visita.status==='concluida')return false;
    const {data:remoto,error:er}=await supa.from('checklist_respostas_itens').select('*').eq('id',r.payload.id).maybeSingle();
    if(er)return false;
    const igual=remoto&&Object.keys(valoresRascunho(r.item)).every(k=>(remoto[k]||null)===(r.payload[k]||null));
    if(!forcar&&remoto&&!igual&&remoto.atualizado_em!==r.base){
      const fila=lerRascunhos();if(fila[r.key]?.revisao===r.revisao){fila[r.key].conflito=true;gravarRascunhos(fila);}return false;
    }
    let salvo=remoto;
    if(!igual){
      const {data,error}=await supa.from('checklist_respostas_itens').upsert({...r.payload,atualizado_em:new Date().toISOString()},{onConflict:'id'}).select().single();
      if(error){dispararAutomacao('Rascunho preservado no aparelho',error.message);return false;}salvo=data;
    }
    const fila=lerRascunhos();
    if(fila[r.key]?.revisao===r.revisao)delete fila[r.key];
    else if(fila[r.key])fila[r.key].base=salvo.atualizado_em;
    if(!gravarRascunhos(fila))return false;
    const item=VISITAS.find(v=>v.id===r.visita.id)?.checklist.find(i=>i.id===r.item.id);
    if(item)item._serverUpdatedAt=salvo.atualizado_em;
    ultimoSalvamentoChecklist=new Date();return true;
  }catch(e){return false;}
}
async function sincronizarRascunhos(){
  if(rascunhoSincronizando||!rascunhoUsuario||!navigator.onLine)return;
  rascunhoSincronizando=true;
  try{for(const key of Object.keys(lerRascunhos())){const r=lerRascunhos()[key];if(r&&!r.conflito)await enviarRascunho(r);}await salvarCopiaChecklist();}
  finally{rascunhoSincronizando=false;}
}
function statusRascunhoTexto(){
  if(rascunhoErroLocal)return 'Atenção: armazenamento local indisponível';
  const fila=Object.values(lerRascunhos()),conflitos=fila.filter(r=>r.conflito).length;
  if(conflitos)return `${conflitos} resposta(s) precisam de revisão entre aparelhos`;
  if(fila.length)return `Salvo neste aparelho · ${fila.length} resposta(s) aguardando sincronização`;
  return navigator.onLine?'Respostas sincronizadas com o banco':'Sem conexão · rascunho disponível neste aparelho';
}
function abrirRevisaoRascunhos(){
  const fila=Object.values(lerRascunhos());
  abrirModalSistema(`<div class="system-modal-head"><h2>Rascunhos neste aparelho</h2><button onclick="fecharModalSistema()">✕</button></div><p>Confira as respostas que ainda não foram confirmadas no banco. Uma alteração feita em outro aparelho não será sobrescrita automaticamente.</p>${fila.map(r=>`<div class="item-lista-simples"><span>${textoHTML(r.visita.clienteNome||'Cliente')} · ${textoHTML(r.item.desc||'Item')}<small style="display:block">${r.conflito?'Alterado também em outro aparelho':'Aguardando envio'}</small></span>${r.conflito?`<button onclick="resolverRascunho('${r.key}')">Revisar envio</button>`:''}</div>`).join('')||'<p>Nenhum envio pendente.</p>'}<button class="btn-primario" onclick="sincronizarRascunhos().then(()=>{fecharModalSistema();renderTela()})">Tentar sincronizar</button>`);
}
async function resolverRascunho(key){const r=lerRascunhos()[key];if(!r)return;if(!confirm('Enviar a resposta deste aparelho, substituindo a resposta deste item no banco?'))return;if(await enviarRascunho(r,true)){fecharModalSistema();renderTela();}else dispararAutomacao('Rascunho mantido','Não foi possível enviar. Confira a conexão e se o checklist ainda está em andamento.');}
function bancoCopiaChecklist(){return new Promise((resolve,reject)=>{const req=indexedDB.open('me-ecossistema-offline-v49',1);req.onupgradeneeded=()=>req.result.createObjectStore('copias');req.onsuccess=()=>resolve(req.result);req.onerror=()=>reject(req.error);});}
async function salvarCopiaChecklist(){
  if(!rascunhoUsuario)return;
  try{const db=await bancoCopiaChecklist();const dados={clientes:CLIENTES,visitas:VISITAS,modelos:MODELOS_CHECKLIST,itens:TODOS_ITENS_CHECKLIST,perfil:PERFIL_USUARIO};await new Promise((resolve,reject)=>{const tx=db.transaction('copias','readwrite');tx.objectStore('copias').put(dados,rascunhoUsuario);tx.oncomplete=resolve;tx.onerror=()=>reject(tx.error);});db.close();}catch(e){dispararAutomacao('Cópia offline indisponível','As respostas pendentes continuam na fila local, mas não foi possível preparar a consulta dos checklists sem internet.');}
}
async function restaurarCopiaChecklist(){
  try{const db=await bancoCopiaChecklist();const d=await new Promise((resolve,reject)=>{const r=db.transaction('copias').objectStore('copias').get(rascunhoUsuario);r.onsuccess=()=>resolve(r.result);r.onerror=()=>reject(r.error);});db.close();if(!d)return false;CLIENTES.splice(0,CLIENTES.length,...d.clientes);VISITAS=d.visitas;MODELOS_CHECKLIST=d.modelos;TODOS_ITENS_CHECKLIST=d.itens;Object.assign(PERFIL_USUARIO,d.perfil);aplicarRascunhosLocais();return true;}catch(e){return false;}
}
window.addEventListener('online',()=>{sincronizarRascunhos().then(()=>{if(telaAtual==='visitas')renderTela();});});
window.addEventListener('beforeunload',e=>{if(rascunhoErroLocal){e.preventDefault();e.returnValue='';}});
document.addEventListener('visibilitychange',()=>{if(document.visibilityState==='hidden')salvarCopiaChecklist();});
