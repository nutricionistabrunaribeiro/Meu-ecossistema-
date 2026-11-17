# Meu Ecossistema • Bruna Ribeiro — versão 68

## Central do meu dia — correção de funcionamento

A antiga **Central Integrada** abria com uma caixa de busca vazia e exigia pesquisar para descobrir as tarefas do dia. Agora ela se chama **Meu dia · automático** no menu e abre na aba **Meu dia**.

Sem digitar nada, mostra registros já carregados na conta:

- compromissos da agenda de hoje ainda não concluídos;
- Lista do Dia em aberto;
- hábitos ainda não marcados hoje;
- checklists registrados para hoje e em andamento;
- entregas abertas com prazo até sete dias, individualizadas por cliente;
- pendências e próximos passos dos clientes com data vencida ou em até sete dias;
- obrigações e documentos com datas vencidas ou até sete dias;
- treinamentos planejados para hoje, produtos/rotulagem e delegações com prazo;
- rotinas pessoais e de casa previstas para hoje;
- despesas profissionais e pessoais abertas com vencimento hoje ou em atraso.

Tudo aparece organizado em **Para fazer hoje**, **Precisa de atenção (atrasados)** e **Nos próximos 7 dias**, com contagens e links para a área original. O conteúdo extra pode ser expandido em **Ver mais**. Compromissos e itens da Lista do Dia concluídos hoje são apresentados em uma seção recolhível. Os atalhos de busca, vencimentos, previsão financeira e segurança continuam disponíveis como ferramentas secundárias.

## Atualização dos dados

O aplicativo já consulta as áreas ao entrar na conta. Na Central existe o botão **Atualizar meu dia**, que lê novamente os registros sem gravar ou apagar dados.

## Instalação

1. Faça uma cópia dos dados e guarde a versão anterior.
2. Substitua somente `index.html` na raiz do repositório pela versão desta pasta; preserve os arquivos auxiliares.
3. Após a publicação, abra **Meu dia · automático** pelo menu.
4. Confira um compromisso agendado para hoje, uma tarefa da Lista do Dia e um documento com vencimento conhecido; teste também **Atualizar meu dia**.

Esta atualização não exige SQL, não apaga dados e não ativa notificações externas. Passou na verificação de sintaxe JavaScript e no teste automatizado com dados simulados. O resultado com sua sessão e seus registros reais depende de verificação após o deploy.
