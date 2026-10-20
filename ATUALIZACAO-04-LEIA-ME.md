# Atualização 04 — publicação pelo GitHub

Inclui: seis paletas de cores em Configurações > Tema/Marca; visão anual por hábito baseada nos registros do Supabase; cadastro, edição de progresso e exclusão de estudos pessoais.

## Limitações importantes
- Estudos novos e suas anotações são guardados apenas neste navegador via localStorage; ainda NÃO sincronizam entre aparelhos. Estudos de exemplo continuam preservados.
- Ano em Pixels mostra registros do ano atual e é uma visão de leitura; a marcação continua pela semana.
- A paleta é salva neste navegador; o modo claro/escuro já existente continua separado.
- Os ajustes são incrementais, não uma reformulação completa do dashboard.
- A consulta de hábitos do ano pode estar limitada pelas permissões do banco.

## Publicação
Extraia o ZIP, envie os arquivos da raiz ao repositório, faça commit e aguarde a Vercel. Não envie o ZIP sem extrair.

## Verificação
A sintaxe dos scripts JavaScript embutidos no index.html passou no `node --check`. Não foi realizado teste end-to-end no Supabase ou em navegador autenticado.
