# Meu Ecossistema — Bruna Ribeiro · Versão 42

## Incluído
- Terceiro ambiente: Na Presença, ao lado de Trabalho e Pessoal.
- Jornada Bíblica existente, com os capítulos já salvos preservados.
- Painel semanal de oração: pessoas e intenções, anotações, marcação por dia, situação do pedido, histórico e continuação na semana seguinte.
- Meu momento com Deus: passagem, reflexão, motivo de oração e gratidão.
- Diário e memórias de gratidão, com edição e exclusão.
- Versículos favoritos com referência, tradução e tema.
- Propósitos de oração com horários opcionais para consulta (sem notificações automáticas).
- Atalhos de Na Presença na Visão Geral.
- Botão Dashboard geral centralizado.
- Recursos da versão 41 mantidos, incluindo Radar em PDF/CSV e identificação da tradução bíblica.
- Arquivos de apoio proximos-passos.js, offline-drafts.js, manifest.json e service-worker.js recuperados do repositório para completar o pacote.

## Atualização
1. Extraia o ZIP.
2. Envie os arquivos extraídos à raiz do mesmo repositório GitHub, substituindo os correspondentes e incluindo os novos.
3. Aguarde a publicação na Vercel e reabra o aplicativo. Se necessário, feche e abra o aplicativo novamente para renovar o cache.

O banco já foi preparado: tabela na_presenca_registros, com acesso restrito ao proprietário de cada registro. Não é necessário executar SQL para esta atualização. A Jornada Bíblica continua usando biblia_capitulos_lidos.

Os novos registros precisam de conexão e login. O botão Atualizar registros recupera o que foi salvo em outro aparelho. Se um registro tiver sido alterado em outro aparelho, a edição antiga é recusada; atualize antes de editar novamente.

## Validação
Sintaxe JavaScript, formulários dos seis tipos de registro, datas semanais e virada de ano, escape de HTML, consolidação existente do Radar, filtros por proprietário e detecção de conflito de edição conferidos. Navegação, painel e formulário verificados no navegador com dados fictícios. Estrutura e permissões da nova tabela verificadas; inserção temporária testada em transação revertida, sem deixar registros de teste. A gravação pela interface com a conta real e a conferência entre dois aparelhos devem ser feitas após a atualização.
