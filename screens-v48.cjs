const fs=require('fs'),vm=require('vm');const html=fs.readFileSync('index.html','utf8');
const inline=[...html.matchAll(/<script[^>]*>([\s\S]*?)<\/script>/g)].map(x=>x[1]).join('\n').replace('iniciarApp();','');
const element=()=>({style:{setProperty(){}},classList:{add(){},remove(){},toggle(){}},innerHTML:'',querySelectorAll:()=>[],addEventListener(){},setAttribute(){}});
const elements={};const document={getElementById:id=>elements[id]||(elements[id]=element()),querySelectorAll:()=>[],querySelector:()=>null,documentElement:element(),body:element(),addEventListener(){}};
const window={addEventListener(){},matchMedia:()=>({matches:false}),innerWidth:1280,navigator:{},supabase:{createClient:()=>({})}};
const ctx=vm.createContext({window,document,navigator:{onLine:true},console,Date,Set,Map,WeakMap,Promise,URL,Blob,setTimeout:()=>0,clearTimeout(){},setInterval:()=>0,sessionStorage:{getItem:()=>null,setItem(){}},localStorage:{getItem:()=>null,setItem(){}},location:{},alert(){},confirm:()=>false});
vm.runInContext(fs.readFileSync('proximos-passos.js','utf8'),ctx);vm.runInContext(inline,ctx);
let failed=0;for(const area of ['trabalho','pessoal']){const ids=vm.runInContext(`MODULOS.${area}.flatMap(g=>g.itens.map(m=>m.id))`,ctx);for(const id of ids){try{vm.runInContext(`espacoAtual='${area}';telaAtual='${id}';renderTela()`,ctx);console.log('OK',area,id)}catch(e){failed++;console.log('FAIL',area,id,e.message)}}}process.exitCode=failed?1:0;
