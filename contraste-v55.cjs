const fs = require('fs');
const assert = require('assert');

const html = fs.readFileSync('index.html', 'utf8');
const sw = fs.readFileSync('service-worker.js', 'utf8');

assert.match(html, /html\[data-tema-interface="escuro"\] \.module-explainer/);
assert.match(html, /html\[data-tema-interface="escuro"\] \.doc-month/);
assert.match(html, /html\[data-tema-interface="escuro"\] \.doc-summary-pill\.danger/);
assert.match(html, /html\[data-tema-interface="escuro"\] \.toast/);
assert.match(html, /item\.peso!==undefined&&item\.peso!==null&&item\.peso!==''/);
assert.match(sw, /meu-ecossistema-v57/);

console.log('PASS: contraste V55 preservado na V56.');
