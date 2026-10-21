-- Execute no SQL Editor do projeto Supabase usado pelo Meu Ecossistema.
create table if not exists public.registros_sono (
  user_id uuid not null references auth.users(id) on delete cascade,
  data date not null,
  dormir text not null,
  acordar text not null,
  horas numeric(4,1) not null,
  qualidade text not null default 'Boa',
  updated_at timestamptz not null default now(),
  primary key(user_id,data)
);
alter table public.registros_sono enable row level security;
drop policy if exists "sono_select_own" on public.registros_sono;
create policy "sono_select_own" on public.registros_sono for select to authenticated using (auth.uid() = user_id);
drop policy if exists "sono_insert_own" on public.registros_sono;
create policy "sono_insert_own" on public.registros_sono for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "sono_update_own" on public.registros_sono;
create policy "sono_update_own" on public.registros_sono for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
