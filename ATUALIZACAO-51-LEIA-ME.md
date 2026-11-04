# Versão 51 — página própria para Iniciar atividade

Pacote completo baseado na versão 50. Os outros ambientes e widgets permanecem disponíveis.

O widget de horas agora aponta para iniciar-atividade.html. O formulário faz parte dessa página, sem depender da abertura de um modal sobre a Visão Geral. A mesma tela também atende ao endereço antigo com widget=horas.

A página carrega os clientes e confere as atividades antes de liberar o formulário; preserva o destino durante o restante da inicialização. Exibe atividade em andamento e bloqueia novos inícios se a conferência de horas falhar. Não houve mudança no banco nem na função dos widgets.

A aba Widgets iPhone passa a oferecer um botão explícito para copiar o código geral Meu Ecossistema. Esse código continua servindo a todos os indicadores por parâmetro e traz o endereço público correto do aplicativo.

Atualize o GitHub e o script no Scriptable conforme WIDGETS-IPHONE-LEIA-ME.md. O arquivo iniciar-atividade.html precisa acompanhar os outros arquivos na publicação.

Validação: sintaxe, rota própria e rota anterior, formulário embutido, estados de carregamento/erro, proteção para atividade em andamento, carregamento antecipado e endereço do widget. A prévia no navegador abriu diretamente o formulário e mostrou origem/destino ao selecionar deslocamento. Não foi iniciado um cronômetro real durante o teste. A abertura pelo widget físico depende da publicação e da instalação no iPhone.
