# Correção — Recorrência também ao editar compromisso

- O formulário de edição agora mantém o seletor de recorrência da V85.
- A situação (em aberto/concluído) foi colocada em um campo separado, sem substituir o bloco de recorrência.
- Ao editar e escolher recorrência, o compromisso original é atualizado e as datas futuras são criadas como registros independentes.
- Datas que já têm compromisso equivalente são ignoradas para evitar duplicação (verificação local dos eventos carregados na Agenda).
- Ao voltar para “Não repetir”, o botão volta ao salvamento normal de edição.
- Nenhuma migração SQL ou tabela nova é necessária.

## Repetição mensal adicionada
- Nova frequência: **Uma vez por mês · mesmo dia**. A data de início determina o dia mensal; iniciar em 01/12 gera ocorrências todo dia 1.
- Duração mensal: 1, 3, 6 ou 12 meses, ou personalizada de 1 a 36 meses.
- Em meses que não têm o dia selecionado (ex.: dia 31), a ocorrência é ignorada, sem deslocar para outro dia.
- As ocorrências mensais são independentes e a proteção contra duplicados existente continua sendo aplicada aos eventos carregados na Agenda.
