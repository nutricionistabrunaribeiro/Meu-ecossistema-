# Atualização V90 — Meu Financeiro com agente conversacional

- O módulo pessoal antes chamado “Financeiro” passa a se chamar “Meu Financeiro”.
- O acesso ao Financeiro foi retirado da navegação do espaço Trabalho.
- A área pessoal mantém sua tabela `contas_pessoais`, separada da tabela de lançamentos da Consultoria.
- Foi incluída uma interface de conversa com o Agente Financeiro, que analisa exclusivamente os lançamentos manuais registrados em `contas_pessoais`.
- O agente responde sobre saldo calculado dos lançamentos efetivados, receitas, despesas, contas atrasadas e vencimentos dos próximos sete dias.
- Os lançamentos continuam sendo criados manualmente pelos botões de nova receita e nova despesa.

## Limites desta primeira versão

O agente é uma camada conversacional local baseada em regras e nos dados do próprio módulo. Não consulta banco, não acessa dados do Trabalho e não realiza transações. A conversa fica na sessão atual; os lançamentos permanecem persistidos na tabela pessoal já existente.

## Banco de dados

Não requer migração SQL. Reutiliza a tabela `contas_pessoais` e o isolamento por `user_id` já existentes.
