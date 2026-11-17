-- Versão 64: ciclos da Jornada Bíblica, preservando todas as leituras anteriores.
-- Execute UMA vez no SQL Editor do Supabase ANTES de publicar o index.html v64.
-- Os 520+ capítulos existentes permanecem no ciclo 1, sem exclusão.

BEGIN;

ALTER TABLE public.biblia_capitulos_lidos
  ADD COLUMN IF NOT EXISTS ciclo integer NOT NULL DEFAULT 1;

ALTER TABLE public.biblia_capitulos_lidos
  DROP CONSTRAINT IF EXISTS biblia_capitulos_lidos_user_id_livro_capitulo_key;

ALTER TABLE public.biblia_capitulos_lidos
  ADD CONSTRAINT biblia_capitulos_lidos_usuario_ciclo_livro_capitulo_key
    UNIQUE (user_id,ciclo,livro,capitulo);

CREATE TABLE IF NOT EXISTS public.biblia_jornada_estado (
  user_id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  ciclo_atual integer NOT NULL DEFAULT 1 CHECK (ciclo_atual>=1),
  concluidas integer NOT NULL DEFAULT 0 CHECK (concluidas>=0),
  atualizado_em timestamptz NOT NULL DEFAULT now()
);
ALTER TABLE public.biblia_jornada_estado ENABLE ROW LEVEL SECURITY;
GRANT SELECT,INSERT,UPDATE ON public.biblia_jornada_estado TO authenticated;

DROP POLICY IF EXISTS biblia_estado_selecionar_proprio ON public.biblia_jornada_estado;
CREATE POLICY biblia_estado_selecionar_proprio ON public.biblia_jornada_estado
  FOR SELECT TO authenticated USING ((SELECT auth.uid())=user_id);

DROP POLICY IF EXISTS biblia_estado_inserir_proprio ON public.biblia_jornada_estado;
CREATE POLICY biblia_estado_inserir_proprio ON public.biblia_jornada_estado
  FOR INSERT TO authenticated WITH CHECK ((SELECT auth.uid())=user_id);

DROP POLICY IF EXISTS biblia_estado_atualizar_proprio ON public.biblia_jornada_estado;
CREATE POLICY biblia_estado_atualizar_proprio ON public.biblia_jornada_estado
  FOR UPDATE TO authenticated USING ((SELECT auth.uid())=user_id)
  WITH CHECK ((SELECT auth.uid())=user_id);

CREATE OR REPLACE FUNCTION public.concluir_jornada_biblica()
RETURNS jsonb
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = ''
AS $$
DECLARE
  v_usuario uuid := auth.uid();
  v_ciclo integer;
  v_lidos integer;
  v_concluidas integer;
BEGIN
  IF v_usuario IS NULL THEN
    RAISE EXCEPTION 'É necessário estar autenticada.';
  END IF;
  INSERT INTO public.biblia_jornada_estado(user_id)
  VALUES(v_usuario) ON CONFLICT(user_id) DO NOTHING;
  SELECT ciclo_atual INTO v_ciclo FROM public.biblia_jornada_estado
    WHERE user_id=v_usuario FOR UPDATE;
  SELECT COUNT(*) INTO v_lidos
  FROM public.biblia_capitulos_lidos l
  JOIN (VALUES
      ('Gênesis',50),
      ('Êxodo',40),
      ('Levítico',27),
      ('Números',36),
      ('Deuteronômio',34),
      ('Josué',24),
      ('Juízes',21),
      ('Rute',4),
      ('1 Samuel',31),
      ('2 Samuel',24),
      ('1 Reis',22),
      ('2 Reis',25),
      ('1 Crônicas',29),
      ('2 Crônicas',36),
      ('Esdras',10),
      ('Neemias',13),
      ('Ester',10),
      ('Jó',42),
      ('Salmos',150),
      ('Provérbios',31),
      ('Eclesiastes',12),
      ('Cânticos',8),
      ('Isaías',66),
      ('Jeremias',52),
      ('Lamentações',5),
      ('Ezequiel',48),
      ('Daniel',12),
      ('Oseias',14),
      ('Joel',3),
      ('Amós',9),
      ('Obadias',1),
      ('Jonas',4),
      ('Miqueias',7),
      ('Naum',3),
      ('Habacuque',3),
      ('Sofonias',3),
      ('Ageu',2),
      ('Zacarias',14),
      ('Malaquias',4),
      ('Mateus',28),
      ('Marcos',16),
      ('Lucas',24),
      ('João',21),
      ('Atos',28),
      ('Romanos',16),
      ('1 Coríntios',16),
      ('2 Coríntios',13),
      ('Gálatas',6),
      ('Efésios',6),
      ('Filipenses',4),
      ('Colossenses',4),
      ('1 Tessalonicenses',5),
      ('2 Tessalonicenses',3),
      ('1 Timóteo',6),
      ('2 Timóteo',4),
      ('Tito',3),
      ('Filemom',1),
      ('Hebreus',13),
      ('Tiago',5),
      ('1 Pedro',5),
      ('2 Pedro',3),
      ('1 João',5),
      ('2 João',1),
      ('3 João',1),
      ('Judas',1),
      ('Apocalipse',22)
  ) AS b(livro,capitulos) ON b.livro=l.livro AND l.capitulo BETWEEN 1 AND b.capitulos
  WHERE l.user_id=v_usuario AND l.ciclo=v_ciclo;
  IF v_lidos<>1189 THEN
    RAISE EXCEPTION 'Ainda faltam capítulos para concluir esta leitura (% de 1189).',v_lidos;
  END IF;
  UPDATE public.biblia_jornada_estado
  SET ciclo_atual=v_ciclo+1,concluidas=concluidas+1,atualizado_em=now()
  WHERE user_id=v_usuario RETURNING concluidas INTO v_concluidas;
  RETURN jsonb_build_object('ciclo_atual',v_ciclo+1,'concluidas',v_concluidas);
END;
$$;
REVOKE ALL ON FUNCTION public.concluir_jornada_biblica() FROM PUBLIC,anon;
GRANT EXECUTE ON FUNCTION public.concluir_jornada_biblica() TO authenticated;

COMMIT;
