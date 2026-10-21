# Atualização 14 — vidro, checklist e sono

- Aparência de vidro translúcido em cards e formulários, respeitando as oito paletas.
- Removido o botão duplicado de iniciar atividade da tela Controle de Horas.
- PDF: removida a linha redundante com o nome da marca abaixo do logotipo. O título já utiliza `v.modeloNome` quando disponível.
- Sono: sincronização por usuário com tabela `registros_sono` no Supabase.

**Obrigatório:** executar `SUPABASE-SONO-ATUALIZACAO-14.sql` no SQL Editor do mesmo projeto Supabase antes de testar em dois aparelhos. Registros locais existentes são importados na primeira sincronização; quando há a mesma data na nuvem, a versão da nuvem prevalece no carregamento. Salvar a mesma data em um aparelho sobrescreve a data na nuvem. Sem internet ou sem a tabela, o registro permanece local e pode exigir nova sincronização ao voltar on-line.

**Imagens de fundo** não foram incluídas nesta versão; precisam ser escolhidas/otimizadas e testadas para contraste e carregamento.
