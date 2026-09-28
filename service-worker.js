const CACHE_NAME = 'meu-ecossistema-v62';
const APP_SHELL = [
  '/', '/index.html', '/proximos-passos.js', '/offline-drafts.js',
  '/historico-nao-conforme.js',
  '/manifest.json', '/icon-192.png', '/icon-512.png',
  'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2',
  'https://cdn.jsdelivr.net/npm/jspdf@2.5.1/dist/jspdf.umd.min.js',
  'https://cdn.jsdelivr.net/npm/jspdf-autotable@3.8.2/dist/jspdf.plugin.autotable.js'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => Promise.allSettled(APP_SHELL.map(url => cache.add(url))))
  );
  self.skipWaiting();
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(key => key !== CACHE_NAME).map(key => caches.delete(key))))
      .then(() => self.clients.claim())
  );
});

async function respostaComHistorico(response){
  if(!response || !response.ok) return response;
  const contentType=response.headers.get('content-type')||'';
  if(!contentType.includes('text/html')) return response;

  try{
    const html=await response.text();
    if(html.includes('/historico-nao-conforme.js')) return new Response(html,{status:response.status,headers:response.headers});
    const insercao='<script src="/historico-nao-conforme.js"></script>';
    const atualizado=html.includes('</body>')
      ? html.replace('</body>', `${insercao}</body>`)
      : html + insercao;

    const headers=new Headers(response.headers);
    headers.delete('content-length');
    return new Response(atualizado,{status:response.status,statusText:response.statusText,headers});
  }catch(e){
    return response;
  }
}

self.addEventListener('fetch', event => {
  if(event.request.method !== 'GET') return;

  const url=new URL(event.request.url);
  const ehPagina=url.origin===self.location.origin &&
    (event.request.mode==='navigate' || url.pathname==='/' || url.pathname==='/index.html');

  event.respondWith(
    fetch(event.request)
      .then(async response => {
        if(response.ok && url.origin===self.location.origin){
          const copia=response.clone();
          caches.open(CACHE_NAME).then(cache=>cache.put(event.request,copia));
        }
        return ehPagina ? respostaComHistorico(response) : response;
      })
      .catch(async () => {
        const cached=await caches.match(event.request);
        if(cached) return ehPagina ? respostaComHistorico(cached) : cached;
        const fallback=await caches.match('/index.html');
        return fallback ? respostaComHistorico(fallback) : Response.error();
      })
  );
});
