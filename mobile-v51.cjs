const fs = require('fs');
const assert = require('assert');

const html = fs.readFileSync('index.html', 'utf8');
const sw = fs.readFileSync('service-worker.js', 'utf8');

assert.match(html, /-webkit-text-size-adjust:100%/);
assert.match(html, /input:not\(\[type="checkbox"\]\).*font-size:16px !important/s);
assert.match(html, /max-height:calc\(100dvh - 20px\)/);
assert.match(html, /agenda-periodo\{grid-template-columns:auto minmax\(0,1fr\) auto\}/);
assert.match(html, /doc-form-modal/);
assert.match(html, /@media\(max-width:800px\)\{\.doc-form-modal \.form-grid\{grid-template-columns:minmax\(0,1fr\)!important\}/);
assert.match(html, /\.doc-form-modal input\[type="date"\]\{width:100%;min-height:46px\}/);
assert.match(html, /class="doc-aplicavel"/);
assert.match(html, /\.pixel-legenda \.legenda-item\{color:var\(--cor-texto\);font-size:12px;font-weight:600;\}/);
assert.match(sw, /meu-ecossistema-v57/);

console.log('PASS: enquadramento geral e cadastro de documentações alinhado no iPhone.');
