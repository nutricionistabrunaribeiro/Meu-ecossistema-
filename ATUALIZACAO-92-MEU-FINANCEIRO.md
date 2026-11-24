# Atualização V92 — Organização mensal e planejamento do Meu Financeiro

## Incluído
- Navegação principal em grade 2×2 e nome curto “Presença”.
- Competência mensal no Meu Financeiro; os lançamentos de outros meses continuam no Supabase e não são removidos ao trocar o mês.
- Abas Resumo, Lançamentos, Planejamento, Metas, Relatórios e Assistente.
- Indicadores de receitas previstas/recebidas, despesas e saldo realizado.
- Visão de evolução dos últimos seis meses e distribuição das despesas por categoria.
- Classificação manual de categoria por lançamento.
- Metas com valor-alvo, prazo, aportes, progresso, saldo faltante e sugestão mensal.
- Lembretes manuais com data, horário, conclusão e exclusão, exibidos na Visão Geral.
- Meus Contadores com título, data, descrição e contagem automática, exibidos na Visão Geral.
- O agente existente permanece identificado como gestor_consultor em sua proposta de uso, mas continua sendo um assistente local baseado em regras e nos lançamentos disponíveis; não é uma IA generativa conectada a bancos.

## Persistência nesta entrega
- Lançamentos financeiros permanecem na tabela `contas_pessoais` do Supabase, isolados por `user_id`.
- Categorias, metas, aportes, lembretes e contadores são armazenados no `localStorage` deste navegador/aparelho. Portanto, permanecem após fechar e reabrir o app no mesmo navegador, mas ainda não sincronizam automaticamente entre aparelhos.
- Nenhum registro demonstrativo foi criado e nenhum lançamento existente foi apagado.

## Banco de dados
- Não foi aplicada alteração no Supabase nem é necessária migração para os recursos desta entrega.
