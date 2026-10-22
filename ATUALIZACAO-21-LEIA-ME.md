# Meu Ecossistema — Atualização 21
- Visão Geral: dois novos cards na seção Meu bem-estar.
- Hidratação: registra quantidade em mL, soma por dia, meta configurável, barra de progresso e exclusão de registros recentes.
- Hidratação sincronizada com Supabase (tabela `hidratacao_registros` já criada neste projeto).
- Ciclo: mostra previsão indicativa baseada nos dias marcados no calendário da Bruna. Sem histórico suficiente, assume 28 dias e informa ser estimativa inicial. Não é ferramenta contraceptiva nem previsão clínica.
- O hábito comum de beber água pode continuar separado: não há contagem dupla automática nem ligação com o checklist semanal de hábitos.
- Meta de água é salva neste navegador; os registros em mL ficam na conta Supabase.
- A transparência visual foi mantida como estava na versão 20, conforme pedido.
- A integração precisa ser testada em dois dispositivos reais.
Para publicar, extraia o ZIP e substitua os arquivos da raiz do GitHub. Não envie o ZIP fechado.
