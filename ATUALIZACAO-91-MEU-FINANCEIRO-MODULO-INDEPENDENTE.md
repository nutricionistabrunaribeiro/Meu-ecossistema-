# Atualização V91 — Meu Financeiro como espaço independente

## Navegação e separação
- Adicionado um quarto espaço principal: **Financeiro**, ao lado de Trabalho, Pessoal e Na Presença.
- O módulo Meu Financeiro foi removido da lista de Vida Pessoal e agora aparece exclusivamente no espaço Financeiro.
- Ao abrir o espaço Financeiro, o app direciona diretamente para Meu Financeiro.
- Atalhos internos de contas a pagar também abrem o espaço Financeiro.
- Os registros continuam usando exclusivamente `contas_pessoais`, filtrados pelo `user_id`; o Financeiro da Consultoria continua na tabela própria `lancamentos_financeiros`.

## Layout e uso
- Adicionada uma apresentação própria do Meu Financeiro, seguindo os cartões, superfícies, tipografia e cores já usados pelo Ecossistema.
- Incluído um guia de uso diário com o fluxo de receitas, despesas, baixa de pagamentos e consulta ao agente.
- Incluídas perguntas rápidas para consultar contas atrasadas, vencimentos da semana, saldo calculado e receitas/despesas.

## Limites do agente nesta versão
- O agente continua sendo conversacional por regras locais, não uma IA generativa de linguagem livre.
- Responde a consultas predefinidas usando somente os lançamentos de `contas_pessoais`.
- Não acessa Trabalho, não consulta bancos e não efetua pagamentos.
- A conversa é mantida apenas durante a sessão atual; os lançamentos permanecem salvos no Supabase.

## Banco de dados
- Nenhuma migração SQL necessária.
