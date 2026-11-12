# Meu Ecossistema — Versão 58 | Somente clientes ativos

**Base:** versão 57. Esta atualização altera apenas o `index.html`.

## O que muda

- **Trabalho → Gestão de Adequações:** exibe apenas informações vinculadas a clientes cujo status é ativo, nas quatro abas (pendências de checklist, não conformidades históricas, manuais e acompanhamentos), no seletor de cliente, nos totais e no PDF. Sem cliente vinculado não entra nos indicadores desta área.
- **Trabalho → Resultados da Consultoria:** compromissos, visitas/checklists, horas, Radar e custos por rota contam apenas registros associados a clientes ativos. O PDF mensal acompanha o mesmo critério.
- Um cliente inativado deixa de aparecer nos indicadores atuais; se for reativado, seus registros históricos voltam a ficar disponíveis automaticamente nas análises, sem migração.
- O cadastro de clientes, o histórico das fichas, outros ambientes e os registros originais **não são excluídos nem modificados**.
- Atividades administrativas sem cliente identificado ficam fora dos dois painéis consolidados. Seus registros originais continuam intactos. Relatórios antigos exportados não são alterados.

## Publicação

Faça backup do commit atual no GitHub. Depois extraia este pacote e **substitua somente o `index.html`** na raiz do repositório atual. Não apague os demais arquivos: versões 51–57 usam scripts e estilos auxiliares que continuam necessários.

Não é preciso executar SQL nem alterar o Supabase para esse ajuste de visualização. Não foram modificados dados reais no banco.

## Teste após publicar

1. Abra Trabalho → Gestão de Adequações. O seletor deve oferecer somente clientes ativos.
2. Confira que registros de clientes inativos não constam das abas nem do resumo geral, mesmo com a seleção "Todos os clientes ativos".
3. Exporte o PDF geral; ele deve conter somente acompanhamentos de clientes ativos.
4. Confira Trabalho → Resultados da Consultoria e seu PDF mensal; históricos de inativos não entram nos totais.
5. Verifique uma ficha de cliente inativo em Clientes: o cadastro e histórico continuam preservados.
6. Se reativar um cliente, os registros reaparecerão nos painéis após atualizar/reabrir a página.

Validação: syntax check de scripts embutidos, integridade ZIP e teste de regras com dados simulados. A consulta com sua sessão real no iPhone depende de validação após deploy.
