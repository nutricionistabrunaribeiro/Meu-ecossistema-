-- Permite registrar que um procedimento ou controle operacional já foi implantado.
-- Preserva os valores existentes: arquivado e pendente.
alter table public.documentacao_cliente
  drop constraint if exists documentacao_cliente_status_operacional_check;

alter table public.documentacao_cliente
  add constraint documentacao_cliente_status_operacional_check
  check (status_operacional = any (array['arquivado'::text, 'pendente'::text, 'implantado'::text]));
