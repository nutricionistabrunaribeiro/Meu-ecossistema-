# Meu Ecossistema • Bruna Ribeiro — versão 53

Meu Plano de Vida: novembro e dezembro de 2026 + todo o ano de 2027.

## O que foi incluído
- Acesso pela Visão Geral e pelo menu geral: Meu Plano de Vida.
- 11 áreas: profissional; finanças; família e filhos; casa; saúde e autocuidado; emocional e identidade; vida espiritual; relacionamentos e rede de apoio; estudos; descanso, lazer e sonhos; marca e projetos próprios.
- 66 sugestões de etapas: uma por área em novembro/2026, dezembro/2026 e em cada trimestre de 2027. Todas começam como sugestão, sem obrigações ou conclusões fictícias.
- Objetivos, ações, critérios, responsáveis, prazos e anotações editáveis; inclusão e exclusão de etapas.
- Situações: Sugestão, Planejada, Em andamento, Concluída e Pausada. O progresso considera apenas etapas escolhidas (planejadas, em andamento e concluídas).
- Rotina diária/semanal/mensal editável e 14 revisões mensais, de novembro/2026 a dezembro/2027, com espaço para três prioridades da próxima semana.
- Exportação/importação de cópia JSON. Imprimir esta visão imprime a tela e os filtros selecionados; para todas as etapas, selecione todas as etapas, áreas e situações.
- Atalhos para os módulos existentes. Não cria compromissos na agenda, lembretes ou lançamentos financeiros automaticamente.

## Como usar
1. Abra Meu Plano de Vida na Visão Geral.
2. Veja sua direção e ajuste com suas palavras.
3. Em Plano por etapa, escolha novembro/2026 e selecione apenas o que cabe agora.
4. Em Editar / acompanhar, ajuste prazos e o que significa concluir cada etapa.
5. Use Ritmo possível para combinar tarefas, apoio e descanso.
6. Na Revisão mensal, registre avanços e escolha até três prioridades para a semana seguinte. A revisão é mensal: a lista de prioridades pode ser atualizada ao longo do mês, sem histórico semanal separado.

## Instalação no aplicativo atual
Este pacote completo foi reunido usando a versão 51 completa e a atualização 52 mais recente. Trabalho, Pessoal e Na Presença foram preservados.

Para aplicar apenas as mudanças da versão 53, envie estes cinco arquivos à raiz do repositório atual, mantendo os demais:
- index.html
- plano-vida.js
- plano-vida-dados.js
- plano-vida.css
- service-worker.js

Não exclua o repositório nem substitua configurações do Supabase. Não é necessário executar SQL para este módulo. Depois do deploy da Vercel, feche e reabra o aplicativo. O novo cache está identificado como versão 53.

## Onde as alterações ficam salvas
O planejamento usa o armazenamento local do navegador, separado pelo identificador da conta conectada. Não há sincronização automática deste módulo com o Supabase. O planejamento do Safari e o aplicativo instalado podem usar espaços diferentes; exporte/importa uma cópia para transportar seu planejamento. Apagar dados do navegador pode apagar as alterações: guarde cópias exportadas. Importe apenas cópias suas; a importação substitui o planejamento local após confirmação.

Os módulos anteriores mantêm o armazenamento que já utilizavam. Os valores financeiros atuais não foram presumidos a partir de conversas antigas. Os prazos e as rotinas sugeridos são pontos de partida, não compromissos confirmados.

## Validação
- Sintaxe JavaScript inline e do módulo verificada.
- Recursos locais referenciados pelo HTML encontrados no pacote.
- Testes de lógica: 66 etapas/11 áreas/6 períodos, filtros, edição, inclusão, exclusão, progresso, persistência local, revisão mensal, rotina, validação de cópias, escape de HTML, separação entre contas, logout e preservação dos dados em falha de armazenamento.
- O navegador de teste não pôde ser iniciado neste ambiente. Não houve validação visual real no Safari, login real nem publicação em GitHub/Vercel.

Meu Ecossistema • Bruna Ribeiro
