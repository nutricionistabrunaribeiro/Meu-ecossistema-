# Atualizacao 02 — GitHub

## Alteracoes
- Indicador de sincronizacao de checklists considera somente a inspeção aberta.
- Reenvio de rascunhos compara os dados com o servidor; respostas identicas nao ficam presas em conflito.
- Tentativa de sincronizar todos os rascunhos, inclusive os marcados como conflito, sem sobrescrever respostas remotas divergentes.
- Finalizacao reexecuta sincronizacao antes de verificar pendencias da inspeção.
- Ajustes visuais no modo escuro.

## Cuidados
Nao foi realizada limpeza destrutiva de respostas locais ou no Supabase. Conflitos verdadeiros continuam exigindo revisao.
Esta versao NAO inclui sincronizacao de sono entre aparelhos: isso exige criacao e validacao de tabela e politicas no Supabase.
O aplicativo deve ser testado no celular e computador apos a publicacao.

## Publicacao
Extraia o ZIP e envie os arquivos extraidos para a raiz da ramificacao principal no GitHub. Confira que index.html e offline-drafts.js constam no commit.
