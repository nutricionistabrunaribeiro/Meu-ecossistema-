# Plano Mestre de Evolução — Meu Ecossistema

Solicitação de Bruna Ribeiro: incorporar o conjunto de melhorias propostas, com prioridade à integridade dos dados. Este documento separa **implementado na v65**, **recursos já existentes que precisam ser refinados** e **trabalho planejado**. Não confundir planejamento com funcionalidades entregues.

| Frente | Situação | Próxima implementação / critério de aceite |
|---|---|---|
| Extintores por cliente | **V65 pronta** | Registros individuais com datas e situação em documentação; testar com cliente real. |
| Calendário de vencimentos documentais | **Já existia, aproveitado na v65** | Validar alertas de 30 e 15 dias em dispositivos distintos. |
| Backup manual e conferência JSON | **Já existia; ampliado na v65** | Testar exportação completa e incluir anexos do Storage em processo administrativo. |
| Restauração segura do backup | **Planejada** | Prévia do conteúdo, checagem de titularidade, deduplicação, transação/rollback e teste em ambiente separado antes de permitir produção. |
| Backup automático e histórico de versões | **Planejado** | Rotina agendada no servidor, retenção, criptografia, verificação de recuperação e controle de acesso. |
| Sincronização e conflitos entre aparelhos | **Parcial; revisar** | Matriz de testes com dois aparelhos e operações concorrentes, sobretudo checklists e documentos. |
| Lixeira e histórico de alterações | **Planejado** | Exclusão lógica, recuperação e auditoria por usuário, com política de retenção. |
| Busca universal | **Planejada** | Busca por clientes, documentos, compromissos, tarefas e reflexões com filtros e autorização. |
| Alertas inteligentes | **Parcial (indicadores no app); ampliar** | Preferências por antecedência e canal; push depende de permissões e infraestrutura. |
| Central de comando e painel executivo | **Já há dashboards; refinar** | Consolidar prioridades reais e acessos rápidos, sem cards duplicados. |
| Relatórios profissionais e exportações | **Parcial; ampliar** | Filtros por cliente/período; PDF/CSV e evidências; testes de integridade. |
| Financeiro e previsão de caixa | **Parcial; ampliar** | Receitas previstas/confirmadas, recorrências, inadimplência, cenários, sem misturar contas pessoais e profissionais. |
| Planejamento de vida 2026–2027 | **Módulo anterior; revisar publicação** | Conferir visibilidade, metas, marcos e indicadores reais na versão ativa. |
| Jornada Bíblica e ciclos de leitura | **V64** | Preservar ciclos, capítulos e versículos; validar cálculo por tradução/cânon escolhido. |
| Devocional anual de dezembro | **Há arquivos e automação de preparo** | Integrar a interface, revisar edição anual, compartilhar/imprimir e controlar atualização. |
| Modo offline confiável | **Parcial; ampliar** | Fila de sincronização, resolução de conflitos e aviso claro de alterações pendentes. |
| Segurança e permissões | **Revisão pendente** | Auditoria de RLS, permissões por cliente, exposição de dados, anexos, sessões e política de backups. |

## Sequência recomendada

**V65 — feita:** extintores por cliente e melhoria na cobertura do backup manual.

**V66 — proteção dos dados:** auditoria de backup, restauração em ambiente de teste, lixeira e histórico.

**V67 — sincronização:** conflitos, offline e testes de dois aparelhos.

**V68 — rotina inteligente:** busca universal e avisos configuráveis.

**V69 — trabalho e dinheiro:** relatórios, documentos, central de comando e previsão de caixa.

**V70 — pessoal e espiritual:** planejamento anual, evolução da Jornada Bíblica e devocionais anuais.

Cada versão depende de testes e das permissões de banco necessárias. Não ativar restauração ou escrita em massa sem um backup verificado e aprovação da usuária.
