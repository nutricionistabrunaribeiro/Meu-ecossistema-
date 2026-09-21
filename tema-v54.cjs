const fs = require('fs');
const assert = require('assert');

const html = fs.readFileSync('index.html', 'utf8');
const sw = fs.readFileSync('service-worker.js', 'utf8');

assert.match(html, /me-tema-interface/);
assert.match(html, /data-tema-interface="escuro"/);
assert.match(html, /function definirTemaInterface\(escolha\)/);
assert.match(html, /function alternarTemaRapido\(\)/);
assert.match(html, /\['claro','☀','Claro'\],\['escuro','☾','Escuro'\],\['automatico','◐','Automático'\]/);
assert.match(html, /id="themeToggle"/);
assert.match(sw, /meu-ecossistema-v57/);

console.log('PASS: modos claro, escuro e automático com persistência local.');
