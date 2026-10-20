# Atualização 01 — versão de avaliação, NÃO publicar sem testes

Inclui: nova Visão Geral como entrada, preservando dashboards Trabalho/Pessoal; diário manual de sono (armazenamento LOCAL por navegador, sem sincronização); campos de origem e destino no início de deslocamentos; opção de excluir projeto com confirmação; ajuste preliminar de largura dos itens no PDF do checklist.

## Pendências antes da publicação
- Validar autenticação, navegação e persistência com conta de testes.
- Conferir a aplicação da migração `20260924_trajetos_controle_horas.sql` no Supabase.
- Verificar políticas RLS e referências de projetos antes de permitir exclusão definitiva; fazer backup.
- Testar exportação PDF com frases longas, muitas fotos e quebras de página. O PDF ainda não passou por revisão visual completa.
- O diário do sono não está sincronizado e pode ser perdido ao limpar dados do navegador; migrar para Supabase antes de uso regular em vários dispositivos.
- Conferir os indicadores da Visão Geral com dados reais.

Verificação efetuada: sintaxe dos scripts JavaScript extraídos de `index.html` com `node --check`. Não equivale a teste funcional.
