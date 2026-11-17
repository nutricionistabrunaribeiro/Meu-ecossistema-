# Meu Ecossistema • Bruna Ribeiro — versão 76

## Supervisão: painel único e resumo gerencial

### O que mudou

- Um único painel **Minhas entregas**, com seis indicadores: treinamentos realizados, programados, vencidos, a vencer em 30 dias, visitas técnicas realizadas e visitas de supervisão realizadas.
- Mantidos os filtros **Todos / Saber Nutrir / Bruna Ribeiro** e o seletor de ano. Todos os indicadores e o PDF respeitam o filtro escolhido.
- Os detalhes por registro foram retirados da tela de Supervisão; ficam somente no relatório anual em PDF.
- No PDF, as **visitas técnicas** são contadas por cliente, sem uma linha para cada data e horário de visita.
- No PDF, **visitas de supervisão** e **treinamentos** têm detalhes de data e cliente para apresentação à gestão.
- O PDF apresenta consolidado por cliente, resultados anuais e seção de treinamentos vencidos ou a vencer com base na última realização de cada tema.
- A validade dos treinamentos permanece em **seis meses**. Quando há reciclagem nova do mesmo tema para o mesmo cliente, só ela determina o vencimento atual; a anterior permanece no histórico de realizações.
- Novas visitas criadas pelo botão **+ Visita de supervisão** recebem identificação de supervisão no título, mesmo quando o usuário personaliza o assunto.
- O resumo legado “Do planejamento à entrega”, se ainda estiver presente por alguma composição antiga da tela, é ocultado ao abrir Supervisão.

### Como são contadas as visitas

- **Visita de supervisão:** evento concluído da Agenda com título que identifica supervisão. Visitas novas criadas pelo botão próprio são identificadas automaticamente.
- **Visita técnica:** demais eventos concluídos do tipo visita na Agenda.
- Os registros antigos com títulos genéricos, como “Visita”, continuam classificados como técnicos até que a descrição seja identificada como supervisão.

### Publicação

1. Guarde uma cópia da versão que está publicada.
2. Abra `Meu-Ecossistema-v76/index.html` e atualize o `index.html` do seu repositório GitHub.
3. Aguarde o deploy da Vercel. Recarregue o aplicativo no iPhone, se necessário.

Nenhuma tabela nova ou alteração do banco de dados é exigida nesta versão.
