const fs = require('fs');
const assert = require('assert');

const html = fs.readFileSync('index.html', 'utf8');
const sw = fs.readFileSync('service-worker.js', 'utf8');

assert.match(html, /function limparCampoDataDocumento\(id\)/);
assert.match(html, /input\.value='';atualizarVisualCampoDataDocumento\(id\)/);
assert.match(html, /const emissao=emissaoISO\?isoParaBRCompleto\(emissaoISO\):null,validade=validadeISO\?isoParaBRCompleto\(validadeISO\):null/);
assert.match(html, /function removerValidadeItem\(visitaId,itemId\)/);
assert.match(html, /item\.validade=null/);
assert.match(html, /class="btn-secundario checklist-date-remove"/);
assert.match(sw, /meu-ecossistema-v57/);

console.log('PASS: datas opcionais podem ser removidas da documentação e do checklist.');
