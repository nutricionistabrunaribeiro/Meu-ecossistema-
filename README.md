# Meu Ecossistema — Bruna Ribeiro Consultoria

Aplicativo web estático (HTML + CSS + JavaScript puro, sem etapa de build),
conectado ao Supabase e preparado para instalação como PWA.

## Rodada V37 — Chegar leve aos 38

- projeto pessoal temporário criado dentro do módulo persistente de Projetos;
- 57 missões iniciais divididas em Casa, Trabalho, Pessoal e Preparação da Folga;
- datas editáveis, inclusão, edição, conclusão, reabertura e exclusão de missões;
- progresso automático, próxima missão e contagem regressiva local até 07/10/2026;
- card responsivo no Dashboard Pessoal durante a preparação;
- Modo Folga automático entre 07/10 e 12/10, sem exibição de tarefas;
- retirada automática do card em 13/10, mantendo o projeto no histórico;
- missões de Trabalho podem ser vinculadas a Entregas existentes sem duplicação;
- Projetos de clientes e projetos pessoais permanecem visualmente separados;
- RLS do módulo de Projetos atualizado para isolamento por usuária;
- cache atualizado para V37.

## Correção V36 — Lista completa de clientes

- novo seletor visual de clientes com pesquisa e rolagem, sem o corte da caixa numerada do navegador;
- lista completa aplicada a Obrigações, Checklists, Projetos, Contratos, Rotas, Produtos/Rotulagem e Liderança;
- Entregas agora usa seleção múltipla visual, com ações para selecionar todos e limpar a seleção;
- identificação de clientes diretos, contratantes e estabelecimentos vinculados à Saber Nutrir;
- funcionamento responsivo no celular, tablet e computador;
- cache atualizado para V36.

## Correção V35 — Instalação no celular

- caminhos dos ícones 192×192 e 512×512 corrigidos no manifest, favicon e service worker;
- ícones declarados também como `maskable` para launchers Android;
- botão visual “Instalar aplicativo” exibido no celular quando ainda não estiver instalado;
- acionamento do instalador nativo do Chrome quando disponível;
- instruções específicas quando o link for aberto pelo navegador interno do WhatsApp;
- cache atualizado para V35.

## Rodada V34 — Contas a pagar no Dashboard

- card de Contas a pagar conectado às despesas do Financeiro Pessoal;
- exibição de descrição, vencimento, valor e alerta por período;
- destaque para contas atrasadas, vencendo hoje, em 7 dias e em 30 dias;
- baixa rápida pelo Dashboard, preservando o lançamento no histórico;
- atalhos para cadastrar uma conta e abrir a lista completa;
- contas vencidas incluídas no aviso principal do Dashboard;
- cache atualizado para V34.

## Correção V33 — Cálculo das ocorrências

- corrigida a variável usada para gerar os dias das rotinas recorrentes;
- Radar volta a contabilizar as rotinas sem interromper a página;
- rotina semanal real validada na competência de setembro de 2026;
- cache atualizado para V33.

## Correção V32 — Radar e Rotinas resilientes

- tratamento individual de registros de datas, obrigações e rotinas;
- campos antigos ou vazios deixam de interromper a aba inteira;
- Radar e Rotinas usam listas seguras mesmo durante a sincronização;
- mensagem técnica visível apenas se ainda houver uma exceção, facilitando diagnóstico definitivo;
- cache atualizado para V32.

## Correção V31 — Planejamento conectado aos dados reais

- sincronização do Planejamento com Agenda, Clientes, Checklists, Entregas, Obrigações e Financeiro a cada abertura;
- Radar e Fechamento usando as mesmas informações já cadastradas nos módulos originais;
- Rotinas automáticas para visitas Saber Nutrir, envios mensais, entregas e obrigações recorrentes;
- rotinas manuais preservadas separadamente, sem exigir recadastro das rotinas do sistema;
- cache V31 para distribuição da integração corrigida.

## Correção V30 — Carregamento isolado do Planejamento

- abertura da estrutura da página separada dos cálculos dos indicadores;
- carregamento independente das abas Radar, Datas, Rotinas e Fechamento;
- falha em um indicador não deixa mais a página inteira vazia;
- alternativa visual para atualizar os dados ou acessar outra aba;
- cache V30 para substituir a versão anterior no PWA.

## Correção V29 — Abertura do Planejamento

- cálculo do Radar e do Fechamento tolerante a registros antigos ou campos vazios;
- leitura independente dos checklists Saber Nutrir, sem bloquear a montagem da página;
- tratamento visual de recuperação caso a conexão seja interrompida durante a abertura;
- cache do PWA atualizado para distribuir a correção imediatamente.

## Rodada V28 — Linha Editorial

- biblioteca editorial dentro do Marketing com 24 pautas completas;
- pilares de Segurança dos Alimentos, Higiene e BPF, Fiscalização, Bastidores, Gestão e Produtos/Rotulagem;
- objetivo, formato, gancho, roteiro e CTA em cada pauta;
- filtros por pilar, criação, edição e exclusão de pautas;
- envio direto para o calendário editorial com escolha da data de publicação;
- persistência real no Supabase pela tabela `linha_editorial`, protegida por RLS.

