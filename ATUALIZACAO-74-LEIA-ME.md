# Meu Ecossistema · Bruna Ribeiro — Atualização 74

**Base:** versão 73. **Data:** 17/11/2026.

## O que mudou

1. **Supervisão:** o menu "Entregas" passou a se chamar "Supervisão". Visitas, treinamentos, reciclagens, outras entregas e o resumo anual aparecem em um painel mais compacto, com detalhamento expansível por cliente. Os registros antigos foram preservados; a rota interna permanece `entregas` para não quebrar os atalhos.
2. **Treinamentos da Agenda:** compromissos do tipo "Treinamento" marcados como concluídos e com data realizada entram automaticamente na contagem de entregas, painel, fechamento e resumo anual. Se houver um registro correspondente no controle de treinamentos para o mesmo cliente, data e tema, ele não será contado novamente.
3. **Reciclagem em seis meses:** a próxima validade é calculada por **seis meses de calendário** após a data de realização. Existe opção de ajuste manual. Exemplo: 31/08/2026 → 28/02/2027.
4. **Histórico renovado:** ao concluir um treinamento posterior do mesmo tema para o mesmo cliente, o anterior permanece como **"Histórico · renovado"**. Somente o mais recente é avaliado para os alertas. Para identificar a mesma linha, o sistema desconsidera prefixos como "Treinamento" e "Reciclagem"; se os assuntos forem diferentes, cada assunto tem seu próprio ciclo.
5. **Formulário no iPhone:** as datas são mostradas em formato legível e selecionadas em um calendário próprio, evitando os campos nativos de data que apareciam como blocos vazios. Ações permanecem acessíveis na parte inferior do formulário.
6. **Agenda inteligente:** sugestões de agendamento considerando a frequência de visitas cadastrada nos clientes e as visitas já previstas no mês; nada é criado automaticamente.
7. **Comercial:** sugestão opcional de renovação por cliente. O prazo é guardado no campo de vigência já existente, com a marca "Renovação prevista"; clientes sem prazo não são sinalizados. O prazo pode ser ajustado ou removido.

## Como atualizar

1. Faça uma cópia de segurança do projeto GitHub e, dentro do aplicativo, exporte seus dados caso utilize esse recurso.
2. Na raiz do repositório existente, substitua o arquivo **`index.html`** pelo desta versão. **Não** apague os demais arquivos do repositório, como CSS, JavaScript, manifestos e service worker.
3. Confirme a alteração no GitHub e aguarde a atualização da Vercel. Abra a versão publicada e atualize a página no iPhone. Se o atalho instalado continuar exibindo a interface antiga, feche e abra o aplicativo novamente.
4. Valide com um cliente: registre um treinamento antigo e outro mais recente do mesmo tema, conclua um compromisso de treinamento na Agenda e verifique **Supervisão → Reciclagens**.

**Banco de dados:** não foi necessária nova migração. Foram reutilizadas as tabelas `eventos`, `treinamentos_cliente`, `clientes`, `entregas` e `entrega_clientes` já utilizadas na versão 73.

**Observação importante:** se dois treinamentos equivalentes tiverem nomes muito diferentes, padronize o tema para que sejam reconhecidos como a mesma reciclagem. A contagem de participantes depende do valor informado no registro específico; os compromissos da Agenda, por si só, não armazenam essa quantidade.

**Testes realizados:** validação sintática dos cinco scripts e testes automatizados das regras de seis meses, fusão Agenda/Supervisão e renovação do treinamento antigo. A inspeção visual automatizada no navegador não pôde ser executada no ambiente de testes; recomenda-se conferir o formulário no iPhone após a publicação.
