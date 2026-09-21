create table if not exists public.lista_dia (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  item text not null check (char_length(btrim(item)) between 1 and 300),
  concluido boolean not null default false,
  concluido_em timestamptz,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists lista_dia_user_status_idx
  on public.lista_dia (user_id, concluido, criado_em);

alter table public.lista_dia enable row level security;

revoke all on table public.lista_dia from anon;
grant select, insert, update, delete on table public.lista_dia to authenticated;

drop policy if exists lista_dia_select_propria on public.lista_dia;
create policy lista_dia_select_propria on public.lista_dia
  for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists lista_dia_insert_propria on public.lista_dia;
create policy lista_dia_insert_propria on public.lista_dia
  for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists lista_dia_update_propria on public.lista_dia;
create policy lista_dia_update_propria on public.lista_dia
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists lista_dia_delete_propria on public.lista_dia;
create policy lista_dia_delete_propria on public.lista_dia
  for delete to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists ecossistema_acesso_exclusivo on public.lista_dia;
create policy ecossistema_acesso_exclusivo on public.lista_dia
  as restrictive for all to public
  using ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid)
  with check ((select auth.uid()) = 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5'::uuid);
