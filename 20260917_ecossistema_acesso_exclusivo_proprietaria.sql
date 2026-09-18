-- A aplicação é de uso exclusivo de Bruna Ribeiro.
-- Policies RESTRICTIVE complementam as policies históricas e impedem que
-- qualquer outra conta autenticada acesse linhas ou arquivos do projeto.
do $guard$
declare
  t record;
  proprietaria constant uuid := 'dc71cb47-4a9e-417e-b1c2-6331f9bda8f5';
begin
  if not exists (
    select 1 from auth.users
    where id = proprietaria
      and email = 'nutricionistabrunaribeiro@gmail.com'
  ) then
    raise exception 'Proprietaria não confirmada';
  end if;

  for t in
    select tablename from pg_tables where schemaname = 'public'
  loop
    execute format(
      'drop policy if exists ecossistema_acesso_exclusivo on public.%I',
      t.tablename
    );
    execute format(
      'create policy ecossistema_acesso_exclusivo on public.%I '
      'as restrictive for all to public '
      'using ((select auth.uid()) = %L::uuid) '
      'with check ((select auth.uid()) = %L::uuid)',
      t.tablename, proprietaria, proprietaria
    );
  end loop;

  drop policy if exists ecossistema_arquivos_exclusivos on storage.objects;
  create policy ecossistema_arquivos_exclusivos
  on storage.objects
  as restrictive for all to public
  using ((select auth.uid()) = proprietaria)
  with check ((select auth.uid()) = proprietaria);
end
$guard$;
