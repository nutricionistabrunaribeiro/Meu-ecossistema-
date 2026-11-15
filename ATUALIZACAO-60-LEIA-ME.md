# Meu Ecossistema • Atualização 60

## Correção do formulário de pedidos de oração no iPhone

Esta atualização parte do **index.html da versão 59**, preservando o calendário de feriados e datas importantes, os demais módulos e os dados já cadastrados.

### O que foi ajustado

- Os campos **Data** e **Semana de oração** não ultrapassam mais a largura da janela no Safari do iPhone.
- Os campos de texto, seleção e anotações respeitam a largura disponível, mesmo em telas estreitas.
- O formulário tem espaçamento e tamanho de título adequados para celular.
- Se o formulário não couber na altura da tela, a rolagem ocorre **dentro da janela**, mantendo o botão de salvar acessível.
- A correção é visual: **não altera datas escolhidas, semana de oração, status, registros ou regras de salvamento**.

### Como publicar

1. Abra o ZIP e localize `index.html`.
2. No GitHub do **Meu Ecossistema**, substitua **somente o arquivo `index.html`** da raiz pelo deste pacote.
3. Aguarde a implantação na Vercel.
4. No iPhone, feche e reabra o Meu Ecossistema; caso apareça o layout antigo, atualize o site para renovar o cache.
5. Em **Na Presença → Pedidos de oração → Novo registro**, confira os dois campos de data e o botão de salvar.

**Não é necessário alterar o banco de dados ou os arquivos do Scriptable.** Os widgets da tela inicial são uma atualização separada.

### Observação de teste

Foi feita inspeção estática do HTML/CSS e da estrutura do modal. A renderização real em Safari/iPhone precisa ser conferida após a publicação, porque o ambiente de testes não permitiu iniciar um navegador local.
