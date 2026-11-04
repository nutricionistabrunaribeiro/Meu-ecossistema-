# Meu Ecossistema na tela inicial do iPhone

Esta versão usa o Scriptable, um aplicativo auxiliar para iPhone. Não precisa deixar o Ecossistema aberto. Você faz a instalação no seu aparelho; o ZIP, sozinho, não instala widgets no iPhone.

## 1. Atualizar seu Ecossistema

Extraia Ecossistema47-completo.zip e envie todos os arquivos extraídos ao seu repositório GitHub, substituindo as versões anteriores. Mantenha o index.html na raiz. Aguarde a publicação da Vercel. Abra o aplicativo atualizado e entre na sua conta.

Os arquivos novos precisam acompanhar o index.html: widgets-v47.js, widgets-v47.css e Meu-Ecossistema-Widget.js. A pasta supabase contém o código de referência do servidor. A conexão do servidor já foi preparada no projeto atual; você não precisa executar SQL ou publicar essa pasta manualmente para usar este projeto.

## 2. Preparar o Scriptable

1. Instale pela App Store: https://apps.apple.com/br/app/scriptable/id1405459188
2. No Ecossistema, abra **Configurações gerais → Widgets iPhone**.
3. Toque em **Ver e copiar código do widget → Copiar código inteiro**.
4. Abra o Scriptable, toque em **+**, cole todo o código e nomeie o script **Meu Ecossistema**. O arquivo Meu-Ecossistema-Widget.js do ZIP contém o mesmo código.

## 3. Conectar sua conta

1. Volte à aba Widgets iPhone no Ecossistema. Dê um nome à conexão e escolha quais indicadores autorizar.
2. Toque em **Gerar conexão para meu iPhone → Copiar chave**.
3. Execute o script no Scriptable e cole a chave quando ele pedir. Escolha um indicador para visualizar.

A chave não é sua senha. Ela fica guardada no Keychain do Scriptable; o banco guarda somente seu resumo criptográfico. Ela permite consultar apenas os indicadores autorizados. Você pode revogá-la em **Minhas conexões → Desativar**. Se perder a chave antes de conectar, desative a conexão e gere outra.

## 4. Adicionar o widget

1. Pressione uma área vazia da tela inicial do iPhone.
2. Abra Editar → Adicionar Widget, ou o botão +, conforme sua versão do iOS.
3. Procure **Scriptable** e adicione um widget. Comece pelo tamanho médio.
4. Segure o widget → **Editar Widget** → **Script: Meu Ecossistema**.
5. No campo **Parameter / Parâmetro**, escreva um destes nomes:

| Parâmetro | Indicador |
| --- | --- |
| agua | Volume registrado hoje e progresso da meta |
| habitos | Hábitos registrados hoje e pendências |
| agenda | Próximo compromisso em aberto e resumo do dia |
| versiculo | Versículo escolhido ou passagem do dia, com tradução identificada |
| oracao | Pedidos da semana e registros de oração de hoje |

6. Em When Interacting / Ao interagir, escolha executar o script se essa opção aparecer. O endereço do Ecossistema é configurado no próprio widget para abrir a área correspondente ao toque. O iOS pode abrir esse endereço no navegador; entre na sua conta se solicitado.

Repita para adicionar vários widgets, com parâmetros diferentes. Os tamanhos pequeno e médio têm layouts próprios; o grande usa o conteúdo do médio com mais espaço.

## Uso e atualização

- Os widgets mostram dados já salvos online. Para registrar água, marcar hábitos ou oração, toque para abrir o Ecossistema.
- O iOS controla a frequência de atualização. O script solicita uma nova atualização após cerca de 30 minutos, mas esse intervalo não é garantido. Execute o script no Scriptable para conferir os dados mais recentes.
- Tema, meta de água, fuso e versículo escolhido são enviados à conexão quando você usa o Ecossistema. Existe também o botão **Aplicar tema, meta e versículo atuais**. Se usar vários aparelhos, prevalecem as preferências aplicadas mais recentemente.
- A agenda mantém a precisão por hora do aplicativo atual. O painel de oração considera a semana iniciada na segunda-feira e mostra no máximo três nomes, sem as anotações dos pedidos.
- Sem internet, o widget informa que não conseguiu atualizar. Se a conexão for desativada, a próxima consulta será bloqueada; uma imagem já exibida pode permanecer até o iOS atualizar.

## Verificação desta entrega

Foram verificados o código, os cinco indicadores com a conexão real do servidor, bloqueio de acesso sem chave e após revogação, autorização por indicador, filtros por usuário e a tela web de configuração. Os layouts Scriptable foram exercitados com uma simulação das APIs. A instalação e a aparência final no iPhone físico ainda precisam ser conferidas no seu aparelho.
