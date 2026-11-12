-- Apenas diagnóstico, não altera tabelas nem dados
SELECT table_name, column_name, data_type, is_nullable
FROM information_schema.columns WHERE table_schema='public' ORDER BY table_name, ordinal_position;

SELECT n.nspname AS schema_name, c.relname AS table_name, c.relrowsecurity AS rls_enabled
FROM pg_class c JOIN pg_namespace n ON n.oid=c.relnamespace
WHERE n.nspname='public' AND c.relkind='r' ORDER BY c.relname;

SELECT schemaname, tablename, policyname, cmd, roles, qual, with_check
FROM pg_policies WHERE schemaname='public' ORDER BY tablename, policyname;
