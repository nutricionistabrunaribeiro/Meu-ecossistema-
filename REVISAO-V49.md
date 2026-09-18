# Revisão V49 — Segurança e continuidade offline

## Banco de dados

A migration `ecossistema_acesso_exclusivo_proprietaria` foi aplicada diretamente no projeto Supabase em 17/09/2026.

- Todas as 52 tabelas públicas continuam com RLS habilitado.
- Uma política restritiva adicional limita SELECT, INSERT, UPDATE e DELETE à conta proprietária.
- O mesmo bloqueio foi aplicado aos objetos do Storage.
- Os dados existentes não foram alterados ou excluídos.
- O arquivo `20260917_ecossistema_acesso_exclusivo_proprietaria.sql` acompanha o código apenas como registro da alteração já aplicada; não é necessário executá-lo novamente.

Verificações realizadas no banco:

- a conta proprietária continuou enxergando clientes, documentações, respostas de checklist e arquivos;
- outro identificador autenticado não enxergou nenhum desses registros;
- INSERT, SELECT, UPDATE e DELETE foram testados em transação e revertidos ao final, sem deixar dados de teste.

O Security Advisor não encontrou tabela pública sem RLS. Permanece somente o aviso administrativo de proteção contra senhas vazadas desativada; essa opção é habilitada no painel do Supabase em Authentication > Sign In / Providers > Password.

## Checklists offline

O funcionamento offline desta rodada é deliberadamente protegido e limitado:

- com conexão, ao abrir o aplicativo, uma cópia dos clientes, modelos, itens e checklists é preparada neste aparelho;
- sem conexão, o aplicativo abre diretamente em Checklists e permite continuar checklists já preparados;
- respostas, observações e validades são salvas imediatamente no armazenamento local;
- ao reconectar, a fila é enviada ao Supabase;
- se o registro remoto tiver sido alterado depois da cópia local, o sistema não sobrescreve automaticamente: mostra o conflito para revisão;
- não é possível finalizar o checklist, gerar PDF ou sair da conta enquanto houver respostas não sincronizadas.

Continuam exigindo internet:

- criar um checklist novo;
- anexar ou excluir fotos;
- finalizar o checklist e gerar PDF;
- cadastrar, editar ou excluir dados nos demais módulos.

Isso evita prometer um “offline completo” que colocaria os dados em risco. O objetivo da V49 é não perder o preenchimento de campo quando a conexão oscilar.

## Testes automatizados executados

- análise sintática de `offline-drafts.js` e `service-worker.js`;
- regressão dos avisos, Entregas, publicações, documentação e Próximos passos;
- criação e atualização do rascunho local;
- restauração do rascunho após recarga simulada;
- sincronização da fila ao reconectar;
- remoção da fila somente depois da confirmação do banco;
- renderização das 25 telas principais de Trabalho e Pessoal;
- `git diff --check` sem erros de whitespace.

## Validação final depois da publicação

Após substituir os arquivos no GitHub e a Vercel concluir o deploy:

1. Abra o aplicativo conectado e entre em um checklist em andamento.
2. Marque um item e confirme que aparece “sincronizado”.
3. Ative o modo avião, altere uma observação e recarregue o aplicativo.
4. Confirme que o checklist e a alteração continuam visíveis como rascunho no aparelho.
5. Desative o modo avião e use “Ver sincronização”.
6. Confirme o envio e só então finalize o checklist.

A inspeção autenticada da versão V49 em produção depende desse upload. O pacote não deve ser considerado validado em produção antes dessa etapa.
