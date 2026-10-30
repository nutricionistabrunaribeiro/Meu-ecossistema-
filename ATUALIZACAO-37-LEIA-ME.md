# Meu Ecossistema — Atualização 37

Esta versão consolida a versão 36 com as seguintes mudanças:

1. **Clientes ativos e inativos** — novo botão **Arquivar como inativo / Reativar cliente** na ficha, com persistência no campo `status` da tabela `clientes`, já existente. Não exclui o cadastro nem seu histórico.
2. **Filtros na lista de Clientes** — Ativos, Inativos e Todos, com busca funcional; listagem por nome em ordem alfabética. Clientes vinculados continuam acessíveis pela carteira da contratante, inclusive quando inativos.
3. **Seleções novas** — clientes inativos ocultos na Agenda, controle de horas, novos checklists e seletores compartilhados usados para entregas/projetos; o histórico e vínculos já criados continuam preservados. Clientes ativos aparecem em A–Z.
4. **Identidade do menu** — título `Meu Ecossistema`, subtítulo `Bruna Ribeiro` (sem `Consultoria`); mantém o desenho da logo, com preenchimento sólido na cor principal do tema, sem degradê.
5. **Pausa para Inspirar** — acabamento visual editorial para os quatro cards e botão `Visualizar para postar`; prévia vertical e exportação PNG 1080 × 1350 diretamente no aparelho, incluindo compartilhamento nativo quando suportado.

## Publicação

- Faça um backup da versão atual no GitHub antes de substituir os arquivos.
- Substitua o `index.html` e preserve os arquivos de imagem do projeto. O ZIP inclui os ícones existentes, sem alterar seu desenho.
- Publicação no Vercel: use o fluxo habitual do projeto.
- Não é necessária migração do Supabase: a alteração usa a coluna `clientes.status` já usada no código.
- Teste a inativação em um cliente de exemplo, crie compromisso e verifique a ausência dele na seleção, depois reative-o.

## Validação realizada

- `node --check` dos scripts inline: aprovado.
- Teste local de ordenação A–Z, filtros e alteração de status com gravação simulada: aprovado.
- Renderização visual isolada do card para postagem nos modos claro/escuro: aprovada.
- Exportação de PNG no navegador Chromium: aprovada (1080 × 1350 pixels).

Ainda não foi feito teste de integração ao vivo com sua conta Supabase nem em Safari real no iPhone.
