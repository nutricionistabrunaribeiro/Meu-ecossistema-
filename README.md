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

## Rodada V14 — Validade por item

- validade opcional e individual em todos os itens do checklist;
- seleção pelo calendário visual, com opção de alterar ou remover;
- salvamento automático no rascunho e persistência no Supabase;
- validade exibida junto ao item nos novos PDFs, antes das fotos.

## Rodada V15 — Galeria e Asseio Pessoal

- câmera e galeria disponíveis separadamente nos itens do checklist;
- Controle Mensal de Asseio Pessoal dentro de cada cliente;
- cadastro nominal e ativação/inativação de colaboradores;
- verificações por visita com 12 critérios, observações, fotos e autosave;
- relatório mensal consolidado com percentual, histórico e evidências fotográficas;
- opção de manter ou ocultar nomes no PDF destinado ao cliente.

## Rodada V16 — Carteira Saber Nutrir e envios mensais

- estabelecimentos vinculados organizados somente dentro da contratante;
- vinculados preservados na Agenda, nas rotas e na contagem de visitas;
- vinculados removidos da lista principal e do seletor de checklists operacionais;
- controle mensal simples com os estados `Pendente` e `Enviado`;
- resumo no Dashboard e matriz anual dentro da Saber Nutrir;
- ativação individual para estabelecimentos que recebem checklist mensal, mesmo sem visita;
- texto do asseio atualizado para “Barba e bigode totalmente aparados”;
- identidade complementar no menu: Trabalho verde/laranja e Pessoal laranja/verde.

## Rodada V17 — Entregas multiclientes

- novo módulo `Entregas` no menu Trabalho;
- uma entrega pode ser vinculada a um ou vários clientes;
- prazo escolhido no calendário visual;
- baixa individual por cliente, com histórico de concluídas;
- edição da entrega e da seleção de clientes, além de exclusão com confirmação;
- sinalização de entregas atrasadas;
- resumo das entregas abertas, clientes pendentes e próximos prazos no Dashboard;
- apenas comandos e acompanhamento: nenhum arquivo é armazenado no aplicativo.

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
