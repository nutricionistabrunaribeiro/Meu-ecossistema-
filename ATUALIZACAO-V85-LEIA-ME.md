# Meu Ecossistema • Bruna Ribeiro — Versão 85

## Novidade: compromissos recorrentes na Agenda

Agora você pode criar uma sequência de compromissos de uma só vez, sem precisar cadastrá-los diariamente.

### Como usar

1. Acesse **Trabalho → Agenda** e toque para adicionar um compromisso.
2. Escolha o tipo de compromisso. Para o exemplo da Shopee, escolha **Demanda administrativa**.
3. Em **Qual é o compromisso?**, escreva, por exemplo, `Publicar produto Shopee`.
4. Defina a **data de início** e o horário.
5. Em **Repetir este compromisso?**, selecione **Todos os dias**.
6. Em **Por quanto tempo?**, escolha **30 dias**, **60 dias**, **90 dias** ou informe uma duração personalizada (de 1 a 365 dias).
7. Confira a quantidade de ocorrências e toque em **Criar compromissos**. Confirme a criação.

Também é possível repetir **de segunda a sexta** ou **uma vez por semana** durante o período escolhido.

### Como os registros funcionam

- A data de início conta como primeiro dia do período, quando corresponde à frequência escolhida.
- Os compromissos são inseridos na Agenda como **registros individuais**, para que você conclua cada dia separadamente.
- Caso um compromisso idêntico já exista no mesmo dia, horário, tipo e cliente, a criação ignora essa data para evitar duplicação.
- A sincronização continua usando a mesma tabela de compromissos do Supabase. **Não é necessário executar SQL nem criar novas tabelas.**
- A criação em sequência não cria um vínculo de edição ou exclusão em massa. Cada ocorrência é administrada individualmente.

### Publicação

Use o `index.html` desta pasta na atualização do seu repositório do GitHub. Após a publicação na Vercel, atualize o aplicativo no iPhone.

Esta versão preserva o módulo **Supervisão**, o planner semanal das nutricionistas e os relatórios mensal e anual.
