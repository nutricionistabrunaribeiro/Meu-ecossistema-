-- Rodada pendente — alterações aditivas e compatíveis com os dados existentes.
alter table public.registros_ciclo
  add column if not exists perfil text not null default 'bruna';

create index if not exists idx_registros_ciclo_usuario_perfil_data
  on public.registros_ciclo (user_id, perfil, data);

alter table public.itens_modelo_checklist
  add column if not exists ativo boolean not null default true,
  add column if not exists atualizado_em timestamptz not null default now();

alter table public.checklist_respostas_itens
  add column if not exists categoria_snapshot text,
  add column if not exists descricao_snapshot text,
  add column if not exists atualizado_em timestamptz not null default now();

alter table public.pendencias
  add column if not exists concluido_em timestamptz;

insert into storage.buckets (id, name, public)
values ('marca', 'marca', false)
on conflict (id) do update set public = excluded.public;

do $$
begin
  if not exists (select 1 from pg_policies where schemaname='storage' and tablename='objects' and policyname='marca_select_authenticated') then
    create policy marca_select_authenticated on storage.objects for select to authenticated using (bucket_id='marca' and (storage.foldername(name))[1]=auth.uid()::text);
  end if;
  if not exists (select 1 from pg_policies where schemaname='storage' and tablename='objects' and policyname='marca_insert_authenticated') then
    create policy marca_insert_authenticated on storage.objects for insert to authenticated with check (bucket_id='marca' and (storage.foldername(name))[1]=auth.uid()::text);
  end if;
  if not exists (select 1 from pg_policies where schemaname='storage' and tablename='objects' and policyname='marca_update_authenticated') then
    create policy marca_update_authenticated on storage.objects for update to authenticated using (bucket_id='marca' and (storage.foldername(name))[1]=auth.uid()::text) with check (bucket_id='marca' and (storage.foldername(name))[1]=auth.uid()::text);
  end if;
end $$;
