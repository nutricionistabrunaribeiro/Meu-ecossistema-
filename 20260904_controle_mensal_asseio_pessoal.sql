create table if not exists public.asseio_colaboradores (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  nome text not null,
  ativo boolean not null default true,
  criado_em timestamptz not null default now()
);
create index if not exists asseio_colaboradores_user_cliente_idx on public.asseio_colaboradores(user_id, cliente_id);

create table if not exists public.asseio_verificacoes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  data date not null,
  competencia date not null,
  avaliacoes jsonb not null default '[]'::jsonb,
  observacoes text,
  orientacoes text,
  status text not null default 'rascunho' check (status in ('rascunho','finalizada')),
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);
create index if not exists asseio_verificacoes_user_cliente_competencia_idx on public.asseio_verificacoes(user_id, cliente_id, competencia, data);

alter table public.asseio_colaboradores enable row level security;
alter table public.asseio_verificacoes enable row level security;
drop policy if exists asseio_colaboradores_proprietaria on public.asseio_colaboradores;
create policy asseio_colaboradores_proprietaria on public.asseio_colaboradores for all to authenticated
using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
drop policy if exists asseio_verificacoes_proprietaria on public.asseio_verificacoes;
create policy asseio_verificacoes_proprietaria on public.asseio_verificacoes for all to authenticated
using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
grant select, insert, update, delete on public.asseio_colaboradores to authenticated;
grant select, insert, update, delete on public.asseio_verificacoes to authenticated;
