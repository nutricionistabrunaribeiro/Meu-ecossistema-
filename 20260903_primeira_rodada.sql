alter table public.lancamentos_financeiros
  add column if not exists data_pagamento date;

alter table public.contas_pessoais
  add column if not exists data_pagamento date;

alter table public.documentacao_cliente
  add column if not exists emissao text;

alter table public.pendencias
  alter column status set default 'aberta';

create index if not exists idx_lancamentos_financeiros_cliente_id
  on public.lancamentos_financeiros (cliente_id);
create index if not exists idx_lancamentos_financeiros_vencimento
  on public.lancamentos_financeiros (vencimento);
create index if not exists idx_contas_pessoais_user_vencimento
  on public.contas_pessoais (user_id, vencimento);
create index if not exists idx_documentacao_cliente_cliente_id
  on public.documentacao_cliente (cliente_id);
create index if not exists idx_etapas_projeto_projeto_id
  on public.etapas_projeto (projeto_id);
create index if not exists idx_checklist_etapa_projeto_etapa_id
  on public.checklist_etapa_projeto (etapa_id);
create index if not exists idx_visitas_cliente_data
  on public.visitas (cliente_id, data);
create index if not exists idx_checklist_respostas_itens_visita_id
  on public.checklist_respostas_itens (visita_id);
create index if not exists idx_eventos_cliente_data
  on public.eventos (cliente_id, data);
create index if not exists idx_pendencias_cliente_id
  on public.pendencias (cliente_id);
