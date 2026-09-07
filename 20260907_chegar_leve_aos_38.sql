-- Evolução segura do módulo de Projetos para projetos pessoais temporários.
-- Preserva projetos/etapas existentes e associa os registros legados à única
-- conta já cadastrada no Meu Ecossistema.

alter table public.projetos
  add column if not exists user_id uuid references auth.users(id) default auth.uid(),
  add column if not exists categoria text not null default 'cliente',
  add column if not exists data_inicio date,
  add column if not exists data_fim date,
  add column if not exists status text not null default 'ativo',
  add column if not exists atualizado_em timestamptz not null default now();

alter table public.etapas_projeto
  add column if not exists user_id uuid references auth.users(id) default auth.uid(),
  add column if not exists atualizado_em timestamptz not null default now();

alter table public.checklist_etapa_projeto
  add column if not exists user_id uuid references auth.users(id) default auth.uid(),
  add column if not exists data_inicio date,
  add column if not exists data_fim date,
  add column if not exists ordem integer,
  add column if not exists entrega_id uuid references public.entregas(id) on delete set null,
  add column if not exists concluido_em timestamptz,
  add column if not exists atualizado_em timestamptz not null default now();

do $$
declare
  proprietaria uuid;
begin
  select id into proprietaria from auth.users order by created_at limit 1;
  if proprietaria is null then
    raise exception 'Nenhuma usuária cadastrada para associar os projetos existentes.';
  end if;

  update public.projetos set user_id = proprietaria where user_id is null;
  update public.etapas_projeto e
     set user_id = p.user_id
    from public.projetos p
   where e.projeto_id = p.id and e.user_id is null;
  update public.checklist_etapa_projeto i
     set user_id = e.user_id
    from public.etapas_projeto e
   where i.etapa_id = e.id and i.user_id is null;
end $$;

alter table public.projetos alter column user_id set not null;
alter table public.etapas_projeto alter column user_id set not null;
alter table public.checklist_etapa_projeto alter column user_id set not null;

do $$ begin
  alter table public.projetos add constraint projetos_categoria_check
    check (categoria in ('cliente','pessoal'));
exception when duplicate_object then null; end $$;

do $$ begin
  alter table public.projetos add constraint projetos_status_check
    check (status in ('ativo','finalizado','arquivado'));
exception when duplicate_object then null; end $$;

do $$ begin
  alter table public.projetos add constraint projetos_periodo_check
    check (data_fim is null or data_inicio is null or data_fim >= data_inicio);
exception when duplicate_object then null; end $$;

do $$ begin
  alter table public.checklist_etapa_projeto add constraint itens_projeto_periodo_check
    check (data_fim is null or data_inicio is null or data_fim >= data_inicio);
exception when duplicate_object then null; end $$;

create index if not exists projetos_user_categoria_idx
  on public.projetos (user_id, categoria, status);
create index if not exists etapas_projeto_user_idx
  on public.etapas_projeto (user_id, projeto_id);
create index if not exists checklist_etapa_projeto_user_data_idx
  on public.checklist_etapa_projeto (user_id, data_inicio, data_fim);
create index if not exists checklist_etapa_projeto_entrega_idx
  on public.checklist_etapa_projeto (entrega_id) where entrega_id is not null;

drop policy if exists "Acesso total usuarios autenticados" on public.projetos;
drop policy if exists "Acesso total usuarios autenticados" on public.etapas_projeto;
drop policy if exists "Acesso total usuarios autenticados" on public.checklist_etapa_projeto;

create policy "Usuaria gerencia seus projetos"
  on public.projetos for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "Usuaria gerencia grupos dos seus projetos"
  on public.etapas_projeto for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "Usuaria gerencia itens dos seus projetos"
  on public.checklist_etapa_projeto for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.projetos to authenticated;
grant select, insert, update, delete on public.etapas_projeto to authenticated;
grant select, insert, update, delete on public.checklist_etapa_projeto to authenticated;
