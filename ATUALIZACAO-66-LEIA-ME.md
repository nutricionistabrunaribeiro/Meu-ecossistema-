# Meu Ecossistema — Atualização 66

Data: 17/11/2026. Base integral: pacote v65, mantendo Jornada Bíblica v64, extintores v65, devocionais, widgets e demais recursos da versão anterior.

## O que está implementado e pode ser conferido

- Novo botão **Central Integrada**, visível no menu global de todos os ambientes.
- **Busca geral** nos dados já carregados: clientes ativos, documentação por cliente, compromissos, obrigações, projetos e pendências. Exclui registros vinculados a clientes inativos.
- **Vencimentos**: lista ordenada de documentos com data válida, obrigações e pendências dos clientes ativos. Filtro de antecedência 7/15/30/60/90 dias. São alertas na tela; **não há push**.
- **Previsão financeira**: soma valores de entradas e saídas com data nos próximos 30 dias, presentes nos módulos profissional e pessoal. É diferença projetada, não saldo bancário.
- **Segurança**: situação do backup, aviso das limitações do Storage, verificação não destrutiva de leitura autenticada e memória local de conferências estruturais de arquivos de exportação.
- Versão interna atualizada para 66.

## Não implementado nesta versão

A restauração automática, backups automáticos no servidor, lixeira universal, logs de cada mudança, modo offline geral e notificações push NÃO foram ativados. Eles exigem banco, testes de reversibilidade e regras de sincronização. A seção Plano Mestre registra as etapas.

## Como publicar

1. Guarde uma cópia da versão publicada e realize o backup manual existente em Configurações. Atenção: a exportação JSON não é um backup completo do Supabase Storage.
2. Substitua **somente `index.html`** na raiz de seu GitHub. Não apague scripts, assets ou outros arquivos existentes.
3. Confira em computador e iPhone: Central Integrada > Busca, Vencimentos, Previsão financeira e Segurança.
4. Teste a Jornada Bíblica, documentação (extintores), Na Presença, checklist, agenda e login antes de considerar a publicação validada.
5. Não foi feita alteração de tabelas e não é necessário executar SQL.

## Testes feitos

- Integridade e listagem do ZIP;
- Checagem de sintaxe JavaScript com Node.js;
- Testes simulados de busca e filtro de cliente inativo, datas, geração dos quatro painéis.

**Não foi possível realizar teste visual completo no navegador nesta execução** e o funcionamento com dados da sessão real precisa de validação após deploy.
