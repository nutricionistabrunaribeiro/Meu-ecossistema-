create table if not exists public.obrigacoes_cliente (
 id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
 cliente_id uuid not null references public.clientes(id) on delete cascade, titulo text not null, categoria text,
 vencimento date, recorrencia_meses integer check (recorrencia_meses is null or recorrencia_meses > 0),
 status text not null default 'programada' check(status in ('programada','em_andamento','realizada')),
 observacoes text, realizado_em timestamptz, criado_em timestamptz not null default now()
);
create table if not exists public.treinamentos_cliente (
 id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
 cliente_id uuid not null references public.clientes(id) on delete cascade, tema text not null, data date,
 validade date, participantes integer, status text not null default 'planejado' check(status in ('planejado','realizado','cancelado')),
 observacoes text, criado_em timestamptz not null default now()
);
create table if not exists public.rotas_custos (
 id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
 cliente_id uuid references public.clientes(id) on delete set null, data date not null default current_date,
 origem text, destino text, quilometros numeric(10,2) not null default 0, tempo_minutos integer not null default 0,
 combustivel numeric(12,2) not null default 0, pedagio numeric(12,2) not null default 0,
 estacionamento numeric(12,2) not null default 0, outros numeric(12,2) not null default 0, observacoes text,
 criado_em timestamptz not null default now()
);
create table if not exists public.produtos_rotulagem (
 id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
 cliente_id uuid references public.clientes(id) on delete set null, produto text not null, tipo text,
 status text not null default 'a_fazer' check(status in ('a_fazer','em_andamento','aguardando_cliente','concluido')),
 prazo date, proxima_acao text, pasta_referencia text, criado_em timestamptz not null default now(), atualizado_em timestamptz not null default now()
);
create table if not exists public.conteudo_inteligente (
 id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id) on delete cascade,
 situacao text not null, gancho text, pilar text, formato text, proxima_acao text,
 status text not null default 'capturada' check(status in ('capturada','desenvolver','usada')),
 criado_em timestamptz not null default now()
);
create index if not exists obrigacoes_vencimento_idx on public.obrigacoes_cliente(user_id,vencimento);
create index if not exists treinamentos_validade_idx on public.treinamentos_cliente(user_id,validade);
create index if not exists rotas_data_idx on public.rotas_custos(user_id,data);
create index if not exists produtos_prazo_idx on public.produtos_rotulagem(user_id,prazo);

do $$ declare t text; begin foreach t in array array['obrigacoes_cliente','treinamentos_cliente','rotas_custos','produtos_rotulagem','conteudo_inteligente'] loop
 execute format('alter table public.%I enable row level security',t);
 execute format('drop policy if exists %I on public.%I',t||'_proprietaria',t);
 execute format('create policy %I on public.%I for all to authenticated using (user_id=auth.uid()) with check (user_id=auth.uid())',t||'_proprietaria',t);
 execute format('grant select,insert,update,delete on public.%I to authenticated',t);
 end loop; end $$;
