# Meu Ecossistema — Bruna Ribeiro Consultoria

Aplicativo web estático (HTML + CSS + JavaScript puro, sem etapa de build),
conectado ao Supabase e preparado para instalação como PWA.

## Rodada V12 — Calendário Inteligente

- seletor visual de datas com navegação por mês e ano;
- datas retroativas, futuras, opção “Hoje” e campos sem data;
- prazos, vencimentos, treinamentos e conteúdo exibidos na Agenda sem duplicar registros;
- filtros de camadas e faixa separada de itens do dia inteiro;
- ícones do PWA apontando para a pasta `icons/` e cache atualizado para V12.

## Rodada V13 — Datas do checklist

- calendário visual para escolher a data de aplicação ao iniciar o checklist;
- calendário visual para escolher a data de elaboração/finalização ao concluir;
- datas independentes no banco, na tela do cliente e nos novos PDFs;
- preservação e correção das datas de aplicação dos checklists já existentes.

## Conteúdo do pacote

- `index.html`: aplicação completa;
- `manifest.json`, `service-worker.js` e `icons/`: instalação e funcionamento
  básico em modo offline;
- `supabase/migrations/`: histórico das alterações de estrutura do banco.

## Como publicar na Vercel (sem usar linha de comando)

1. Acesse **vercel.com** e entre na sua conta.
2. No painel, clique em **"Add New..." → "Project"**.
3. Importe o projeto pelo GitHub ou envie esta pasta completa, mantendo
   `icons/` e `service-worker.js` junto do `index.html`.
4. Não precisa configurar nada (sem "Build Command", sem "Install Command") —
   é um site estático puro. Se ela pedir, escolha **"Other"** como framework.
5. Clique em **"Deploy"**.
6. Em menos de um minuto você recebe um link, algo como
   `meu-ecossistema.vercel.app`.

## Atualizando pelo GitHub (sem token)

Substitua todos os arquivos alterados no repositório e faça o commit. A Vercel
detecta a mudança e republica automaticamente.

## Domínio próprio (opcional)

Vercel → Project → Settings → Domains → adicionar o domínio.
