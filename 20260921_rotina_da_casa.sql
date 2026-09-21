-- Rotina da Casa — extensão compatível das rotinas recorrentes já existentes.
-- Não remove nem transforma registros anteriores.

alter table public.rotinas_recorrentes
  add column if not exists escopo text not null default 'trabalho',
  add column if not exists dias_semana smallint[],
  add column if not exists responsavel text,
  add column if not exists ordem integer not null default 0,
  add column if not exists excluido_em timestamptz;

alter table public.rotina_execucoes
  add column if not exists adiada_para date;

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.rotinas_recorrentes'::regclass
      and conname = 'rotinas_recorrentes_escopo_check'
  ) then
    alter table public.rotinas_recorrentes
      add constraint rotinas_recorrentes_escopo_check
      check (escopo in ('trabalho', 'casa'));
  end if;

  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.rotinas_recorrentes'::regclass
      and conname = 'rotinas_recorrentes_dias_semana_check'
  ) then
    alter table public.rotinas_recorrentes
      add constraint rotinas_recorrentes_dias_semana_check
      check (
        dias_semana is null
        or (
          cardinality(dias_semana) between 1 and 7
          and dias_semana <@ array[0,1,2,3,4,5,6]::smallint[]
        )
      );
  end if;

  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.rotinas_recorrentes'::regclass
      and conname = 'rotinas_recorrentes_ordem_check'
  ) then
    alter table public.rotinas_recorrentes
      add constraint rotinas_recorrentes_ordem_check check (ordem >= 0);
  end if;
end $$;

create index if not exists idx_rotinas_recorrentes_user_escopo_ativo
  on public.rotinas_recorrentes (user_id, escopo, ativo)
  where excluido_em is null;

create index if not exists idx_rotina_execucoes_user_adiada
  on public.rotina_execucoes (user_id, adiada_para)
  where adiada_para is not null;

-- O aplicativo exige sessão autenticada. Mantemos apenas os privilégios de dados
-- usados pelo frontend; RLS continua isolando as linhas pelo usuário proprietário.
revoke all on table public.rotinas_recorrentes from anon;
revoke all on table public.rotina_execucoes from anon;
revoke truncate, references, trigger on table public.rotinas_recorrentes from authenticated;
revoke truncate, references, trigger on table public.rotina_execucoes from authenticated;
grant select, insert, update, delete on table public.rotinas_recorrentes to authenticated;
grant select, insert, update, delete on table public.rotina_execucoes to authenticated;

comment on column public.rotinas_recorrentes.escopo is
  'Separa rotinas profissionais das rotinas domésticas sem duplicar estruturas.';
comment on column public.rotinas_recorrentes.excluido_em is
  'Exclusão lógica: remove da interface e preserva o histórico de execuções.';
comment on column public.rotina_execucoes.adiada_para is
  'Nova data visual para uma ocorrência adiada, mantendo a data prevista original.';
