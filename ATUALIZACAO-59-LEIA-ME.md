# Meu Ecossistema • Atualização 59

## Novidade: feriados e datas importantes na Minha agenda

A versão 59 foi construída sobre o **index.html da atualização 58**, sem remover módulos nem alterar dados existentes.

### O que aparece automaticamente

- Feriados nacionais, além do **9 de julho**, feriado estadual de São Paulo.
- Pontos facultativos **federais de 2026**, incluindo a transferência do Dia do Servidor Público para **30/10/2026**. Também estão identificadas as particularidades estaduais de SP de 2026.
- **Pontos facultativos previstos para 2027**, explicitamente marcados como *previsão* até a publicação do calendário federal.
- Datas comemorativas gerais, familiares e comerciais: Dia da Mulher, Dia do Cliente, Dia das Mães, Dia dos Pais, Páscoa, Dia das Crianças, Dia dos Professores, Black Friday, entre outras.
- As datas técnicas da profissão (Dia do Nutricionista, Dia Mundial da Alimentação, higiene e segurança dos alimentos) permanecem na camada existente **Datas da área**.

### Onde encontrar

1. Abra **Trabalho → Agenda**.
2. Selecione **Mês / Calendário** para ver a marcação dos dias e a relação **Datas importantes do mês** abaixo.
3. Toque em um dia para abrir os detalhes e os demais compromissos desse dia.
4. Use **Exibir** para ligar/desligar **Feriados**, **Pontos facultativos** e **Datas comemorativas** independentemente.

As datas também são exibidas como avisos nas visões **Dia** e **Semana**.

### Importante

- **Não cria eventos duplicados no banco**: o calendário é gerado automaticamente no navegador e é reproduzido em qualquer aparelho após a publicação do novo index.html.
- Os compromissos pessoais e profissionais já cadastrados permanecem intactos.
- **Ponto facultativo não é feriado e não garante folga no setor privado**. As regras citadas referem-se aos órgãos públicos identificados.
- Os feriados municipais **não estão incluídos** porque dependem da cidade. A configuração inicial considera Brasil + Estado de São Paulo.
- Os pontos facultativos federais de 2027 são informativos, **não estão confirmados** e devem ser revistos após a publicação da portaria daquele ano.
- Não há alertas ou notificações automáticas novos: as datas são referências visuais no calendário.

### Como publicar

Substitua **somente o arquivo index.html** na raiz do repositório do Meu Ecossistema por este novo arquivo e aguarde a atualização na Vercel.

Não é necessário rodar SQL nem alterar tabelas do Supabase.

### Referências oficiais

- Portaria MGI nº 11.460/2025, feriados e pontos facultativos federais de 2026:
  https://legis.sigepe.gov.br/sigepe-bgp-ws-legis/legis-service/download/?id=0026440285-ALPDF%2F2025
- Portaria MGI nº 8.821/2026, transferência do ponto facultativo de 28 para 30 de outubro de 2026:
  https://anvisalegis.datalegis.net/action/ActionDatalegis.php?acao=abrirTextoAto&cod_menu=9387&cod_modulo=630&link=S&numeroAto=00008821&orgao=GM%2FMGI&seqAto=000&tipo=POR&valorAno=2026
- Lei nº 9.497/1997, feriado estadual de 9 de julho:
  https://www.al.sp.gov.br/repositorio/legislacao/lei/1997/lei-9497-05.03.1997.html
- Decreto estadual nº 70.273/2025, pontos facultativos estaduais de SP em 2026:
  https://www.al.sp.gov.br/repositorio/legislacao/decreto/2025/decreto-70273-23.12.2025.html
