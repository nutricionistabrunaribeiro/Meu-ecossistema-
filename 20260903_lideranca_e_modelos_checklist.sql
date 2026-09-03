alter table public.visitas
  add column if not exists modelo_id uuid references public.modelos_checklist(id) on delete set null,
  add column if not exists modelo_nome_snapshot text;

update public.visitas
set modelo_id = (select id from public.modelos_checklist order by ativo desc, nome limit 1)
where modelo_id is null;

update public.visitas v
set modelo_nome_snapshot = coalesce(
  v.modelo_nome_snapshot,
  (select m.nome from public.modelos_checklist m where m.id = v.modelo_id),
  'Checklist'
)
where modelo_nome_snapshot is null;

create index if not exists visitas_modelo_id_idx on public.visitas(modelo_id);

create table if not exists public.lideranca_responsaveis (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  nome text not null,
  funcao text,
  ativo boolean not null default true,
  criado_em timestamptz not null default now()
);

create table if not exists public.lideranca_delegacoes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  responsavel_id uuid references public.lideranca_responsaveis(id) on delete set null,
  cliente_id uuid references public.clientes(id) on delete set null,
  titulo text not null,
  contexto text,
  resultado_esperado text,
  prazo date,
  prioridade text not null default 'media' check (prioridade in ('baixa','media','alta')),
  status text not null default 'delegada' check (status in ('delegada','em_andamento','aguardando_validacao','concluida')),
  proximo_acompanhamento date,
  evidencia text,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  concluido_em timestamptz
);

create table if not exists public.lideranca_atualizacoes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  delegacao_id uuid not null references public.lideranca_delegacoes(id) on delete cascade,
  nota text not null,
  criado_em timestamptz not null default now()
);

create index if not exists lideranca_responsaveis_user_idx on public.lideranca_responsaveis(user_id, ativo);
create index if not exists lideranca_delegacoes_user_status_idx on public.lideranca_delegacoes(user_id, status);
create index if not exists lideranca_delegacoes_prazo_idx on public.lideranca_delegacoes(user_id, prazo);
create index if not exists lideranca_atualizacoes_delegacao_idx on public.lideranca_atualizacoes(delegacao_id, criado_em desc);

alter table public.lideranca_responsaveis enable row level security;
alter table public.lideranca_delegacoes enable row level security;
alter table public.lideranca_atualizacoes enable row level security;

drop policy if exists "lideranca_responsaveis_proprietaria" on public.lideranca_responsaveis;
create policy "lideranca_responsaveis_proprietaria" on public.lideranca_responsaveis
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "lideranca_delegacoes_proprietaria" on public.lideranca_delegacoes;
create policy "lideranca_delegacoes_proprietaria" on public.lideranca_delegacoes
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

drop policy if exists "lideranca_atualizacoes_proprietaria" on public.lideranca_atualizacoes;
create policy "lideranca_atualizacoes_proprietaria" on public.lideranca_atualizacoes
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

grant select, insert, update, delete on public.lideranca_responsaveis to authenticated;
grant select, insert, update, delete on public.lideranca_delegacoes to authenticated;
grant select, insert, update, delete on public.lideranca_atualizacoes to authenticated;
