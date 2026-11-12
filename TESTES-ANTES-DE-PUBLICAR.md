# Checklist de homologação da atualização 56

- [ ] Criar ponto de retorno no GitHub antes de publicar.
- [ ] Publicar somente o `index.html`, mantendo os outros recursos atuais.
- [ ] Confirmar que `Trabalho`, `Pessoal` e `Na Presença` continuam no menu.
- [ ] Abrir Jornada Bíblica e painel semanal de oração; conferir registros existentes.
- [ ] Abrir Dashboard geral e Radar de Recorrências; conferir dados anteriores.
- [ ] Em Pessoal, abrir `Meu 2027 de forma leve`. Criar o projeto apenas se desejar iniciar agora.
- [ ] Após criar, marcar/desmarcar uma missão e confirmar que a marcação permanece após abrir em outro dispositivo.
- [ ] Abrir Minha Clareza, digitar duas linhas, pré-visualizar, mudar categoria, desmarcar uma delas e confirmar somente a outra.
- [ ] Em Trabalho, abrir Resultados da Consultoria; testar mês com e sem registros e gerar PDF.
- [ ] Em Configurações → Backup, exportar JSON, conferir a mensagem de erros e validar o arquivo pelo botão.
- [ ] Conferir troca de senha somente quando estiver pronta para usar uma senha nova; não testar com credenciais de produção desnecessariamente.
- [ ] Em Configurações → Backup, rodar Diagnóstico dos arquivos. Investigar falhas antes de descartar qualquer arquivo.
- [ ] No iPhone, testar janela de correção do Controle de Horas e Ano em Pixels (mesmas quatro marcações e mesmas datas).
- [ ] Checar sincronização: criar uma alteração pequena no celular, atualizar no computador e conferir se apareceu, sem manter o mesmo checklist em edição simultânea.
- [ ] Se algum módulo sumir, interromper e restaurar o commit anterior; não fazer migração SQL para corrigir tela.

**Validação local disponível:** JS sintaticamente válido e testes isolados de renderização com dados fictícios. **Não validados:** login real, upload/backup real com dados da usuária, fluxo de produção e Safari do iPhone.
