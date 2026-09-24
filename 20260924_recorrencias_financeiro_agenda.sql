-- V60 — Recorrências Financeiras e da Agenda
-- Migração incremental: não altera nem remove registros existentes.

alter table public.lancamentos_financeiros
  add column if not exists serie_id uuid,
  add column if not exists serie_tipo text,
  add column if not exists serie_ordem integer,
  add column if not exists serie_total integer,
  add column if not exists serie_frequencia text;

alter table public.contas_pessoais
  add column if not exists serie_id uuid,
  add column if not exists serie_tipo text,
  add column if not exists serie_ordem integer,
  add column if not exists serie_total integer,
  add column if not exists serie_frequencia text;

alter table public.eventos
  add column if not exists serie_id uuid,
  add column if not exists serie_tipo text,
  add column if not exists serie_ordem integer,
  add column if not exists serie_total integer,
  add column if not exists serie_frequencia text;

alter table public.lancamentos_financeiros
  drop constraint if exists lancamentos_financeiros_serie_tipo_check,
  add constraint lancamentos_financeiros_serie_tipo_check
    check (serie_tipo is null or serie_tipo in ('parcelado','recorrente')),
  drop constraint if exists lancamentos_financeiros_serie_frequencia_check,
  add constraint lancamentos_financeiros_serie_frequencia_check
    check (serie_frequencia is null or serie_frequencia in ('diaria','semanal','mensal','anual'));

alter table public.contas_pessoais
  drop constraint if exists contas_pessoais_serie_tipo_check,
  add constraint contas_pessoais_serie_tipo_check
    check (serie_tipo is null or serie_tipo in ('parcelado','recorrente')),
  drop constraint if exists contas_pessoais_serie_frequencia_check,
  add constraint contas_pessoais_serie_frequencia_check
    check (serie_frequencia is null or serie_frequencia in ('diaria','semanal','mensal','anual'));

alter table public.eventos
  drop constraint if exists eventos_serie_tipo_check,
  add constraint eventos_serie_tipo_check
    check (serie_tipo is null or serie_tipo = 'recorrente'),
  drop constraint if exists eventos_serie_frequencia_check,
  add constraint eventos_serie_frequencia_check
    check (serie_frequencia is null or serie_frequencia in ('diaria','semanal','mensal','anual'));

create index if not exists idx_lancamentos_financeiros_serie
  on public.lancamentos_financeiros (serie_id, vencimento);
create index if not exists idx_contas_pessoais_serie
  on public.contas_pessoais (serie_id, vencimento);
create index if not exists idx_eventos_serie
  on public.eventos (serie_id, data);

-- As tabelas já existem e mantêm exatamente os GRANTs e as políticas RLS atuais.
-- Esta migração não amplia nem modifica permissões de acesso.
