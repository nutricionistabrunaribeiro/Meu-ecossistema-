# Meu Ecossistema — Bruna Ribeiro · Versão 46

## Desenvolvimento pessoal
- O que me move: motivações, valores e lembretes escritos por você, com inclusão, edição e exclusão.
- Diário pessoal: data, título opcional, Como estou?, O que marcou meu dia? e Do que preciso agora?. Preencha pelo menos um dos três campos.
- Meu humor: um registro por dia, emoji e motivo opcional. Calendário mensal, edição retroativa, histórico e sono registrado na mesma data, sem pontuação ou conclusões automáticas.
- Diário pessoal e humor ficam no Pessoal, separados dos registros do Na Presença.
- Abas ligam O que me move, Metas, Diário, Humor e Hábitos.

## Hábitos
- Alternância entre Tabela semanal e Por hábito, preservando a visualização anterior.
- Tabela com dias nas linhas e hábitos nas colunas, navegação por semana e marcação/desmarcação. No celular, a tabela permite deslizar horizontalmente; a coluna dos dias permanece fixa.
- Sequência atual, maior sequência e dias realizados no mês por hábito.
- A sequência atual conta os dias seguidos terminando hoje ou ontem: o dia de hoje ainda não marcado não interrompe a sequência de ontem.
- Histórico completo carregado em páginas, inclusive anos anteriores. A maior sequência considera o histórico disponível; o mapa anual continua exibindo apenas o ano atual.
- Mapa de consistência e edição retroativa mantidos. Dias futuros ficam bloqueados.

## Atualização
1. Extraia o ZIP.
2. Envie todos os arquivos à raiz do mesmo repositório GitHub, substituindo os correspondentes. Inclua pessoal-v46.js e pessoal-v46.css.
3. Aguarde a publicação na Vercel e reabra o aplicativo para renovar o cache.
4. No Pessoal, abra O que me move, Diário pessoal, Meu humor ou Hábitos.

A tabela pessoal_reflexoes já foi preparada no banco de dados, com acesso restrito à conta proprietária. Não precisa executar SQL. BANCO-V46-REFERENCIA.sql documenta a estrutura aplicada; não execute novamente.

Os novos registros precisam de conexão e login. Atualizar registros recupera o que foi salvo em outro aparelho. Se um registro mudar em outro aparelho durante a edição, a versão antiga não o sobrescreve; atualize antes de editar novamente. Se outro aparelho já tiver registrado o humor da mesma data, atualize o histórico para editar esse registro.

## Validação e limites
- Sintaxe, integridade do ZIP e presença dos arquivos locais verificadas.
- Testes de constância entre anos, ano bissexto, dias duplicados, datas futuras, hoje/ontem, mês atual e estados vazios.
- Tabela de sete dias, calendário mensal, escape de HTML, cinco tipos de formulário, paginação e conflitos de versão conferidos.
- Inserção e atualização de diário/humor, unicidade do humor por data e isolamento entre contas testados no banco em transação revertida. Nenhum registro de teste foi deixado salvo.
- Interface conferida no navegador com dados e salvamento locais fictícios: O que me move, tabela de hábitos, calendário de humor e formulário do diário; tabela móvel inspecionada em 390 px.
- A gravação pela interface autenticada e a sincronização entre dois aparelhos ainda devem ser conferidas após publicar. Esta atualização não fez uma nova auditoria dos demais módulos.
