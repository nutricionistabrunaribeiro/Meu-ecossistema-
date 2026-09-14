create table if not exists public.proximos_passos_cliente (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  cliente_id uuid not null references public.clientes(id) on delete cascade,
  origem text not null default 'manual' check (origem in ('checklist','documentacao','manual')),
  origem_id uuid,
  titulo text not null check (char_length(trim(titulo)) > 0),
  observacoes text,
  responsavel text not null default 'bruna' check (responsavel in ('bruna','cliente','terceiro')),
  prioridade text not null default 'media' check (prioridade in ('alta','media','baixa')),
  prazo date,
  status text not null default 'pendente' check (status in ('pendente','andamento','concluido')),
  entrega_id uuid references public.entregas(id) on delete set null,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  concluido_em timestamptz
);
create index if not exists proximos_passos_cliente_user_cliente_idx on public.proximos_passos_cliente(user_id, cliente_id);
create index if not exists proximos_passos_cliente_status_prazo_idx on public.proximos_passos_cliente(status, prazo);
create index if not exists proximos_passos_cliente_cliente_idx on public.proximos_passos_cliente(cliente_id);
create index if not exists proximos_passos_cliente_entrega_idx on public.proximos_passos_cliente(entrega_id) where entrega_id is not null;
create unique index if not exists proximos_passos_cliente_origem_unica_idx on public.proximos_passos_cliente(user_id, cliente_id, origem, origem_id) where origem_id is not null;
alter table public.proximos_passos_cliente enable row level security;
drop policy if exists "Usuaria gerencia proximos passos dos seus clientes" on public.proximos_passos_cliente;
create policy "Usuaria gerencia proximos passos dos seus clientes" on public.proximos_passos_cliente for all to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
grant select, insert, update, delete on public.proximos_passos_cliente to authenticated;
