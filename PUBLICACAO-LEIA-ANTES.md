# Meu Ecossistema — Atualização 01 — pacote para publicação assistida

## Alterações incluídas
- Visão Geral como página inicial, mantendo Trabalho e Pessoal.
- Controle de horas: origem e destino obrigatórios ao registrar deslocamento.
- Projetos: opção de exclusão com confirmação e verificação de retorno do banco.
- Diário do sono manual com resumo mensal. **Armazenado somente no navegador**, sem sincronização entre aparelhos.
- Checklist PDF: área reservada para o status, quebra de texto e ajuste de altura de blocos.

## ANTES de publicar
1. Faça backup dos dados do Supabase e mantenha cópia da versão atual do GitHub.
2. Confira no Supabase SQL Editor se a migração `20260924_trajetos_controle_horas.sql` já foi aplicada; se não, execute-a antes de usar o deslocamento.
3. Publique primeiro em uma implantação de prévia, não diretamente em produção.
4. Teste login, Visão Geral, Trabalho/Pessoal, cadastro e exclusão de projeto de teste, início/fim de deslocamento e impressão de checklist com frases longas, fotos e observações.
5. Só depois promova a versão para produção.

## Limitações de validação
Scripts JavaScript inline verificados com `node --check`. Não foi possível testar login real, permissões/RLS, migrações no Supabase, renderização visual dos PDFs ou a implantação Vercel. **O ZIP é uma versão candidata a publicação, não uma homologação de produção.**

## Atenção
Excluir um projeto é definitivo. Dependências no banco podem impedir a exclusão, e o sistema deve mostrar o erro. O diário do sono pode ser perdido se os dados locais do navegador forem apagados.
