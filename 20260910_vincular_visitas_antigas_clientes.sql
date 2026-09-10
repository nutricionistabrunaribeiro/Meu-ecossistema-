-- Vincula somente visitas antigas concluídas que possuem correspondência inequívoca.
-- Nenhum compromisso é removido ou reclassificado.
update public.eventos e
set cliente_id = mapa.cliente_id
from (
  select mapa.titulo, c.id as cliente_id
  from (values
    ('einstein', 'koji einstein'),
    ('central', 'koji central'),
    ('delivery', 'koji delivery'),
    ('primus carapicuíba', 'primus carapicuíba'),
    ('primus osasco', 'primus osasco'),
    ('primus vila', 'primus vila dirce'),
    ('bendita', 'bendita mm'),
    ('empório', 'empório'),
    ('las patas', 'las patas'),
    ('são caetano', 'la vieiras são caetano'),
    ('sushi kyio', 'sushi kiyo'),
    ('sushi kiyo', 'sushi kiyo')
  ) as mapa(titulo, cliente_nome)
  join public.clientes c on lower(trim(c.nome)) = mapa.cliente_nome
  where c.excluido_em is null
) as mapa
where e.cliente_id is null
  and e.tipo = 'visita'
  and lower(trim(e.titulo)) = mapa.titulo
;
