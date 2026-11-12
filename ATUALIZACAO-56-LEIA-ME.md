# Meu Ecossistema — Consolidação 53–56

**Base utilizada:** `index.html` da versão 52 que a usuária confirmou funcionando, criado a partir do HTML da versão 51, não do antigo pacote 42.

## Publicar com segurança

1. **Faça backup do repositório atual** no GitHub (baixe o ZIP do próprio GitHub ou crie uma tag/commit de recuperação).
2. No repositório da **mesma** instalação do Meu Ecossistema, substitua **somente `index.html`** pelo arquivo da raiz deste pacote.
3. **Não apague os demais arquivos** do GitHub. Os scripts antigos externos continuam necessários. A pasta `REFERENCIAS-NAO-PUBLICAR` serve apenas para referência, não para upload em lote.
4. Aguarde o deploy da Vercel e confira no computador primeiro; em seguida teste no iPhone. Limpe o cache/feche e reabra o PWA se aparecer uma versão antiga.
5. **Não execute SQL de migração.** Esta versão reaproveita tabelas já existentes no Supabase.
6. Caso algo dê errado, volte ao commit anterior do GitHub; **não restaure dados do banco sem validar**.

## O que foi entregue

- **Meu 2027 de forma leve** (Pessoal): projeto baseado no estilo do “Chegar leve aos 38”, com seis áreas, missão de agora, lista de passos editável e progresso discreto. O botão **Criar meu projeto 2027** insere dados somente após clique, nas tabelas de projetos existentes.
- **Resultados da Consultoria** (Trabalho): leitura consolidada mensal de compromissos, checklists, horas, Radar, tempo por cliente e custos de rotas, com exportação PDF. Os valores são os registros carregados, sem inventar retorno financeiro ou taxa de resolução.
- **Minha Clareza:** tela de prévia antes de guardar. Sugestão de categoria por palavras-chave, que pode ser editada pelo usuário; ditado/texto existentes preservados. Não usa IA externa para classificação.
- **Backup:** substituição da confirmação fictícia por arquivo JSON real gerado no dispositivo, consultando tabelas permitidas pela sessão com autenticação e RLS. Inclui contador de registros, erros por tabela e validação não destrutiva do arquivo. **Não** é snapshot completo de Postgres nem backup de anexos do Storage.
- **Segurança:** botão de mudança de senha com Supabase Auth, indicação honesta de biometria não implementada e diagnóstico de disponibilidade dos scripts.
- **Documentação de publicação e recuperação:** inventário de arquivos, checklist, rotina de backup e consulta SQL de auditoria (somente leitura).

## O que não se deve prometer

Não foi ativado agendamento automático de cópias em servidor, nem restauração automática do banco; não foi testado o fluxo de sincronização de checklists em dois dispositivos autenticados. Os arquivos externos ausentes continuam necessários no repositório publicado. Consulte `INVENTARIO-ARQUIVOS.md`.

## Testes locais

`node --check` do JS principal: aprovado. Funções de Plano de Vida, Resultados, Centro de Backup e prévia da Clareza foram renderizadas no Chromium em um teste isolado com dados fictícios, sem estouro horizontal em 390 px. Não houve login real nem alteração de dados de produção.
