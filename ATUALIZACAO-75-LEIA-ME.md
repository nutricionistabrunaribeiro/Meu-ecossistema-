# Meu Ecossistema • Bruna Ribeiro — versão 75

**Base:** atualização 74 • **Data:** 17/11/2026.

## Tela Supervisão, mais simples

- Quatro indicadores, e somente eles: **Treinamentos realizados**, **Treinamentos programados**, **Visitas realizadas**, **Visitas programadas**.
- Mantidos os botões de registrar treinamento, registrar visita e baixar resumo anual.
- Retirados da página os históricos, as listas por cliente, o card de reciclagens vencidas e o card de outras entregas. Os registros permanecem salvos.
- Mantida a navegação por ano.
- Adicionada seleção da carteira: **Todos**, **Saber Nutrir** ou **Bruna Ribeiro**.

## Relatório anual em PDF para apresentação

Ao tocar em **Resumo anual em PDF**, o sistema gera um documento A4 com:

1. Cabeçalho profissional e identificação do ano e da carteira;
2. Quatro indicadores do período;
3. Quadro de resultados por cliente;
4. Histórico detalhado das visitas realizadas e programadas;
5. Histórico detalhado dos treinamentos realizados e programados;
6. Rodapé, data de emissão e paginação.

**Separação de carteiras:** ao selecionar Saber Nutrir, o documento contém apenas os registros dos clientes vinculados a essa carteira. O mesmo vale para Bruna Ribeiro. Em Todos, apresenta as duas carteiras.

**Como o filtro funciona:** clientes vinculados ao contratante Saber Nutrir e os marcados como "vinculado" são agrupados em Saber Nutrir; os demais clientes cadastrados ficam em Bruna Ribeiro. Registros sem cliente são exibidos apenas em "Todos", exceto quando a categoria da Agenda permite identificar a carteira.

**Contabilização:** treinamentos da Agenda concluídos são considerados, mantendo a lógica de não duplicar um lançamento manual correspondente. Registros programados possuem data no ano selecionado e ainda não estão concluídos.

## Instalação

1. Faça backup antes de atualizar.
2. Copie o **`index.html`** desta pasta para a raiz do repositório GitHub do Meu Ecossistema.
3. Substitua apenas o arquivo correspondente. Mantenha no GitHub os demais arquivos, inclusive CSS, JavaScript, manifestos e service worker.
4. Aguarde o deploy da Vercel e atualize o aplicativo no iPhone.

**Banco de dados:** a versão 75 reutiliza os registros existentes. Nenhuma migração SQL é necessária.

**Verificações:** sintaxe dos scripts, contagem dos quatro indicadores, filtragem das duas carteiras e geração lógica de PDF com conteúdo restrito à carteira escolhida.
