-- Painel documental: evolução aditiva, sem alterar ou apagar registros existentes.
alter table public.documentacao_cliente
  add column if not exists categoria text,
  add column if not exists modelo_chave text,
  add column if not exists observacoes text,
  add column if not exists empresa_responsavel text,
  add column if not exists possui_contrato boolean,
  add column if not exists documentacao_completa boolean,
  add column if not exists aplicavel boolean not null default true;

create unique index if not exists idx_documentacao_cliente_modelo
  on public.documentacao_cliente (cliente_id, modelo_chave)
  where modelo_chave is not null;

create index if not exists idx_documentacao_cliente_categoria
  on public.documentacao_cliente (cliente_id, categoria);
