# Meu Ecossistema — atualização 42

- Ano em Pixels: somente layout, com os 12 meses em linhas e 31 colunas de dias; a função `marcarPixelDia` e a tabela `registros_pixel` foram mantidas sem alteração.
- Controle de Horas: janela de correção adaptada à largura do celular.
- Versículo: tratamento de erros da Bible API, botão de nova tentativa, preservação da última passagem válida; não atribui mensagem de erro à tradução Almeida.
- A busca automática continua usando Almeida; a NAA permanece apenas para inserção manual com atribuição.

O código passou pela verificação sintática do Node.js e o ZIP passou na verificação de integridade. Testes no navegador/iPhone e no ambiente publicado ainda são necessários.
