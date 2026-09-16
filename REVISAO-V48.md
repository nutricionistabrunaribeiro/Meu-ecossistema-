# Revisão V48 — 16/09/2026

## Atualização pronta para envio manual ao GitHub

Arquivos de execução alterados: index.html, proximos-passos.js, service-worker.js.
Nenhuma alteração executada no banco de produção. Nenhuma nova migration necessária.
A base desta atualização é o pacote V47 desta conversa. Não houve publicação automática na Vercel.

## Correções

- Avisos da Agenda consultam Entregas e seus clientes em aberto; Pendências e Obrigações antigas não alimentam mais a faixa.
- Publicações continuam no aviso enquanto agendadas e saem ao marcar Publicado.
- Documentos não aplicáveis não geram avisos. O calendário usa a validade atual do registro.
- Ações vinculadas a Entregas aparecem como tópicos, com checkbox, prazo, observação e edição, incluindo vínculos já existentes.
- Concluir todos os tópicos conclui o vínculo daquele cliente; reabrir um tópico reabre o vínculo. Falhas na sincronização são avisadas. As duas gravações não são uma transação única.
- Não é possível marcar o cliente como entregue enquanto há tópicos abertos.
- Proteção contra duplo clique na criação de entrega agrupada.
- Excluir uma entrega libera os vínculos locais das ações, refletindo o ON DELETE SET NULL existente no banco.
- Edição dos clientes da entrega adiciona novos vínculos antes de remover os desmarcados e preserva status e IDs dos mantidos. Bloqueia remoção de cliente com tópicos vinculados.
- Status Implantado restaurado no formulário e na exibição da documentação. O banco publicado já aceita esse valor (verificado por consulta).
- Salvamentos simultâneos do mesmo item de checklist são enfileirados para evitar duas inserções concorrentes.
- Fechamento mensal não corta a lista de entregas em aberto após o vigésimo vínculo.
- Navegação para módulos retirados redireciona ao Dashboard.
- Texto das entregas é escapado; quebra de linha e textos longos são preservados nos tópicos.
- Cache V48: falhas de recursos offline não retornam HTML indevidamente como JavaScript/imagem.

## Testes executados

- Parsing de JavaScript inline, proximos-passos.js e service-worker.js; git diff --check.
- tests/regression-v48.cjs: avisos de entrega, publicação, conclusão/reabertura, erro de gravação, escape de texto, atualização de validade, documento não aplicável, Implantado e concorrência de salvamento.
- tests/screens-v48.cjs: geração das 25 telas principais com dados vazios em DOM simulado. Não equivale a teste visual ou com dados reais autenticados.
- Supabase em modo somente leitura: todas as 52 tabelas públicas listadas com RLS ativo; regras das cinco tabelas ligadas aos fluxos alterados consultadas; restrições de documentação consultadas; advisor de segurança consultado.

## Pontos que permanecem pendentes

1. Segurança: as policies de documentacao_cliente e checklist_respostas_itens permitem todas as operações a qualquer usuário autenticado, sem isolamento por proprietária. RLS ativo sozinho não resolve isso. Necessário mapear a propriedade dos registros e revisar as demais policies antes de substituir regras. Não alterado para evitar bloquear acesso aos dados existentes. Não criar/compartilhar novas contas até resolver esse ponto.
2. Advisor do Supabase: proteção contra senhas vazadas desativada. Configuração não alterada nesta rodada.
3. Teste visual real em desktop, tablet e iPhone, login, upload de fotos e geração de PDFs ainda não executados nesta rodada. O navegador automatizado não pôde ser instalado devido a timeout de rede.
4. Fluxo autenticado de gravação/recarregamento precisa de validação após publicação. Os testes de gravação desta rodada usam respostas simuladas; não foram criados registros fictícios na conta real.
5. Offline completo não está garantido: o aplicativo depende do Supabase e de bibliotecas externas; não há fila persistente de gravações offline. Salvamento interrompido ao fechar o aplicativo também requer revisão específica. Até isso ser tratado, use conexão e confira Salvar agora antes de sair de um checklist.
6. Não houve auditoria exaustiva de todas as funcionalidades ou garantia de ausência de falhas.

## Publicação

Substitua os arquivos na raiz do repositório pelos arquivos do pacote. Não é necessário executar SQL.
Aguarde o deploy da Vercel e reabra o aplicativo.
Valide: Entregas com tópicos → concluir um tópico → concluir os demais → consultar avisos → reabrir tópico; documento → alterar validade → conferir calendário.
