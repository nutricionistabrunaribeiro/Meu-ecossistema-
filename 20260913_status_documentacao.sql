-- Situação operacional simples, independente do cálculo automático de validade.
alter table public.documentacao_cliente
  add column if not exists status_operacional text not null default 'arquivado';

alter table public.documentacao_cliente
  drop constraint if exists documentacao_cliente_status_operacional_check;

alter table public.documentacao_cliente
  add constraint documentacao_cliente_status_operacional_check
  check (status_operacional in ('arquivado', 'pendente'));

create index if not exists idx_documentacao_cliente_status_operacional
  on public.documentacao_cliente (cliente_id, status_operacional);
