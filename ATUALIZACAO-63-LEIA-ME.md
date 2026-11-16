# Meu Ecossistema • Atualização 63

## Biblioteca anual de devocionais
Caminho: Na Presença → Devocionais de dezembro. Há também um atalho na Visão Geral.

- Dezembro de 2026 preservado, com os 31 dias, as artes e o PDF original.
- Dezembro de 2027 com 31 novas leituras, reflexões, orações, práticas e frases para stories, consagrando 2028.
- Seleção de edição por ano e destaque da edição do ano corrente quando disponível.
- Em dezembro, abre no dia correspondente quando a edição do ano estiver disponível.
- Jejuns de 2027: quartas-feiras, 1, 8, 15, 22 e 29 de dezembro.
- Artes de 2027 e de edições importadas geradas no aparelho em PNG de 1080 × 1920, com o ano correto.
- PDF de 2026 e 2027 embutido. Para futuras edições importadas, a opção Imprimir / salvar PDF abre uma versão pronta para impressão.

## Publicação
1. Extraia este ZIP.
2. Substitua SOMENTE o index.html na raiz do repositório do Meu Ecossistema no GitHub.
3. Mantenha os demais arquivos do aplicativo. Não apague o repositório.
4. Aguarde a publicação automática na Vercel e reabra/atualize o aplicativo.
5. Acesse Na Presença → Devocionais de dezembro e escolha 2026 ou 2027.

A versão 63 já inclui as atualizações 61 e 62. Não precisa instalá-las antes. O banco de dados e os registros pessoais não são alterados.

## Próximos anos
A estrutura é permanente, mas a mudança de ano não escreve mensagens sozinha. Novas edições são preparadas e revisadas antes de entrar na biblioteca.

Uma tarefa foi programada no ChatGPT para 1º de novembro pela manhã, anualmente, a partir de 2027. Ela prepara a edição do ano para revisão; se já existir, apresenta e revisa o conteúdo disponível. A tarefa não publica no GitHub/Vercel e não envia mensagens a outras pessoas.

Depois da revisão, use Adicionar e guardar edições → Importar edição revisada e selecione o arquivo JSON recebido. O aplicativo confere o formato e a presença dos 31 dias. Não substitui as edições incluídas de 2026 e 2027. Uma edição importada do mesmo ano só é substituída após confirmação.

Edições importadas ficam neste navegador/aparelho: elas não sincronizam automaticamente com sua conta. Use Exportar esta edição para guardar o arquivo e importá-lo em outros aparelhos. Limpar os dados do navegador pode remover edições importadas. As edições incluídas no aplicativo continuam disponíveis.

Quando não existe uma edição do ano corrente, o aplicativo avisa e oferece as anteriores; ele não muda a data de um conteúdo antigo para apresentá-lo como novo.

## Conteúdo do pacote
- index.html: arquivo a publicar no GitHub.
- ATUALIZACAO-63-LEIA-ME.md: estas instruções.
- Devocional-Dezembro-2027.json: edição de 2027 em formato reutilizável; já está incluída no aplicativo.
- Devocional-Dezembro-2027-Consagrando-2028.pdf: edição pronta para imprimir.

## Formato de novas edições
JSON: formato = meu-ecossistema-devocional, versao = 1, ano inteiro entre 2026 e 2200, titulo, subtitulo, dias.
A lista dias deve conter exatamente 31 objetos em ordem, cada um com dia, titulo, referencia, reflexao, oracao, pratica e frase.
Limites de caracteres: titulo da edição 100; subtitulo 240; titulo diário 160; referencia 180; reflexao 4000; oracao 1600; pratica 1200; frase 220. Arquivo de texto de até 400 KB, sem imagens ou scripts. As quartas-feiras são calculadas automaticamente para o ano escolhido. Os textos e as práticas precisam estar coerentes com essas datas.

## Verificações
Sintaxe dos scripts; 62 leituras; seleção por ano; calendários com quatro e cinco quartas-feiras; rejeição de arquivos incompletos; preservação das edições; falhas de armazenamento; escape de texto importado. Prévia isolada da troca de ano e da arte de 2027 verificada no navegador. Não foi realizado teste em sessão autenticada completa, publicação na Vercel ou iPhone físico.

Esta entrega prepara os arquivos, mas não publica automaticamente a atualização.
