# Versão 51 — corrigir Iniciar atividade

## Faça esta atualização primeiro

1. Extraia Ecossistema51-completo.zip e envie todos os arquivos ao GitHub, incluindo **iniciar-atividade.html**, **index.html**, **widgets-v47.js** e **Meu-Ecossistema-Widget.js**. Mantenha-os na raiz, junto aos demais arquivos existentes. Aguarde a Vercel publicar.
2. Abra seu Ecossistema no Safari. Entre em Configurações gerais → Widgets iPhone. A tela deve indicar **versão 51**.
3. Toque em **Copiar código geral: Meu Ecossistema**, depois em Copiar código inteiro. No Scriptable, abra o script Meu Ecossistema, substitua todo o código e salve. O arquivo **Meu-Ecossistema-codigo-geral-v51.txt** deste ZIP contém o mesmo código.
4. No widget da tela inicial, mantenha Script: **Meu Ecossistema** e Parameter/Parâmetro: **horas**. A chave já existente continua valendo para os outros indicadores.
5. Toque no widget. Ele aponta para uma página própria em **https://meu-ecossistema.vercel.app/iniciar-atividade.html**, que abre diretamente o formulário de atividade, com cliente, carteira, tipo e observação. Se precisar entrar na conta, a página mantém o destino depois do login.

Nesta correção é necessário atualizar o aplicativo **e** o script. Só trocar o script, mantendo o aplicativo antigo, não disponibiliza a página nova e pode resultar em erro de página não encontrada. A publicação pelo GitHub/Vercel continua sendo feita por você.

O cronômetro só começa ao tocar em **Iniciar agora**. Se houver uma atividade ativa, a página mostra esse registro, sem oferecer outro início. Se não conseguir conferir os dados de horas, bloqueia o início e oferece tentar novamente.

Os demais parâmetros continuam: **agenda**, **habitos**, **agua**, **versiculo** e **oracao**. Você pode manter todos os widgets usando o mesmo script geral. Não é necessário excluir widgets ou gerar novas conexões.

A abertura direta da página e os campos de deslocamento foram conferidos no navegador em uma prévia com dados de exemplo. A consulta real da conta, a gravação do início e o acionamento pelo widget no iPhone ainda precisam ser conferidos no seu aparelho, após publicar e instalar esta versão.

---

## Referência dos demais widgets

## Minha Agenda — somente hoje, como checklist

A versão 50 lista exclusivamente os compromissos do dia atual no fuso configurado na conexão. Inclui os já concluídos e os que ainda estão em aberto, em ordem de horário. Cada linha mostra ☑ ou ☐, horário, cliente quando houver e título. As caixas são indicadores visuais: para concluir ou reabrir compromissos, toque para abrir a agenda no Ecossistema e faça a marcação lá.

O tamanho médio mostra até cinco linhas, o pequeno até duas e o grande até doze. Se houver mais, o rodapé informa a página e quantos itens não estão nela. No campo Parâmetro do script Minha Agenda, use 2, 3 etc. para outras páginas do mesmo dia. O script genérico aceita agenda:2 etc. Não existe rolagem dentro deste widget. O título de uma linha longa pode ser cortado; consulte o texto completo no aplicativo.

Não inclui compromissos passados ou futuros de outras datas. O dia é calculado no fuso que foi aplicado pelo Ecossistema à conexão. O iOS controla quando a tela inicial refaz a consulta; execute o script no Scriptable para conferir após a virada do dia ou uma alteração.

## Demais indicadores

- Minha Hidratação: água registrada online hoje e progresso da meta.
- Meus Hábitos: quantidade de hábitos registrados hoje e pendências.
- Meu Versículo: passagem escolhida ou automática com tradução identificada.
- Minha Oração: pessoas ou pedidos da semana, com marcações de hoje e sem o texto privado das anotações.

## Conexão e atualização

A chave fica no Keychain do Scriptable. O servidor guarda seu resumo criptográfico e permite apenas leitura dos indicadores autorizados. É possível revogar em Minhas conexões → Desativar. O Scriptable pode ser instalado pela App Store: https://apps.apple.com/br/app/scriptable/id1405459188

O iOS decide quando atualizar; o script solicita uma atualização depois de cerca de 30 minutos, sem garantia de intervalo exato. Tema, meta de água e versículo são aplicados ao abrir o Ecossistema, ou pelo botão Aplicar tema, meta e versículo atuais. A instalação e o visual no aparelho devem ser conferidos no iPhone.

## Validação técnica

Verificadas autenticação, revogação, isolamento por usuário, campos retornados, simulação dos cinco layouts, três scripts independentes sem parâmetro, aliases e páginas de agenda. A regressão da agenda usou 605 compromissos em duas páginas do banco, incluindo concluídos e passados, para garantir que a consulta não fique limitada ao próximo evento.


## Novo visual do versículo — versão 50

O versículo tem composição centralizada, fonte Georgia com serifa, referência destacada e assinatura discreta. Mantém fundo, texto e detalhes do tema escolhido. A tradução continua identificada. Nos widgets pequenos ou com passagens longas, o texto pode ser reduzido ou truncado pelo iOS: toque para abrir o Ecossistema e ler a passagem completa. Para aplicar este visual, substitua o código do script Meu Versículo pelo novo, executando-o uma vez no Scriptable. Atualizar apenas o GitHub não muda o código já instalado no Scriptable.

## Novo widget: Iniciar atividade

1. Atualize o aplicativo com a versão 50 e aguarde a publicação na Vercel.
2. Pelo aplicativo publicado, abra Configurações gerais → Widgets iPhone → Copiar código: Iniciar atividade.
3. No Scriptable, crie um novo script chamado Iniciar atividade, cole todo esse código e execute uma vez.
4. Adicione um widget Scriptable à tela inicial, edite-o e escolha o script Iniciar atividade. Não precisa preencher Parâmetro.
5. Ao tocar no widget, ele abre diretamente Trabalho → Controle de horas e o formulário de início. Se precisar entrar na conta, o formulário abre depois do login e carregamento dos dados.
6. Escolha tipo, cliente e carteira, e toque em Iniciar agora. O horário começa nesse momento. Se já houver atividade ativa, o aplicativo avisa e mantém o cronômetro existente.

Este widget é um atalho para o formulário. Ele não exibe o tempo transcorrido e não inicia nem finaliza registros em segundo plano. Não precisa gerar chave, pois nenhum dado de horas é consultado pelo widget. O código copiado pelo aplicativo recebe o endereço da sua publicação e uma cópia das cores atuais. Para mudar o tema deste atalho, copie novamente o código pelo aplicativo após escolher as novas cores.

Se usar diretamente o arquivo Widget-Iniciar-Atividade.js do ZIP, execute-o no Scriptable e informe o endereço HTTPS do seu Ecossistema publicado quando solicitado. Não informe a URL do GitHub nem a URL do Supabase.

A tela web, os dados e os atalhos seguem no pacote completo. A aparência final e a abertura no iPhone físico precisam ser conferidas no seu aparelho; o navegador pode pedir login. Não é necessário criar uma nova conexão para os widgets de leitura que já funcionam.
