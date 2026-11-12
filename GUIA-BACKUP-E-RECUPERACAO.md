# Guia de backup e recuperação

## Cópia de uso diário / exportação do aplicativo

Acesse `Configurações gerais → Backup → Exportar meus dados (JSON)`. A exportação é iniciada **manualmente**, solicita leitura no Supabase com a sua sessão e permite salvar um JSON. Verifique se o arquivo foi baixado e observe a mensagem de **erros por tabela**.

**Dados exportados:** tabelas diretamente vinculadas a `user_id` e alguns dados relacionados a clientes, visitas e hábitos que o aplicativo já conhece. O JSON não inclui: arquivos binários do Storage, senhas, tokens e cópia da configuração de RLS, nem garante a integridade de tabelas sem acesso por usuário. Se houver erro, o backup será identificado como parcial.

**Proteção:** o JSON não é criptografado. Guarde em pasta criptografada ou armazenamento de acesso restrito; evite compartilhá-lo no WhatsApp ou e-mail desprotegido. Para validar o formato, use o botão `Conferir arquivo de backup`. Esse botão **não** restaura os registros.

## Cópia completa administrativa (separada do app)

No Supabase, exporte o banco usando um procedimento de backup compatível com seu plano e permissões (por exemplo `pg_dump` com as credenciais de manutenção obtidas com segurança). Faça também uma cópia do **Storage** e da configuração dos serviços e Edge Functions, preservando os segredos fora do pacote público do GitHub. Não coloque senhas do banco nem `service_role` no frontend.

## Se uma atualização der errado

1. Volte ao último commit funcional no GitHub e aguarde deploy da Vercel.
2. Feche e reabra o aplicativo no iPhone; confira se o service worker cacheou uma versão anterior.
3. Revise o console do navegador, disponibilidade dos scripts e estado da conexão com Supabase.
4. Antes de restaurar registros, compare contagens e datas. Teste o procedimento em ambiente separado, porque restaurar por cima pode duplicar ou apagar dados atuais.
5. Não delete projetos ou tabelas para resolver erros visuais.

## Pontos ainda dependentes de configuração administrativa

- Backup automático diário: **não configurado** nesta versão. A versão anterior exibia uma confirmação fictícia.
- Restauração automática: **não implementada**.
- Verificação de segurança do Supabase: o Advisor reportou `Leaked Password Protection Disabled`; recomenda-se analisar a ativação dessa proteção em `Authentication → Security`. Nenhuma configuração de segurança foi alterada sem aprovação.
