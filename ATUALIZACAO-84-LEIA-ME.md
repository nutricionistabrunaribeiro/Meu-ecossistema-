# Meu Ecossistema • Bruna Ribeiro — versão 84

## Resumo mensal de visitas por cliente

No módulo **Trabalho → Supervisão**, foi acrescentado o quadro recolhível **Resumo mensal de visitas por cliente**, logo abaixo dos botões de registro e do resumo anual.

### O que mostra

- Seleção de mês e ano, com navegação entre meses anteriores e seguintes;
- Seleção de carteira: **Todos**, **Saber Nutrir** ou **Bruna Ribeiro**;
- Contagens separadas de **Minhas visitas**, **Visitas da equipe** e **Total realizado**;
- Relação de clientes com esses três números, sem listar dias ou horários;
- No filtro **Todos**, subtotais próprios das carteiras Saber Nutrir e Bruna Ribeiro;
- Botão de **baixar o relatório mensal em PDF**, com layout gerencial, totais e tabela por cliente.

### Como os números são calculados

O resumo reutiliza a contabilização de visitas efetivas da Supervisão:

1. Entram visitas concluídas na agenda e no planner da equipe. Visitas apenas programadas ficam fora do realizado.
2. Treinamentos marcados como realizados também contam como visita técnica, sem duplicar uma visita própria registrada para o mesmo cliente no mesmo dia.
3. Os atendimentos da Bruna em clientes vinculados à **Saber Nutrir** aparecem em **Minhas visitas**, dentro da **carteira Saber Nutrir**. Não entram na carteira Bruna Ribeiro.
4. Os atendimentos para clientes diretos da Bruna aparecem na **carteira Bruna Ribeiro**.
5. As visitas registradas no cronograma das nutricionistas aparecem na coluna **Equipe**.

O campo **Cliente** refere-se ao estabelecimento atendido. A carteira é uma classificação adicional para os relatórios gerenciais.

### Atualização

Substitua o arquivo `index.html` no GitHub pelo que está nesta pasta. Na tela **Supervisão**, a marca de versão passa a indicar **v84**.

Nenhuma alteração de banco de dados é necessária. Os dados existentes são preservados.
