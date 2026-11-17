# Meu Ecossistema • Bruna Ribeiro — Atualização 73

## Entregas profissionais: visitas e treinamentos

O menu **Entregas** passa a incluir um painel visual **Minhas entregas em números**.

- **Visitas realizadas**: contabiliza automaticamente os eventos do tipo *Visita* marcados como concluídos na Agenda; mostra a quantidade por cliente e o total do ano.
- **Registrar visita de supervisão**: oferece um formulário rápido com cliente, data, horário e descrição. O registro é salvo como visita concluída **na Agenda**, sem criar uma segunda fonte de dados.
- **Treinamentos realizados**: contabiliza aqueles marcados como *Realizado*, com data e cliente, somando também participantes.
- **Programação de treinamentos**: formulário com cliente, tema, data, status, participantes, observações e validade/próxima reciclagem; permite editar e cancelar.
- **Validades**: identifica as reciclagens vencidas e as que vencerão nos próximos 30 dias, com base no último treinamento realizado para cada tema/cliente ativo. Treinamentos antigos não geram falsos alertas quando já existe um mais recente para o mesmo tema; registros de clientes inativos permanecem no histórico anual, sem gerar alertas atuais.
- **Controle visual**: filtros para acompanhar programados, vencidos, realizados ou todos.
- **Dashboard Geral**: card resumido de treinamentos, vencimentos e programação, com botão para abrir Entregas.
- **Meu Dia automático**: passa a mostrar treinamentos programados e reciclagens com datas a até sete dias, incluindo atrasados.
- **Fechamento mensal**: mostra treinamentos realizados e participantes, também no PDF do fechamento.
- **Resumo anual**: arquivo PDF por ano com visitas, treinamentos, participantes e outras entregas concluídas, agrupados por cliente.

## Como usar

1. Em **Trabalho → Entregas**, use *Programar treinamento*.
2. Escolha o cliente, tema e a data; informe a validade se houver reciclagem prevista.
3. Quando acontecer, altere a situação para **Realizado** e confira a data da realização.
4. As visitas já concluídas na Agenda aparecerão automaticamente. Use o cadastro rápido somente para uma visita que ainda não esteja registrada.
5. No painel de Entregas, selecione o ano e toque em **Resumo anual em PDF** para baixar o relatório.

## Dados e publicação

Esta versão usa as tabelas já existentes **`eventos`**, **`treinamentos_cliente`**, **`entregas`** e **`entrega_clientes`**. Não exige nenhuma nova tabela ou SQL.

Para publicar, substitua o `index.html` no GitHub e mantenha os arquivos auxiliares que já existem no projeto. O Vercel deve realizar o deploy após a atualização.

**Observação:** as contagens usam os registros disponíveis na conta conectada. Treinamentos anteriores que não estejam cadastrados precisam ser incluídos para entrar no relatório. As visitas já concluídas não devem ser lançadas novamente.
