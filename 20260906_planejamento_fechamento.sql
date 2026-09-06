-- Planejamento anual, datas profissionais e rotinas recorrentes
create table if not exists public.datas_profissionais (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  titulo text not null,
  dia smallint not null check (dia between 1 and 31),
  mes smallint not null check (mes between 1 and 12),
  categoria text not null default 'profissional',
  antecedencia_dias integer not null default 30 check (antecedencia_dias between 0 and 365),
  ativo boolean not null default true,
  padrao boolean not null default false,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  unique(user_id, titulo, dia, mes)
);

create table if not exists public.rotinas_recorrentes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  titulo text not null,
  frequencia text not null check (frequencia in ('semanal','mensal','anual')),
  dia_semana smallint check (dia_semana between 0 and 6),
  dia_mes smallint check (dia_mes between 1 and 31),
  mes smallint check (mes between 1 and 12),
  categoria text not null default 'operacao',
  cliente_id uuid references public.clientes(id) on delete set null,
  ativo boolean not null default true,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create table if not exists public.rotina_execucoes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  rotina_id uuid not null references public.rotinas_recorrentes(id) on delete cascade,
  data_prevista date not null,
  concluida boolean not null default false,
  concluida_em timestamptz,
  criado_em timestamptz not null default now(),
  unique(rotina_id, data_prevista)
);

create index if not exists datas_profissionais_usuario_mes_idx on public.datas_profissionais(user_id, mes) where ativo;
create index if not exists rotinas_recorrentes_usuario_ativas_idx on public.rotinas_recorrentes(user_id) where ativo;
create index if not exists rotina_execucoes_usuario_data_idx on public.rotina_execucoes(user_id, data_prevista);

alter table public.datas_profissionais enable row level security;
alter table public.rotinas_recorrentes enable row level security;
alter table public.rotina_execucoes enable row level security;

grant select, insert, update, delete on public.datas_profissionais to authenticated;
grant select, insert, update, delete on public.rotinas_recorrentes to authenticated;
grant select, insert, update, delete on public.rotina_execucoes to authenticated;

drop policy if exists datas_profissionais_proprias on public.datas_profissionais;
create policy datas_profissionais_proprias on public.datas_profissionais for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

drop policy if exists rotinas_recorrentes_proprias on public.rotinas_recorrentes;
create policy rotinas_recorrentes_proprias on public.rotinas_recorrentes for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);

drop policy if exists rotina_execucoes_proprias on public.rotina_execucoes;
create policy rotina_execucoes_proprias on public.rotina_execucoes for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
