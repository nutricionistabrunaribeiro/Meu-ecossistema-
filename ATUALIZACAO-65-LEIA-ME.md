# Meu Ecossistema • Bruna Ribeiro — atualização 65

## Pronto nesta entrega

- **Controle de extintores por cliente**, em Trabalho → Clientes → documentação.
- Nova categoria **Segurança contra incêndio** com item geral **Extintores — controle geral de validade / inspeção**.
- Botão **+ Cadastrar extintor individual** para criar quantos registros forem necessários, identificados por número, tipo ou local (ex.: `Extintor — nº 01 / cozinha`).
- Cada registro recebe **data de validade / próxima inspeção ou manutenção**, data de emissão, situação e observações, usando o banco já existente `documentacao_cliente`.
- O vencimento é mostrado nos mesmos indicadores de documentos, filtros, calendário e avisos de documentos próximos do vencimento; não foi criado alerta por push.
- A exportação JSON passou a **tentar incluir** `biblia_jornada_estado` (ciclos completos da Jornada Bíblica). A própria exportação mostra erros se a leitura for impedida pela permissão.

## Como atualizar

1. Guarde uma cópia da versão atual e faça **Configurações → Exportar meus dados (JSON)**; confira se a exportação terminou sem erros.
2. Publique o `index.html` desta pasta no mesmo lugar do arquivo atual do GitHub/Vercel, preservando os demais arquivos do seu projeto.
3. Aguarde o deploy da Vercel e atualize a página. Não é necessário executar SQL para o controle de extintores; reutiliza-se a tabela já existente.
4. Abra um cliente → Controle de documentação → **+ Cadastrar extintor individual**. Preencha a identificação e a data e salve.
5. Reabra o registro e teste a edição. Confira também a lista de vencimentos do cliente.

**Nota:** a data correta depende do tipo de inspeção/manutenção e da documentação correspondente. O app registra e acompanha a data que você informar; não determina automaticamente prazos técnicos ou legais.

## Não incluído nesta entrega

Sincronização nova, backups automáticos, restauração em massa, notificações push, relatórios avançados, acesso offline completo, alterações de segurança e automações financeiras exigem implementação e testes específicos. Consulte `PLANO-MESTRE-DE-EVOLUCAO.md`. Os registros existentes não foram zerados, migrados nem apagados.
