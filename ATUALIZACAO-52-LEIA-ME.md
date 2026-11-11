# Meu Ecossistema • Bruna Ribeiro — Atualização 52

## Base e proteção contra retrocessos
Esta atualização foi feita a partir do `index(2).html` de 742.100 bytes enviado pela usuária, que contém os três ambientes Trabalho, Pessoal e **Na Presença**, Jornada Bíblica, oração, Dashboard independente e Radar de Recorrências. Não foi feita migração nem exclusão de tabelas no Supabase.

## Atualizações
1. **Meu Ano em Pixels:** apenas a apresentação mudou: 12 meses como linhas e até 31 quadradinhos por linha, cabendo na largura do dispositivo. A função `marcarPixelDia`, a sequência de estados (Tenso → Bom → Produtivo → Ótimo → sem registro) e a tabela `registros_pixel` continuam iguais.
2. **Versículo do dia:** a Bible API removeu a tradução Almeida em novembro de 2026. A consulta automática agora utiliza a **Bíblia Portuguesa Mundial (BPM)**, indicada como domínio público pelo fornecedor de API Midvash. O nome da tradução aparece ao lado da referência. Em caso de falha, o aplicativo mostra uma mensagem real de erro e um botão para tentar novamente; se houver último versículo válido, mostra-o como *passagem anterior*, sem chamá-lo de passagem de hoje. A NAA permanece apenas para inserção manual autorizada, sem troca de atribuição.
3. **Controle de Horas:** janela de edição dimensionada para a tela do iPhone, com campos responsivos e rodapé de ações rolável/fixo dentro da janela.

## Como publicar sem perder os arquivos auxiliares da versão 51
* Faça uma cópia do repositório atual, ou crie um commit/backup antes de substituir.
* Atualize o **index.html** na raiz do repositório com o que está neste ZIP.
* **Não exclua nem substitua** os arquivos auxiliares já existentes no GitHub. Em especial, o aplicativo referencia `na-presenca.js`, `visual-v44.js`, `visual-v45.js`, `visual-v45.css`, `pessoal-v46.js`, `pessoal-v46.css`, `widgets-v47.js`, `widgets-v47.css`, `proximos-passos.js` e `offline-drafts.js`. Nem todos foram enviados nesta conversa. O ZIP inclui apenas os auxiliares que estavam disponíveis e não precisa substituir os arquivos que já estiverem no repositório.
* Aguarde o deploy Vercel, feche e reabra o aplicativo no iPhone e limpe o cache se necessário.

## Testes
* Sintaxe dos scripts inline verificada pelo Node.js.
* Teste simulado da marcação: 365 botões, 12 meses e sequência dos quatro estados, incluindo exclusão.
* Teste simulado do parser bíblico e do endereço da nova API; é necessário validar a consulta externa em produção, pois não havia acesso direto à resposta ao montar o pacote.
* Não foram testados login real, conexão ao Supabase, interface visual no Safari real nem atualização completa na Vercel.

## Observação
Este é um pacote de atualização **para aplicar sobre a versão 51 já publicada**. Ele não é uma reconstrução independente de todos os arquivos auxiliares da versão 51, pois alguns não foram fornecidos. Para gerar uma cópia autônoma do aplicativo inteiro, será necessário reunir esses auxiliares também.
