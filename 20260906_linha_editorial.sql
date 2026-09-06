create table if not exists public.linha_editorial (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  pilar text not null,
  tema text not null,
  objetivo text,
  formato text not null default 'Reels',
  gancho text,
  roteiro text,
  cta text,
  ativo boolean not null default true,
  padrao boolean not null default false,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  unique(user_id, tema)
);
create index if not exists linha_editorial_usuario_pilar_idx on public.linha_editorial(user_id, pilar) where ativo;
alter table public.linha_editorial enable row level security;
grant select, insert, update, delete on public.linha_editorial to authenticated;
drop policy if exists linha_editorial_propria on public.linha_editorial;
create policy linha_editorial_propria on public.linha_editorial for all to authenticated
using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
