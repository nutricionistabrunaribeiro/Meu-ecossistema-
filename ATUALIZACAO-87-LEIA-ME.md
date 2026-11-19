# Meu Ecossistema • Bruna Ribeiro — Versão 87

## 1. Supervisão: os seis indicadores podem ser abertos

No menu **Trabalho → Supervisão**, toque nos cards para consultar as relações:

- **Treinamentos realizados:** cliente, tema, data e validade, quando houver.
- **Treinamentos programados:** cliente, tema e data prevista.
- **Treinamentos vencidos:** mantém a lista expansível que já funcionava.
- **A vencer em 30 dias:** cliente, tema, data do último treinamento e validade.
- **Visitas técnicas:** relação agrupada por cliente; toque em um cliente para ver datas e registros.
- **Visitas de supervisão:** agrupamento por cliente com identificação de Bruna ou da nutricionista responsável, quando a visita foi registrada pelo planner da equipe.

Os detalhes respeitam os filtros do painel: **ano**, **Todos**, **Saber Nutrir** e **Bruna Ribeiro**.

## 2. Abertura mais eficiente

O aplicativo deixou de esperar que dezenas de módulos fossem buscados um depois do outro. Agora:

- Carrega o perfil, o tema e o cadastro de clientes, necessários aos demais módulos.
- Busca até seis módulos independentes ao mesmo tempo.
- Carrega os modelos de checklist **antes** das visitas e mantém a sincronização dos rascunhos depois do carregamento.
- Mostra um indicador discreto de progresso enquanto prepara as informações.
- Mantém as consultas ao mesmo Supabase; nenhuma tabela nova ou migração é necessária.

A melhoria reduz o tempo acumulado das consultas, mas a velocidade final também depende da internet e do volume de dados no aparelho. O aplicativo continua aguardando os registros terminarem de carregar antes de liberar o uso normal, para evitar edições sobre dados incompletos.

## 3. Testes locais

- Sintaxe JavaScript dos scripts do aplicativo.
- Abertura dos cinco novos cards, incluindo filtros, detalhes e estados vazios.
- Preservação do card de treinamentos vencidos.
- Concorrência limitada a seis módulos e dependência dos checklists.
- Agenda recorrente: sem duplicações e com virada de ano.
- Histórico mensal de Asseio Pessoal e relatório PDF preservados.

## Como publicar

Use o `index.html` desta pasta para atualizar o arquivo correspondente no GitHub. Aguarde a publicação da Vercel e, se necessário, reabra o aplicativo instalado no iPhone para carregar a versão nova.
