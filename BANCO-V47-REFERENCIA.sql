-- REFERÊNCIA: migração já aplicada ao projeto atual. Não executar novamente.
alter table public.eventos add column if not exists user_id uuid references auth.users(id) on delete cascade default auth.uid();
do $$ begin
 if exists(select 1 from public.eventos where user_id is null) then
  if (select count(*) from public.perfil_usuario) <> 1 then raise exception 'Não foi possível identificar o proprietário dos eventos existentes.'; end if;
  update public.eventos set user_id=(select user_id from public.perfil_usuario limit 1) where user_id is null;
 end if;
end $$;
alter table public.eventos alter column user_id set not null;
create index if not exists eventos_owner_date_widget_idx on public.eventos(user_id,data,hora);
create table public.widget_conexoes (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 nome text not null check(char_length(nome) between 1 and 80),
 token_hash text not null unique check(token_hash ~ '^[0-9a-f]{64}$'),
 escopos text[] not null check(cardinality(escopos) between 1 and 5 and escopos <@ array['agua','habitos','agenda','versiculo','oracao']::text[]),
 preferencias jsonb not null default '{}'::jsonb check(jsonb_typeof(preferencias)='object'),
 revogado boolean not null default false,
 created_at timestamptz not null default now()
);
create index widget_conexoes_owner_idx on public.widget_conexoes(user_id);
alter table public.widget_conexoes enable row level security;
revoke all on public.widget_conexoes from anon;
grant select,insert,update,delete on public.widget_conexoes to authenticated;
create policy widget_owner_select on public.widget_conexoes for select to authenticated using((select auth.uid())=user_id);
create policy widget_owner_insert on public.widget_conexoes for insert to authenticated with check((select auth.uid())=user_id);
create policy widget_owner_update on public.widget_conexoes for update to authenticated using((select auth.uid())=user_id) with check((select auth.uid())=user_id);
create policy widget_owner_delete on public.widget_conexoes for delete to authenticated using((select auth.uid())=user_id);
