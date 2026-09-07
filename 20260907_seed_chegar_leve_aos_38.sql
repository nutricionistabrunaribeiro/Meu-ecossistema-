-- Conteúdo inicial do projeto pessoal temporário. Idempotente e sem IDs fixos.
do $$
declare
  proprietaria uuid;
  projeto uuid;
  grupo record;
  tarefa record;
begin
  select id into proprietaria from auth.users order by created_at limit 1;
  if proprietaria is null then raise exception 'Nenhuma usuária cadastrada.'; end if;

  select id into projeto from public.projetos
   where user_id=proprietaria and categoria='pessoal' and lower(nome)=lower('Chegar leve aos 38')
   limit 1;

  if projeto is null then
    insert into public.projetos (user_id,nome,categoria,data_inicio,data_fim,status)
    values (proprietaria,'Chegar leve aos 38','pessoal','2026-09-07','2026-10-06','ativo')
    returning id into projeto;
  end if;

  for grupo in select * from (values
    ('CASA',1),('TRABALHO',2),('PESSOAL',3),('PREPARAÇÃO DA FOLGA',4)
  ) as g(nome,ordem)
  loop
    if not exists (select 1 from public.etapas_projeto where projeto_id=projeto and nome=grupo.nome) then
      insert into public.etapas_projeto (user_id,projeto_id,nome,ordem)
      values (proprietaria,projeto,grupo.nome,grupo.ordem);
    end if;
  end loop;

  for tarefa in
    select * from jsonb_to_recordset($tarefas$
    [
      {"grupo":"CASA","item":"Faxina pesada e organização do porão","inicio":"2026-09-07","fim":"2026-09-07","ordem":1},
      {"grupo":"CASA","item":"Separar descarte","inicio":"2026-09-07","fim":"2026-09-07","ordem":2},
      {"grupo":"CASA","item":"Separar itens para doação","inicio":"2026-09-07","fim":"2026-09-07","ordem":3},
      {"grupo":"CASA","item":"Definir lugar para o que permanecer","inicio":"2026-09-07","fim":"2026-09-07","ordem":4},
      {"grupo":"CASA","item":"Manter porão organizado","inicio":"2026-09-08","fim":"2026-09-13","ordem":5},
      {"grupo":"CASA","item":"Revisar áreas de armazenamento","inicio":"2026-09-08","fim":"2026-09-13","ordem":6},
      {"grupo":"CASA","item":"Organizar papéis e itens acumulados","inicio":"2026-09-08","fim":"2026-09-13","ordem":7},
      {"grupo":"CASA","item":"Revisar armários","inicio":"2026-09-14","fim":"2026-09-20","ordem":8},
      {"grupo":"CASA","item":"Separar roupas sem uso","inicio":"2026-09-14","fim":"2026-09-20","ordem":9},
      {"grupo":"CASA","item":"Organizar objetos sem lugar definido","inicio":"2026-09-14","fim":"2026-09-20","ordem":10},
      {"grupo":"CASA","item":"Destralhar áreas que acumulam coisas","inicio":"2026-09-14","fim":"2026-09-20","ordem":11},
      {"grupo":"CASA","item":"Organizar quartos","inicio":"2026-09-21","fim":"2026-09-27","ordem":12},
      {"grupo":"CASA","item":"Revisar roupas","inicio":"2026-09-21","fim":"2026-09-27","ordem":13},
      {"grupo":"CASA","item":"Organizar brinquedos e itens das crianças","inicio":"2026-09-21","fim":"2026-09-27","ordem":14},
      {"grupo":"CASA","item":"Fazer descarte/doação do que não será mantido","inicio":"2026-09-21","fim":"2026-09-27","ordem":15},
      {"grupo":"CASA","item":"Limpeza mais detalhada da cozinha","inicio":"2026-09-28","fim":"2026-10-04","ordem":16},
      {"grupo":"CASA","item":"Organizar despensa","inicio":"2026-09-28","fim":"2026-10-04","ordem":17},
      {"grupo":"CASA","item":"Revisar geladeira/freezer","inicio":"2026-09-28","fim":"2026-10-04","ordem":18},
      {"grupo":"CASA","item":"Limpeza detalhada dos banheiros","inicio":"2026-09-28","fim":"2026-10-04","ordem":19},
      {"grupo":"CASA","item":"Revisar áreas mais utilizadas da casa","inicio":"2026-09-28","fim":"2026-10-04","ordem":20},
      {"grupo":"CASA","item":"Faxina final leve","inicio":"2026-10-05","fim":"2026-10-06","ordem":21},
      {"grupo":"CASA","item":"Lavar roupas pendentes","inicio":"2026-10-05","fim":"2026-10-06","ordem":22},
      {"grupo":"CASA","item":"Trocar roupas de cama","inicio":"2026-10-05","fim":"2026-10-06","ordem":23},
      {"grupo":"CASA","item":"Deixar banheiros limpos","inicio":"2026-10-05","fim":"2026-10-06","ordem":24},
      {"grupo":"CASA","item":"Deixar cozinha organizada","inicio":"2026-10-05","fim":"2026-10-06","ordem":25},
      {"grupo":"CASA","item":"Retirar lixo","inicio":"2026-10-05","fim":"2026-10-06","ordem":26},
      {"grupo":"CASA","item":"Guardar objetos fora do lugar","inicio":"2026-10-05","fim":"2026-10-06","ordem":27},

      {"grupo":"TRABALHO","item":"Levantar todas as entregas profissionais pendentes","inicio":"2026-09-07","fim":"2026-09-13","ordem":1},
      {"grupo":"TRABALHO","item":"Identificar entregas com prazo até 13/10","inicio":"2026-09-07","fim":"2026-09-13","ordem":2},
      {"grupo":"TRABALHO","item":"Identificar obrigações de clientes que vencem durante a folga","inicio":"2026-09-07","fim":"2026-09-13","ordem":3},
      {"grupo":"TRABALHO","item":"Priorizar entregas antigas","inicio":"2026-09-14","fim":"2026-09-20","ordem":4},
      {"grupo":"TRABALHO","item":"Avançar trabalhos que exigem maior concentração","inicio":"2026-09-14","fim":"2026-09-20","ordem":5},
      {"grupo":"TRABALHO","item":"Antecipar documentos que possam ser concluídos antes de outubro","inicio":"2026-09-14","fim":"2026-09-20","ordem":6},
      {"grupo":"TRABALHO","item":"Antecipar entregas previstas para 07/10 a 12/10","inicio":"2026-09-21","fim":"2026-09-27","ordem":7},
      {"grupo":"TRABALHO","item":"Revisar agenda profissional da semana da folga","inicio":"2026-09-21","fim":"2026-09-27","ordem":8},
      {"grupo":"TRABALHO","item":"Reprogramar o que for necessário","inicio":"2026-09-21","fim":"2026-09-27","ordem":9},
      {"grupo":"TRABALHO","item":"Finalizar relatórios","inicio":"2026-09-28","fim":"2026-10-04","ordem":10},
      {"grupo":"TRABALHO","item":"Finalizar documentos","inicio":"2026-09-28","fim":"2026-10-04","ordem":11},
      {"grupo":"TRABALHO","item":"Finalizar checklists pendentes","inicio":"2026-09-28","fim":"2026-10-04","ordem":12},
      {"grupo":"TRABALHO","item":"Fazer retornos necessários aos clientes","inicio":"2026-09-28","fim":"2026-10-04","ordem":13},
      {"grupo":"TRABALHO","item":"Conferir obrigações e vencimentos","inicio":"2026-09-28","fim":"2026-10-04","ordem":14},
      {"grupo":"TRABALHO","item":"Conferência final das entregas","inicio":"2026-10-05","fim":"2026-10-06","ordem":15},
      {"grupo":"TRABALHO","item":"Enviar o que estiver pronto","inicio":"2026-10-05","fim":"2026-10-06","ordem":16},
      {"grupo":"TRABALHO","item":"Organizar agenda de retorno","inicio":"2026-10-05","fim":"2026-10-06","ordem":17},
      {"grupo":"TRABALHO","item":"Garantir que não existam entregas críticas durante 07/10 a 12/10","inicio":"2026-10-05","fim":"2026-10-06","ordem":18},

      {"grupo":"PESSOAL","item":"Resolver pequenas pendências pessoais acumuladas","inicio":"2026-09-07","fim":"2026-10-06","ordem":1},
      {"grupo":"PESSOAL","item":"Organizar itens pessoais importantes","inicio":"2026-09-07","fim":"2026-10-06","ordem":2},
      {"grupo":"PESSOAL","item":"Separar o que precisa ser comprado antes da folga","inicio":"2026-09-07","fim":"2026-10-06","ordem":3},
      {"grupo":"PESSOAL","item":"Evitar deixar compromissos desnecessários para 07/10 a 12/10","inicio":"2026-09-07","fim":"2026-10-06","ordem":4},

      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Fazer compra de mercado","inicio":"2026-09-07","fim":"2026-10-06","ordem":1},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Deixar geladeira organizada","inicio":"2026-09-07","fim":"2026-10-06","ordem":2},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Planejar refeições simples para os dias de folga","inicio":"2026-09-07","fim":"2026-10-06","ordem":3},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Deixar roupas lavadas","inicio":"2026-09-07","fim":"2026-10-06","ordem":4},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Deixar roupas de cama organizadas","inicio":"2026-09-07","fim":"2026-10-06","ordem":5},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Conferir itens necessários para as crianças","inicio":"2026-09-07","fim":"2026-10-06","ordem":6},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Resolver contas ou pagamentos que vencerão durante a folga","inicio":"2026-09-07","fim":"2026-10-06","ordem":7},
      {"grupo":"PREPARAÇÃO DA FOLGA","item":"Deixar a casa pronta para manutenção mínima","inicio":"2026-09-07","fim":"2026-10-06","ordem":8}
    ]
    $tarefas$::jsonb) as x(grupo text,item text,inicio date,fim date,ordem integer)
  loop
    insert into public.checklist_etapa_projeto
      (user_id,etapa_id,item,concluido,data_inicio,data_fim,ordem)
    select proprietaria,e.id,tarefa.item,false,tarefa.inicio,tarefa.fim,tarefa.ordem
      from public.etapas_projeto e
     where e.projeto_id=projeto and e.nome=tarefa.grupo
       and not exists (
         select 1 from public.checklist_etapa_projeto i
          where i.etapa_id=e.id and i.item=tarefa.item
       );
  end loop;
end $$;
