-- Referência da estrutura nova da versão 46.
-- Já aplicada no projeto Meu Ecossistema nesta atualização. Não executar novamente.
create table public.pessoal_reflexoes (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 tipo text not null check (tipo in ('motivacao','valor','lembrete','diario','humor')),
 titulo text not null default '' check (char_length(titulo)<=300),
 data date not null default current_date,
 conteudo jsonb not null default '{}'::jsonb check (jsonb_typeof(conteudo)='object'),
 versao integer not null default 1 check (versao>0),
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create index pessoal_reflexoes_owner_data_idx on public.pessoal_reflexoes(user_id,data desc);
create unique index pessoal_reflexoes_humor_dia_idx on public.pessoal_reflexoes(user_id,data) where tipo='humor';
alter table public.pessoal_reflexoes enable row level security;
revoke all on public.pessoal_reflexoes from anon;
grant select,insert,update,delete on public.pessoal_reflexoes to authenticated;
create policy pessoal_reflexoes_select on public.pessoal_reflexoes for select to authenticated using ((select auth.uid())=user_id);
create policy pessoal_reflexoes_insert on public.pessoal_reflexoes for insert to authenticated with check ((select auth.uid())=user_id);
create policy pessoal_reflexoes_update on public.pessoal_reflexoes for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
create policy pessoal_reflexoes_delete on public.pessoal_reflexoes for delete to authenticated using ((select auth.uid())=user_id);
