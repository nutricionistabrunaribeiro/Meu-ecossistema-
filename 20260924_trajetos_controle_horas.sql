-- V61 — origem e destino no Controle de Horas
-- Campos opcionais para preservar integralmente os registros anteriores.

alter table public.controle_horas
  add column if not exists origem_tipo text,
  add column if not exists origem_cliente_id uuid references public.clientes(id) on delete set null,
  add column if not exists origem_texto text,
  add column if not exists destino_tipo text,
  add column if not exists destino_cliente_id uuid references public.clientes(id) on delete set null,
  add column if not exists destino_texto text;

alter table public.controle_horas
  drop constraint if exists controle_horas_origem_tipo_check,
  add constraint controle_horas_origem_tipo_check
    check (origem_tipo is null or origem_tipo in ('casa','cliente','outro')),
  drop constraint if exists controle_horas_destino_tipo_check,
  add constraint controle_horas_destino_tipo_check
    check (destino_tipo is null or destino_tipo in ('casa','cliente','outro')),
  drop constraint if exists controle_horas_origem_texto_check,
  add constraint controle_horas_origem_texto_check
    check (origem_texto is null or char_length(btrim(origem_texto)) between 1 and 160),
  drop constraint if exists controle_horas_destino_texto_check,
  add constraint controle_horas_destino_texto_check
    check (destino_texto is null or char_length(btrim(destino_texto)) between 1 and 160);

create index if not exists controle_horas_origem_cliente_idx
  on public.controle_horas (origem_cliente_id)
  where origem_cliente_id is not null;

create index if not exists controle_horas_destino_cliente_idx
  on public.controle_horas (destino_cliente_id)
  where destino_cliente_id is not null;

comment on column public.controle_horas.origem_texto is
  'Nome do local preservado no histórico, mesmo se o cadastro do cliente mudar.';
comment on column public.controle_horas.destino_texto is
  'Nome do local preservado no histórico, mesmo se o cadastro do cliente mudar.';

