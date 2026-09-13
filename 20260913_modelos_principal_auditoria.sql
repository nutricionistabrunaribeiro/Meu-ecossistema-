-- Organiza os dois modelos sem alterar respostas, visitas ou PDFs históricos.
update public.modelos_checklist
set nome = 'Checklist Principal'
where id = 'b179e372-5a4f-4669-809c-07f11bb90ac2';

update public.modelos_checklist
set nome = 'Checklist de Auditoria - RDC'
where id = '00000000-0000-0000-0000-000000000001';

insert into public.itens_modelo_checklist (modelo_id, categoria, descricao, ordem, ativo)
select 'b179e372-5a4f-4669-809c-07f11bb90ac2'::uuid, v.categoria, v.descricao, v.ordem, true
from (values
  ('1. Estrutura e edificação','Piso, paredes, teto e portas limpos, íntegros e em bom estado de conservação, favorecendo as condições higiênico-sanitárias do ambiente',1),
  ('1. Estrutura e edificação','Sistema de ventilação adequado, proporcionando conforto térmico e minimizando condensação, vapores e contaminações',2),
  ('1. Estrutura e edificação','Janelas com telas milimétricas íntegras, limpas e em bom estado de conservação',3),
  ('1. Estrutura e edificação','Ralos sifonados e/ou providos de telas, íntegros, limpos e em adequado funcionamento',4),
  ('1. Estrutura e edificação','Fluxo operacional organizado para evitar cruzamentos entre áreas limpas e sujas e minimizar contaminação cruzada',5),
  ('1. Estrutura e edificação','Pia exclusiva para higienização das mãos conservada e abastecida com sabonete líquido, papel-toalha e coletor sem contato manual',6),
  ('1. Estrutura e edificação','Planilha de higienização ambiental preenchida e atualizada',7),
  ('2. Equipamentos, móveis e utensílios','Equipamentos limpos, íntegros, conservados, funcionando e compatíveis com as atividades',8),
  ('2. Equipamentos, móveis e utensílios','Utensílios limpos, organizados e em bom estado de conservação',9),
  ('2. Equipamentos, móveis e utensílios','Bancadas, prateleiras e superfícies limpas, íntegras, lisas, impermeáveis e conservadas',10),
  ('2. Equipamentos, móveis e utensílios','Termômetros operantes e em condições adequadas de uso',11),
  ('2. Equipamentos, móveis e utensílios','Lixeira limpa, íntegra, identificada quando aplicável, com tampa e acionamento por pedal',12),
  ('2. Equipamentos, móveis e utensílios','Planilha de controle de temperatura devidamente preenchida',13),
  ('3. Recebimento e armazenamento','Recebimento realizado com conferência das condições dos produtos, embalagens e temperaturas',14),
  ('3. Recebimento e armazenamento','Produtos avaliados dentro do prazo de validade',15),
  ('3. Recebimento e armazenamento','Planilha de recebimento devidamente preenchida',16),
  ('3. Recebimento e armazenamento','Armazenamento de produtos secos adequado',17),
  ('3. Recebimento e armazenamento','Armazenamento de produtos refrigerados adequado',18),
  ('3. Recebimento e armazenamento','Produtos armazenados conforme o sistema PVPS',19),
  ('3. Recebimento e armazenamento','Produtos identificados e dentro do prazo de validade',20),
  ('4. Manipulação e Boas Práticas','Higiene das mãos realizada de forma adequada',21),
  ('4. Manipulação e Boas Práticas','Produtos identificados com informações necessárias para rastreabilidade',22),
  ('4. Manipulação e Boas Práticas','Alimentos dentro do prazo de validade e aptos para consumo',23),
  ('4. Manipulação e Boas Práticas','Produtos protegidos adequadamente contra contaminações',24),
  ('4. Manipulação e Boas Práticas','Amostras coletadas, identificadas e armazenadas conforme procedimento',25),
  ('4. Manipulação e Boas Práticas','Controle de tempo e temperatura realizado dentro dos padrões estabelecidos',26),
  ('4. Manipulação e Boas Práticas','Higienização dos hortifrutis realizada conforme procedimento padronizado',27),
  ('4. Manipulação e Boas Práticas','Descongelamento e dessalgue realizados adequadamente sob refrigeração',28),
  ('4. Manipulação e Boas Práticas','Planilha de controle de temperatura dos alimentos preenchida',29),
  ('4. Manipulação e Boas Práticas','Resíduos descartados adequadamente em recipientes apropriados',30),
  ('4. Manipulação e Boas Práticas','Planilha de controle de troca de óleo preenchida',31),
  ('5. Asseio pessoal','Colaborador com uniforme completo, limpo e conservado',32),
  ('5. Asseio pessoal','Barba e bigode totalmente aparados, unhas curtas e sem esmalte ou unhas artificiais',33),
  ('5. Asseio pessoal','EPIs utilizados corretamente conforme a atividade desenvolvida',34),
  ('5. Asseio pessoal','Higiene das mãos realizada corretamente',35),
  ('5. Asseio pessoal','Comportamento higiênico adequado e ausência de adornos durante a manipulação',36),
  ('6. Área de armazenamento de resíduos','Área de resíduos limpa, organizada e sem acúmulo de sujidades',37),
  ('6. Área de armazenamento de resíduos','Planilha ou registro de higienização da área de resíduos preenchido',38),
  ('7. Depósito de Material de Limpeza - DML','DML limpo, organizado e em boas condições de conservação',39),
  ('7. Depósito de Material de Limpeza - DML','Produtos saneantes identificados, em embalagem original ou recipiente identificado e dentro da validade',40),
  ('7. Depósito de Material de Limpeza - DML','Produtos de limpeza em local exclusivo e separados de alimentos, embalagens e utensílios',41),
  ('7. Depósito de Material de Limpeza - DML','Utensílios de limpeza limpos, identificados e armazenados sem contato com o piso',42),
  ('7. Depósito de Material de Limpeza - DML','FDS disponíveis para os produtos químicos utilizados',43),
  ('8. Vestiários e instalações sanitárias','Vestiários e sanitários limpos, organizados, conservados e em boas condições de higiene',44),
  ('8. Vestiários e instalações sanitárias','Lavatório abastecido com sabonete líquido e papel-toalha descartável',45),
  ('8. Vestiários e instalações sanitárias','Lixeira limpa, íntegra, com tampa e acionamento por pedal',46),
  ('8. Vestiários e instalações sanitárias','Armários individuais limpos, íntegros e conservados',47),
  ('8. Vestiários e instalações sanitárias','Pertences pessoais guardados de forma organizada exclusivamente nos armários',48),
  ('9. Transporte','Compartimento de transporte limpo, organizado e conservado',49),
  ('9. Transporte','Superfícies internas revestidas com material compatível com higienização',50),
  ('9. Transporte','Tipo de transporte adequado às condições de conservação dos produtos',51),
  ('9. Transporte','Registro de higienização do veículo disponível e atualizado',52),
  ('9. Transporte','Documentação do veículo e do motorista atualizada e em conformidade',53),
  ('10. Documentação','Manual de Boas Práticas e POPs disponíveis e atualizados',54),
  ('10. Documentação','Registros de treinamento dos manipuladores atualizados',55),
  ('10. Documentação','ASOs vigentes, disponíveis e compatíveis com as funções',56),
  ('10. Documentação','PCMSO, PGR e LTCAT vigentes',57),
  ('10. Documentação','Controle integrado de pragas com contrato, empresa regular e certificado vigente',58),
  ('10. Documentação','Higienização da caixa d''água com contrato ou prestador, documentação e certificado disponíveis',59),
  ('10. Documentação','Análise de potabilidade da água com laudo vigente',60),
  ('10. Documentação','Troca da vela do filtro com registro ou comprovante disponível',61),
  ('10. Documentação','Limpeza de coifa e dutos com contrato ou prestador e comprovantes disponíveis',62),
  ('10. Documentação','Extintores dentro do prazo, sinalizados e disponíveis',63),
  ('10. Documentação','Termômetros com calibração vigente e comprovada',64),
  ('10. Documentação','Limpeza do sistema de ar-condicionado com registros disponíveis',65),
  ('10. Documentação','Limpeza da caixa de gordura com registros disponíveis',66),
  ('10. Documentação','Coleta de óleo com empresa responsável, armazenamento identificado e comprovante vigente',67),
  ('10. Documentação','Licença de funcionamento vigente',68),
  ('10. Documentação','CMVS vigente e disponível para consulta',69),
  ('10. Documentação','AVCB ou CLCB vigente e disponível para consulta',70)
) as v(categoria, descricao, ordem)
where not exists (
  select 1 from public.itens_modelo_checklist i
  where i.modelo_id = 'b179e372-5a4f-4669-809c-07f11bb90ac2'::uuid
    and lower(trim(i.descricao)) = lower(trim(v.descricao))
);
