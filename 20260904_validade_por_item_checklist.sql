-- Validade opcional por resposta de item do checklist.
-- Coluna nullable: preserva integralmente respostas e históricos existentes.
alter table public.checklist_respostas_itens
add column if not exists validade date;
