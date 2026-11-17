# Meu Ecossistema • Bruna Ribeiro — Atualização 78

## Planner semanal da equipe de Supervisão

Esta atualização parte da versão 77 e mantém a organização visual de **Supervisão** já aprovada.

### O que mudou

- O antigo cronograma de visitas individuais foi substituído por um **planner semanal** dentro do mesmo card de Supervisão.
- As **linhas são as nutricionistas** (Bruna Ribeiro, Mari, Gleice, Meire, Ana Cristina e outras adicionadas por você), e as **colunas são os sete dias da semana**, de segunda a domingo.
- Em cada dia de uma profissional, basta tocar na célula, **selecionar todos os clientes** previstos e salvar de uma vez. Não é necessário preencher horários.
- Você pode navegar para outras semanas e acompanhar a programação da sua própria Agenda na primeira linha.
- Pode incluir novas nutricionistas sem vincular permanentemente profissionais a clientes: a responsável por cada visita é definida na programação daquele dia.
- Visitas programadas podem ser desmarcadas e retiradas do planner mediante confirmação. Visitas já realizadas ficam preservadas e podem ser consultadas ou corrigidas individualmente.
- As visitas da equipe usam a **mesma tabela de eventos já sincronizada** no Supabase. Não é necessária alteração no banco de dados.
- A **Agenda Inteligente** soma sua programação, as visitas da equipe e os treinamentos. Assim, um cliente só aparece como sem cobertura quando faltam visitas em relação à meta mensal cadastrada.
- O painel de **Supervisão** continua com os seis indicadores existentes e agora também informa o total de visitas programadas, sem adicionar novos cards.
- O **Resumo anual em PDF** e os filtros **Todos / Saber Nutrir / Bruna Ribeiro** continuam disponíveis.

### Como usar

1. Acesse **Trabalho → Supervisão**.
2. Abra **Planner semanal das nutricionistas**.
3. Localize a nutricionista na linha e a data na coluna (no iPhone, deslize o planner na horizontal).
4. Toque no quadrinho, escolha um ou vários clientes e clique em **Salvar programação**.
5. Quando a visita acontecer, toque no cliente dentro do planner e escolha **Marcar realizada**.
6. Em **Agenda → Agenda Inteligente**, confira quais clientes ainda precisam de visitas programadas naquele mês.

**Importante:** As visitas programadas alimentam a **cobertura** e os indicadores de **programação**. As **visitas realizadas** e o resumo anual de entregas só aumentam depois que a visita for marcada como concluída. Um treinamento realizado continua contando como visita, conforme a lógica da versão anterior.

### Publicação

Este ZIP contém o `index.html` completo e os arquivos auxiliares da base anterior. Substitua o `index.html` do seu repositório GitHub pelo arquivo desta versão e aguarde a publicação na Vercel.

Os registros atuais não são apagados ou alterados por instalar esta atualização.
