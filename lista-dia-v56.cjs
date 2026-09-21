const fs = require('fs');
const assert = require('assert');

const html = fs.readFileSync('index.html', 'utf8');
const sql = fs.readFileSync('20260920_lista_do_dia.sql', 'utf8');
const sw = fs.readFileSync('service-worker.js', 'utf8');

assert.match(html, /\{id:"lista_dia", nome:"Lista do Dia"\}/);
assert.match(html, /async function carregarListaDiaSupabase\(\)/);
assert.match(html, /async function adicionarItemListaDia\(\)/);
assert.match(html, /async function alternarItemListaDia\(id\)/);
assert.match(html, /async function excluirItemListaDia\(id\)/);
assert.match(html, /function listaDiaDashboardHTML\(\)/);
assert.match(html, /\$\{listaDiaDashboardHTML\(\)\}/);
assert.match(html, /await carregarListaDiaSupabase\(\)/);
assert.match(sql, /alter table public\.lista_dia enable row level security/i);
assert.match(sql, /as restrictive for all to public/i);
assert.match(sql, /grant select, insert, update, delete/i);
assert.match(sw, /meu-ecossistema-v57/);

console.log('PASS: Lista do Dia pessoal, Dashboard, persistência e RLS validados.');
