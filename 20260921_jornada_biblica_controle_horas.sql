create table if not exists public.biblia_capitulos_lidos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  livro text not null check (char_length(btrim(livro)) between 1 and 80),
  capitulo smallint not null check (capitulo between 1 and 150),
  lido_em timestamptz not null default now(),
  unique (user_id, livro, capitulo)
);

create index if not exists biblia_capitulos_lidos_user_idx
  on public.biblia_capitulos_lidos (user_id, livro, capitulo);

alter table public.biblia_capitulos_lidos enable row level security;
revoke all on table public.biblia_capitulos_lidos from anon;
grant select, insert, update, delete on table public.biblia_capitulos_lidos to authenticated;

create policy biblia_select_propria on public.biblia_capitulos_lidos
  for select to authenticated using ((select auth.uid()) = user_id);
create policy biblia_insert_propria on public.biblia_capitulos_lidos
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy biblia_update_propria on public.biblia_capitulos_lidos
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
create policy biblia_delete_propria on public.biblia_capitulos_lidos
  for delete to authenticated using ((select auth.uid()) = user_id);
create policy ecossistema_acesso_exclusivo on public.biblia_capitulos_lidos
  as restrictive for all to public
  using ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid)
  with check ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid);

create table if not exists public.controle_horas (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  tipo text not null check (tipo in ('visita','administrativo','treinamento','auditoria','deslocamento')),
  carteira text not null check (carteira in ('bruna_ribeiro','saber_nutrir','pessoal')),
  cliente_id uuid references public.clientes(id) on delete set null,
  observacao text check (observacao is null or char_length(observacao) <= 500),
  inicio timestamptz not null default now(),
  fim timestamptz,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  check (fim is null or fim >= inicio)
);

create unique index if not exists controle_horas_uma_ativa_por_usuario_idx
  on public.controle_horas (user_id) where fim is null;
create index if not exists controle_horas_user_inicio_idx
  on public.controle_horas (user_id, inicio desc);
create index if not exists controle_horas_cliente_idx
  on public.controle_horas (cliente_id) where cliente_id is not null;

alter table public.controle_horas enable row level security;
revoke all on table public.controle_horas from anon;
grant select, insert, update, delete on table public.controle_horas to authenticated;

create policy controle_horas_select_propria on public.controle_horas
  for select to authenticated using ((select auth.uid()) = user_id);
create policy controle_horas_insert_propria on public.controle_horas
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy controle_horas_update_propria on public.controle_horas
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
create policy controle_horas_delete_propria on public.controle_horas
  for delete to authenticated using ((select auth.uid()) = user_id);
create policy ecossistema_acesso_exclusivo on public.controle_horas
  as restrictive for all to public
  using ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid)
  with check ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid);
