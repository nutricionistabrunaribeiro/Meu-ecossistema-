# Widgets iPhone — versão 49

## Corrigir os três widgets iguais

Os widgets anteriores usavam o último indicador escolhido quando o Parâmetro estava vazio. Para corrigi-los sem criar scripts novos: segure cada widget → Editar Widget → Parameter/Parâmetro. Preencha agenda no de agenda, habitos no de hábitos e agua no de hidratação. Só mudar o nome da conexão não muda o indicador do widget.

A versão 48 também oferece códigos separados, que dispensam esse parâmetro. Esta é a opção recomendada para facilitar sua configuração.

## Atualizar o aplicativo e os scripts

1. Extraia Ecossistema49-completo.zip e envie os arquivos ao GitHub, com index.html na raiz, como na atualização anterior. Aguarde a Vercel publicar e reabra o Ecossistema pelo Safari.
2. Abra Configurações gerais → Widgets iPhone. Na etapa 1, existem botões de código para cada indicador.
3. Copie o código de Agenda. No Scriptable, crie um script chamado Minha Agenda e cole esse código inteiro. Repita com Meus Hábitos e Minha Hidratação, usando os respectivos códigos. Os seis arquivos Widget-*.js do ZIP têm os mesmos códigos.
4. Execute cada script uma vez para conferir. A conexão da versão 47 continua válida e é compartilhada pelos scripts neste aparelho; não precisa gerar outra chave. Se precisar conectar, use uma chave que autorize os indicadores desejados.
5. Na tela inicial, segure cada widget → Editar Widget → Script. Escolha Minha Agenda, Meus Hábitos ou Minha Hidratação conforme o widget. Deixe Parâmetro vazio nos scripts específicos.

Importante: atualizar o GitHub não substitui o código já colado no Scriptable. Para receber a lista de compromissos, atualize também esse código no Scriptable conforme os passos acima.

## Minha Agenda

A agenda passa a considerar todos os compromissos salvos da conta, incluindo concluídos, passados e futuros. Mostra data, horário, cliente quando houver e título. Os dias de hoje e futuros vêm primeiro; depois, o histórico do mais recente para o mais antigo. O visto indica um compromisso concluído.

O espaço físico do widget é limitado: pequeno mostra até 2 compromissos por página; médio, até 3; grande, até 9. O rodapé informa a página e o total de páginas. Para ver mais, use o widget grande; para outra página, escreva 2, 3 etc. no campo Parâmetro do script Minha Agenda. Você pode criar outros widgets de agenda com páginas diferentes. No script genérico Meu Ecossistema, use agenda:2, agenda:3 etc.

Não existe rolagem dentro deste widget. Tocar abre a agenda no Ecossistema, onde você pode navegar pelas datas e editar os compromissos. O resumo considera até 10 mil registros; acima disso, informa falha de atualização em vez de apresentar uma contagem parcial.

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


## Novo visual do versículo — versão 49

O versículo tem composição centralizada, fonte Georgia com serifa, referência destacada e assinatura discreta. Mantém fundo, texto e detalhes do tema escolhido. A tradução continua identificada. Nos widgets pequenos ou com passagens longas, o texto pode ser reduzido ou truncado pelo iOS: toque para abrir o Ecossistema e ler a passagem completa. Para aplicar este visual, substitua o código do script Meu Versículo pelo novo, executando-o uma vez no Scriptable. Atualizar apenas o GitHub não muda o código já instalado no Scriptable.

## Novo widget: Iniciar atividade

1. Atualize o aplicativo com a versão 49 e aguarde a publicação na Vercel.
2. Pelo aplicativo publicado, abra Configurações gerais → Widgets iPhone → Copiar código: Iniciar atividade.
3. No Scriptable, crie um novo script chamado Iniciar atividade, cole todo esse código e execute uma vez.
4. Adicione um widget Scriptable à tela inicial, edite-o e escolha o script Iniciar atividade. Não precisa preencher Parâmetro.
5. Ao tocar no widget, ele abre diretamente Trabalho → Controle de horas e o formulário de início. Se precisar entrar na conta, o formulário abre depois do login e carregamento dos dados.
6. Escolha tipo, cliente e carteira, e toque em Iniciar agora. O horário começa nesse momento. Se já houver atividade ativa, o aplicativo avisa e mantém o cronômetro existente.

Este widget é um atalho para o formulário. Ele não exibe o tempo transcorrido e não inicia nem finaliza registros em segundo plano. Não precisa gerar chave, pois nenhum dado de horas é consultado pelo widget. O código copiado pelo aplicativo recebe o endereço da sua publicação e uma cópia das cores atuais. Para mudar o tema deste atalho, copie novamente o código pelo aplicativo após escolher as novas cores.

Se usar diretamente o arquivo Widget-Iniciar-Atividade.js do ZIP, execute-o no Scriptable e informe o endereço HTTPS do seu Ecossistema publicado quando solicitado. Não informe a URL do GitHub nem a URL do Supabase.

A tela web, os dados e os atalhos seguem no pacote completo. A aparência final e a abertura no iPhone físico precisam ser conferidas no seu aparelho; o navegador pode pedir login. Não é necessário criar uma nova conexão para os widgets de leitura que já funcionam.
