const fs=require('fs'),vm=require('vm'),assert=require('assert');
const html=fs.readFileSync('index.html','utf8'),pp=fs.readFileSync('proximos-passos.js','utf8');
const inline=[...html.matchAll(/<script[^>]*>([\s\S]*?)<\/script>/g)].map(x=>x[1]).join('\n');new vm.Script(inline);new vm.Script(pp);
function fn(name,source=inline){const re=new RegExp('(?:async )?function '+name+'\\(');const start=source.search(re);assert(start>=0,name);const next=source.slice(start+1).search(/\n(?:async )?function /);return next<0?source.slice(start):source.slice(start,start+1+next);}
const ctx=vm.createContext({console,Date,Set,Promise,WeakMap,guardarRascunhoLocal:()=>true,lerRascunhos:()=>({}),enviarRascunho:async()=>true,ENTREGAS:[{id:'e',titulo:'Plano',prazo:'2026-09-20'}],ENTREGA_CLIENTES:[{id:'v',entrega_id:'e',cliente_id:'c',status:'pendente'}],PROXIMOS_PASSOS_CLIENTE:[{id:'p',entrega_id:'e',cliente_id:'c',titulo:'Revisar <FDS>',status:'pendente'}],CLIENTES:[{id:'c',documentacao:[]}],CAMADAS_AGENDA:{prazo:true,vencimento:true,conteudo:true},TREINAMENTOS:[],PRODUTOS_ROTULAGEM:[],LIDERANCA_DELEGACOES:[],CONTEUDOS_MKT:[{titulo:'Post',dataISO:'2026-09-20',status:'agendado'}],normalizarDataISO:v=>v, dataLocalDocumento:v=>v?new Date(v+'T12:00:00'):null,statusAutomaticoDoc:()=> 'Vencido',textoHTML:v=>String(v).replaceAll('<','&lt;').replaceAll('>','&gt;'),dataBR:v=>v,dispararAutomacao:()=>{},renderTela:()=>{}});
for(const name of ['entregaConcluida','itensCalendarioInteligente','documentoStatusPainel','documentosComContexto']) vm.runInContext(fn(name),ctx);
for(const name of ['ppTopicosEntregaHTML','ppSincronizarEntrega','ppMudarStatus'])vm.runInContext(fn(name,pp),ctx);
(async()=>{
assert.equal(vm.runInContext('itensCalendarioInteligente().length',ctx),2);
vm.runInContext("CONTEUDOS_MKT[0].status='publicado'",ctx);assert.equal(vm.runInContext('itensCalendarioInteligente().length',ctx),1);
ctx.supa={from:()=>({update:values=>({eq:async()=>({error:null})})})};
await vm.runInContext("ppMudarStatus('p','concluido')",ctx);assert.equal(ctx.ENTREGA_CLIENTES[0].status,'entregue');assert.equal(vm.runInContext('itensCalendarioInteligente().length',ctx),0);
await vm.runInContext("ppMudarStatus('p','pendente')",ctx);assert.equal(ctx.ENTREGA_CLIENTES[0].status,'pendente');
assert(vm.runInContext('ppTopicosEntregaHTML(ENTREGAS[0])',ctx).includes('&lt;FDS&gt;'));
assert.equal(vm.runInContext("documentoStatusPainel({statusOperacional:'implantado'})",ctx),'Implantado');
ctx.CLIENTES[0].documentacao=[{id:'d',nome:'Água',validade:'2026-09-01'},{id:'excluded',aplicavel:false,validade:'2026-09-01'}];
assert.equal(vm.runInContext('documentosComContexto().length',ctx),1);
ctx.CLIENTES[0].documentacao[0].validade='2027-03-01';assert(vm.runInContext('documentosComContexto()[0].dataValidade.getFullYear()',ctx)===2027);
// Failed database write must leave the action and delivery status unchanged.
ctx.supa={from:()=>({update:()=>({eq:async()=>({error:{message:'offline'}})})})};await vm.runInContext("ppMudarStatus('p','concluido')",ctx);assert.equal(ctx.PROXIMOS_PASSOS_CLIENTE[0].status,'pendente');
console.log('PASS: parsing, avisos, publicação, concluir/reabrir tópicos, falha de gravação, escape de texto, validade, não aplicável e Implantado.');
})().catch(e=>{console.error(e);process.exitCode=1});
