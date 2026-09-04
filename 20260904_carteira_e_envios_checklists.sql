-- V16 — carteira Saber Nutrir e controle mensal de envios
alter table public.clientes
  add column if not exists recebe_checklist_mensal boolean not null default false;

-- Os estabelecimentos já cadastrados como vinculados entram no controle;
-- podem ser desativados individualmente pela interface.
update public.clientes
set recebe_checklist_mensal = true
where tipo_cliente = 'vinculado'
  and recebe_checklist_mensal = false;

create table if not exists public.checklist_envios_mensais (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  cliente_id uuid not null references public.clientes(id),
  competencia date not null,
  status text not null default 'pendente'
    check (status in ('pendente','enviado')),
  enviado_em timestamptz,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  constraint checklist_envios_mensais_competencia_inicio
    check (competencia = date_trunc('month', competencia)::date),
  constraint checklist_envios_mensais_unico
    unique (user_id, cliente_id, competencia)
);

create index if not exists checklist_envios_mensais_usuario_competencia_idx
  on public.checklist_envios_mensais (user_id, competencia desc);

create index if not exists checklist_envios_mensais_cliente_competencia_idx
  on public.checklist_envios_mensais (cliente_id, competencia desc);

alter table public.checklist_envios_mensais enable row level security;

drop policy if exists "Usuaria visualiza seus envios mensais" on public.checklist_envios_mensais;
create policy "Usuaria visualiza seus envios mensais"
on public.checklist_envios_mensais for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Usuaria inclui seus envios mensais" on public.checklist_envios_mensais;
create policy "Usuaria inclui seus envios mensais"
on public.checklist_envios_mensais for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Usuaria atualiza seus envios mensais" on public.checklist_envios_mensais;
create policy "Usuaria atualiza seus envios mensais"
on public.checklist_envios_mensais for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

drop policy if exists "Usuaria exclui seus envios mensais" on public.checklist_envios_mensais;
create policy "Usuaria exclui seus envios mensais"
on public.checklist_envios_mensais for delete
to authenticated
using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.checklist_envios_mensais to authenticated;