## Rodada V27 — Planejamento e Fechamento Mensal

- Radar do mês no Dashboard e módulo Planejamento com navegação mensal;
- calendário anual de datas relevantes para nutrição, segurança dos alimentos, higiene e saúde;
- datas editáveis, ocultáveis e extensíveis, repetidas automaticamente nos próximos anos;
- criação de pauta de Marketing a partir de uma data profissional;
- rotinas semanais, mensais e anuais com baixa por ocorrência e histórico preservado;
- fechamento mensal em tela e PDF, incluindo visitas, financeiro, checklists e todas as entregas Saber Nutrir, inclusive clientes sem visita.
- três tabelas novas protegidas por RLS: `datas_profissionais`, `rotinas_recorrentes` e `rotina_execucoes`.

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

## Rodada V18 — Meta fixa de visitas Saber Nutrir

- a frequência individual dos estabelecimentos permanece apenas como referência operacional;
- a meta pessoal da Saber Nutrir não é mais calculada pela soma dos 28 vinculados;
- o Dashboard considera a meta fixa da contratante: 12 visitas por semana e 48 por mês;
- cada visita Saber Nutrir concluída na Agenda abate uma unidade dessa meta.

## Rodada V19 — Agenda visual e Lista de Mercado

- topo da Agenda redesenhado, responsivo e organizado em categorias, camadas e modos de visualização;
- navegação semanal e mensal mais compacta, preservando todos os compromissos e controles existentes;
- Lista de Mercado separada da lista de compras geral;
- inclusão de item e quantidade opcional, marcação, desmarcação, exclusão e limpeza dos comprados;
- resumo e operação rápida da Lista de Mercado no Dashboard geral;
- persistência privada no Supabase, vinculada ao usuário autenticado.

## Rodada V20 — Faixa inteligente da Agenda

- remoção da grade alta e vazia de “Dia inteiro” no celular;
- novo painel compacto “Avisos do período” antes da agenda por horários;
- exibição apenas dos dias que possuem prazos, vencimentos, treinamentos ou conteúdos;
- agrupamento dos avisos por dia, sem alterar nem duplicar os registros existentes;
- layout vertical no celular e compacto com rolagem suave no desktop.

## Rodada V21 — Correção do Dashboard no computador

- formulário rápido da Lista de Mercado ajustado à largura do card;
- campos de item e quantidade mantidos lado a lado;
- botão “Adicionar” reposicionado inteiro em uma linha abaixo;
- textos longos protegidos contra invasão dos cards vizinhos;
- comportamento do celular e dados já cadastrados preservados.

## Rodada V22 — Evolução visual e experiência do sistema

- identidade visual refinada com hierarquia, sombras discretas, verde e laranja da marca;
- menu com ícones, seleção visual e contadores de pendências, entregas, checklists e mercado;
- nova Central de Comando “Hoje” no Dashboard, destacando a próxima ação;
- cards prioritários diferenciados sem exagero de cores;
- botão flutuante no celular para criar compromisso, checklist, pendência, entrega ou item de mercado;
- nova visualização diária da Agenda, otimizada para celular;
- cadastro de compromisso reorganizado: descrição, tipo, cliente, data e horário;
- categoria e cor aplicadas automaticamente de acordo com o tipo e a carteira do cliente;
- central de checklists em andamento com progresso, continuar e excluir;
- indicador de autosave e botão “Salvar agora” dentro do checklist;
- respostas, observações, validades e fotos restauradas ao retomar o preenchimento;
- fotos comprimidas antes do envio e protegidas por usuário no Supabase.

## Rodada V23 — Seleção rápida de clientes nas Entregas

- seleção de todos os clientes digitando `todos`;
- seleção por intervalo, como `1-30`;
- combinação de números e intervalos, como `1, 3, 5-12`;
- exclusão rápida a partir do conjunto completo, como `todos menos 4, 7`;
- funcionamento tanto na criação quanto na edição de uma entrega;
- clientes e entregas já cadastrados permanecem inalterados.

## Rodada V24 — Cabeçalho limpo e sincronização transparente

- remoção da busca global do cabeçalho;
- remoção do sino e do painel interno de notificações;
- avisos rápidos de sucesso e erro continuam aparecendo temporariamente na tela;
- indicador renomeado para `Banco conectado` somente após resposta real do Supabase;
- quando não há internet ou o banco não responde, exibe `Sem sincronização`;
- textos incorretos sobre funcionamento e sincronização offline foram removidos;
- o PWA ainda abre sua estrutura pelo cache, mas requer conexão para carregar e salvar dados.

## Rodada V38 — Calendário documental e visitas por cliente

- calendário visual de documentações no Dashboard, com navegação mensal e detalhes por dia;
- resumo por status: vencidos, até 15 dias, entre 16 e 30 dias, regulares e sem validade;
- explicações objetivas para diferenciar Documentações de Obrigações;
- contador “Realizado no mês” passa a considerar as visitas concluídas vinculadas na Agenda;
- compatibilidade com visitas antigas da Saber Nutrir cadastradas antes do seletor de clientes;
- migração segura para vincular somente registros antigos com correspondência inequívoca, sem excluir compromissos.

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
