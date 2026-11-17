# Meu Ecossistema • Bruna Ribeiro — Atualização 77

## Cronograma da equipe e visitas por treinamento

### 1. Cronograma da equipe em Supervisão

- Acesse **Trabalho → Supervisão → Cronograma da equipe**.
- Expanda o campo e clique em **+ Programar visita da equipe**.
- Informe **cliente, responsável, data, horário e situação**. A pessoa responsável pode ser Mari, Gleice, Ana Cristina ou outro nome digitado.
- A visita pode ficar **Programada** ou **Realizada**, com opção de editar, concluir, reabrir e excluir posteriormente.
- Use as setas para navegar entre os meses. A carteira **Todos / Saber Nutrir / Bruna Ribeiro** continua filtrando a lista e os números.
- As visitas da equipe ficam salvas na estrutura de Agenda já existente no Supabase, sincronizadas entre aparelhos, porém **não entram como compromissos na agenda pessoal da Bruna**.

### 2. Agenda inteligente considera toda a cobertura

Para cada cliente ativo que tenha uma frequência mensal ou semanal definida, a Agenda inteligente soma:

1. Visitas da Bruna programadas para o mês ou já concluídas.
2. Visitas do cronograma da equipe programadas para o mês ou já concluídas.
3. Treinamentos com cliente e data, programados ou realizados.

O mesmo treinamento, se ocorrer no dia de uma visita própria já cadastrada para o cliente, não duplica a cobertura. Visitas que já ficaram para trás e continuam **não concluídas** deixam de cobrir a meta do mês, até serem reprogramadas ou realizadas.

O painel sugere somente os clientes com **menos visitas cobertas do que a meta prevista**. O botão **Programar** abre diretamente o cronograma da equipe, com o cliente selecionado.

### 3. Treinamento realizado também conta como visita

- Ao cadastrar na Agenda, selecione o tipo **Treinamento**, vincule um **cliente** e marque como **Concluído** após aplicar.
- O treinamento aparece como **um treinamento realizado** e também como **uma visita realizada** no controle de Supervisão.
- Se houver dois treinamentos no mesmo cliente e dia, eles geram **dois registros de treinamento**, mas **uma visita**.
- Se a Bruna já registrou uma visita ao mesmo cliente e dia, o treinamento não soma uma segunda visita própria.
- Treinamentos programados alimentam a cobertura futura, mas só viram visitas realizadas após a conclusão.
- O prazo padrão de seis meses e a renovação pelo treinamento mais recente continuam como antes.

### 4. Indicadores e PDF

- O painel conserva os **seis indicadores** da atualização 76 e exibe uma linha com o **total de visitas realizadas**, das quais identifica quantas foram feitas pela equipe.
- As visitas da equipe entram no indicador de **Visitas de supervisão** e no total geral de visitas.
- No relatório anual em PDF, a seção de visitas de supervisão identifica **data, cliente e responsável**, diferenciando Bruna e integrantes da equipe.
- As visitas técnicas continuam resumidas por cliente; os detalhes ficam para supervisões e treinamentos.

### Instalação

Substitua no GitHub o arquivo `index.html` pela versão presente nesta pasta e aguarde a atualização da Vercel. O pacote contém também as melhorias anteriores da versão 76.

**Banco de dados:** esta versão reutiliza a tabela `eventos` já empregada pelo aplicativo. Não requer executar um novo arquivo SQL.
