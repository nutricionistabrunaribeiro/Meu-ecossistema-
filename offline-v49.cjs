const fs=require('fs'),vm=require('vm'),assert=require('assert'),nodeCrypto=require('crypto');
const memoria={};
const localStorage={getItem:k=>memoria[k]??null,setItem:(k,v)=>{memoria[k]=v}};
const eventos={};
const ctx=vm.createContext({
  console,Date,Promise,Math,JSON,Object,Array,crypto:{randomUUID:nodeCrypto.randomUUID},
  localStorage,navigator:{onLine:false},window:{addEventListener:(n,f)=>eventos[n]=f},
  document:{addEventListener(){},visibilityState:'visible'},indexedDB:{open(){throw Error('não usado neste teste')}},
  dispararAutomacao(){},textoHTML:String,abrirModalSistema(){},fecharModalSistema(){},renderTela(){},confirm:()=>false,
  CLIENTES:[],VISITAS:[],MODELOS_CHECKLIST:[],TODOS_ITENS_CHECKLIST:[],PERFIL_USUARIO:{},telaAtual:'visitas',ultimoSalvamentoChecklist:null
});
vm.runInContext(fs.readFileSync('offline-drafts.js','utf8'),ctx);
(async()=>{
vm.runInContext("rascunhoUsuario='bruna'",ctx);
ctx.visita={id:'v1',clienteId:'c1',clienteNome:'Cliente',status:'agendada',modeloId:'m1',modeloNome:'Principal',data:'17/09/2026',dataAplicacaoISO:'2026-09-17'};
ctx.item={id:'i1',categoria:'Higiene',desc:'Lavatório adequado',resultado:'conforme',obs:'',validade:null,fotos:[]};
assert.equal(vm.runInContext('guardarRascunhoLocal(visita,item)',ctx),true);
let fila=vm.runInContext('lerRascunhos()',ctx);assert.equal(Object.keys(fila).length,1);assert.equal(fila['v1:i1'].payload.resultado,'conforme');
ctx.item.obs='Observação offline';vm.runInContext('guardarRascunhoLocal(visita,item)',ctx);
fila=vm.runInContext('lerRascunhos()',ctx);assert.equal(Object.keys(fila).length,1);assert.equal(fila['v1:i1'].payload.observacao,'Observação offline');
assert.match(vm.runInContext('statusRascunhoTexto()',ctx),/1 resposta/);
ctx.VISITAS.push({...ctx.visita,checklist:[{...ctx.item,obs:''}]});vm.runInContext('aplicarRascunhosLocais()',ctx);assert.equal(ctx.VISITAS[0].checklist[0].obs,'Observação offline');
ctx.navigator.onLine=true;
let gravado=null;
ctx.supa={from:t=>t==='visitas'?{select:()=>({eq:()=>({maybeSingle:async()=>({data:{status:'agendada'},error:null})})})}:{select:()=>({eq:()=>({maybeSingle:async()=>({data:null,error:null})})}),upsert:p=>({select:()=>({single:async()=>{gravado=p;return {data:{...p,atualizado_em:'agora'},error:null}}})})}};
assert.equal(await vm.runInContext("enviarRascunho(lerRascunhos()['v1:i1'])",ctx),true);
assert.equal(gravado.observacao,'Observação offline');assert.equal(Object.keys(vm.runInContext('lerRascunhos()',ctx)).length,0);
console.log('PASS: rascunho offline, atualização local, restauração e envio confirmado.');
})().catch(e=>{console.error(e);process.exitCode=1});
