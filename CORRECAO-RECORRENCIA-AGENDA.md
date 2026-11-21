# Correção — Recorrência também ao editar compromisso

- O formulário de edição agora mantém o seletor de recorrência da V85.
- A situação (em aberto/concluído) foi colocada em um campo separado, sem substituir o bloco de recorrência.
- Ao editar e escolher recorrência, o compromisso original é atualizado e as datas futuras são criadas como registros independentes.
- Datas que já têm compromisso equivalente são ignoradas para evitar duplicação (verificação local dos eventos carregados na Agenda).
- Ao voltar para “Não repetir”, o botão volta ao salvamento normal de edição.
- Nenhuma migração SQL ou tabela nova é necessária.
