# Meu Ecossistema • Bruna Ribeiro — Atualização 64

## Jornada Bíblica: versículos e ciclos de leitura

Esta versão parte da **v63 — Biblioteca Anual** e mantém as funções anteriores.

### O que mudou

- No painel já existente de **Jornada Bíblica**, são exibidos agora: percentual, capítulos, livros, **versículos lidos** e **quantas Bíblias inteiras foram concluídas**.
- Ao marcar um capítulo, a contagem de versículos daquele capítulo é acrescentada automaticamente. Ao desmarcá-lo, os versículos são descontados.
- A referência de contagem é de 66 livros, 1.189 capítulos e **31.102 versículos** (numeração tradicional da Bíblia protestante). Por exemplo, Gênesis 1 tem 31 versículos.
- **Somente após marcar todos os 1.189 capítulos** aparece a opção **Registrar conclusão e começar uma nova leitura**.
- Ao confirmar, a leitura concluída entra no histórico e uma nova leitura começa do zero; o contador de Bíblias concluídas é mantido e incrementado.
- A virada de ciclo não apaga os registros dos ciclos anteriores.

### Publicação no GitHub

1. Abra o repositório do Meu Ecossistema.
2. Substitua o arquivo **`index.html`** da raiz pelo `index.html` deste ZIP.
3. Mantenha seus outros arquivos e configurações do repositório; não exclua nada.
4. Após a publicação na Vercel, abra **Na Presença → Jornada Bíblica** e confira os novos indicadores.

**Banco de dados:** a migração v64 foi aplicada diretamente no projeto Supabase em 17/11/2026 e validada, **sem perda dos 520 capítulos registrados**. O arquivo `BANCO-V64-JORNADA-BIBLICA.sql` acompanha o pacote para documentação/recuperação; **não é necessário executá-lo novamente** neste mesmo projeto.

### Observações

- A marcação continua sendo feita por capítulo, não por versículo isolado.
- O contador de Bíblias concluídas passa a registrar conclusões feitas com o novo botão. Não presume conclusões anteriores que não tenham sido registradas.
- A contagem de versículos segue a numeração tradicional; algumas traduções apresentam pequenas diferenças de divisão ou numeração.
- A pasta contém os materiais de dezembro que já vinham na v63, sem alterações.

**Meu Ecossistema • Bruna Ribeiro**
