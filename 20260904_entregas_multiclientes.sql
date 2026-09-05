-- V17 — Entregas para um ou vários clientes
create table if not exists public.entregas (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  titulo text not null check (char_length(trim(titulo)) > 0),
  prazo date not null,
  observacoes text,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  unique (user_id, id)
);

create table if not exists public.entrega_clientes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  entrega_id uuid not null,
  cliente_id uuid not null references public.clientes(id),
  status text not null default 'pendente' check (status in ('pendente','entregue')),
  concluido_em timestamptz,
  criado_em timestamptz not null default now(),
  unique (entrega_id, cliente_id),
  foreign key (user_id, entrega_id)
    references public.entregas(user_id, id) on delete cascade
);

create index if not exists entregas_usuario_prazo_idx on public.entregas(user_id, prazo);
create index if not exists entrega_clientes_usuario_status_idx on public.entrega_clientes(user_id, status);
create index if not exists entrega_clientes_cliente_idx on public.entrega_clientes(cliente_id);

alter table public.entregas enable row level security;
alter table public.entrega_clientes enable row level security;

drop policy if exists "Usuaria gerencia suas entregas" on public.entregas;
create policy "Usuaria gerencia suas entregas" on public.entregas
for all to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

drop policy if exists "Usuaria gerencia clientes das suas entregas" on public.entrega_clientes;
create policy "Usuaria gerencia clientes das suas entregas" on public.entrega_clientes
for all to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.entregas to authenticated;
grant select, insert, update, delete on public.entrega_clientes to authenticated;

