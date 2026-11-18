# Meu Ecossistema • Bruna Ribeiro — versão 82

## Ajuste no módulo Supervisão

O indicador **Treinamentos vencidos** agora é um botão.

Ao tocar no card, abre uma janela com:

- Nome do cliente;
- Tema do treinamento;
- Data do último treinamento realizado;
- Data em que a validade de seis meses terminou.

A lista respeita a seleção **Todos / Saber Nutrir / Bruna Ribeiro** e o ano do painel. O número mostrado no card e a lista aberta são calculados a partir da **mesma fonte**, evitando divergências.

Para cada cliente e tema, somente o treinamento realizado mais recente determina se a reciclagem está vencida. Um treinamento novo renova a validade do anterior, preservando o histórico.

Em celulares, a janela tem rolagem própria quando houver muitos registros.

## Como atualizar

1. Abra a pasta `Meu-Ecossistema-v82` deste ZIP.
2. No GitHub, substitua o arquivo `index.html` anterior pelo `index.html` desta versão.
3. Aguarde a publicação na Vercel e reabra o aplicativo, atualizando a página se necessário.

Esta atualização não altera os dados já cadastrados nem exige mudanças no banco de dados.
