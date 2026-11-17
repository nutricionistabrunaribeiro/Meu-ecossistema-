# Meu Ecossistema • Bruna Ribeiro — Atualização 79

## Ajustes de layout no módulo de Supervisão

Esta versão parte da **78**, preservando a agenda da equipe, as contagens de cobertura, os treinamentos e os relatórios anuais.

### Correções

- **Painel ajustado à largura do iPhone:** os indicadores, os filtros por carteira e o resumo não ultrapassam mais a área da tela. A grade interna do planner deixa de determinar a largura do card inteiro.
- **Planner semanal mais intuitivo no celular:** em vez de uma tabela muito larga, aparecem sete botões compactos (Seg, Ter, Qua, Qui, Sex, Sáb e Dom). Você toca no dia e vê as linhas de Bruna, Mari, Gleice, Meire, Ana Cristina e demais nutricionistas com os respectivos clientes.
- **Sem rolagem horizontal no celular:** a área de cada nutricionista fica visível em duas colunas (responsável e clientes do dia). Em telas largas, a grade semanal completa permanece disponível.
- **Sem perda de contexto:** trocar o dia da semana não recarrega a tela nem faz você voltar ao início. Navegar para outras semanas mantém o dia selecionado; o botão **Hoje** volta ao dia atual.
- **Botão flutuante redundante oculto apenas em Supervisão:** o grande `+` não cobre mais os cards e as últimas linhas do planner. Os botões de ações específicos do módulo permanecem.
- **Formulários mais compactos no celular:** títulos, campos e botões de salvar foram adaptados ao espaço disponível, com rolagem interna nos formulários extensos.
- **Horário da visita própria com formato legível:** o campo agora exibe opções como `08:00`, mantendo o mesmo valor salvo anteriormente (hora numérica).
- Texto de cadastro de visita atualizado para mencionar **Supervisão** em vez de **Entregas**.

### O que não mudou

- Os registros de visitas, treinamentos e clientes permanecem como estão.
- Agendas da Bruna e das demais nutricionistas seguem alimentando o painel e a Agenda Inteligente.
- Treinamentos realizados continuam contando como visitas, evitando a duplicidade já tratada nas versões anteriores.
- Os filtros **Todos / Saber Nutrir / Bruna Ribeiro** continuam disponíveis.
- Nenhuma alteração no banco de dados é necessária.

### Instalação

Substitua o `index.html` atual do repositório pelo da pasta desta versão. Aguarde a publicação na Vercel. Se o ícone do iPhone ainda abrir a versão antiga, feche e reabra o aplicativo após a publicação.
