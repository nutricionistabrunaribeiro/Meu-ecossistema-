alter table public.clientes
 add column if not exists tipo_cliente text not null default 'direto' check (tipo_cliente in ('direto','contratante','vinculado')),
 add column if not exists contratante_id uuid references public.clientes(id) on delete set null,
 add column if not exists visitas_previstas_mes integer not null default 0 check (visitas_previstas_mes >= 0),
 add column if not exists visitas_previstas_semana integer not null default 0 check (visitas_previstas_semana >= 0);
create index if not exists clientes_contratante_idx on public.clientes(contratante_id);

alter table public.rotas_custos
 add column if not exists tipo_transporte text not null default 'transporte_publico',
 add column if not exists quantidade_conducoes integer not null default 0 check (quantidade_conducoes >= 0),
 add column if not exists custo_passagens numeric(12,2) not null default 0 check (custo_passagens >= 0);
