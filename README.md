# Meu Ecossistema — Bruna Ribeiro Consultoria

Site estático (HTML + CSS + JS puro, sem build, sem dependências de instalação).
Conectado ao banco de dados real no Supabase.

## Como publicar na Vercel (sem usar linha de comando)

1. Acesse **vercel.com** e entre na sua conta.
2. No painel, clique em **"Add New..." → "Project"**.
3. Escolha a opção de **importar uma pasta** (ou arraste esta pasta inteira
   `deploy-meu-ecossistema` direto pra área indicada na tela — a Vercel aceita
   isso, é literalmente arrastar e soltar).
4. Não precisa configurar nada (sem "Build Command", sem "Install Command") —
   é um site estático puro. Se ela pedir, escolha **"Other"** como framework.
5. Clique em **"Deploy"**.
6. Em menos de um minuto você recebe um link, algo como
   `meu-ecossistema.vercel.app`.

## Atualizando pelo GitHub (sem token)

No repositório → abrir `index.html` → ✏️ Edit → apagar tudo → colar o
conteúdo do novo `index.html` → Commit changes. A Vercel detecta e
republica sozinha.

## Domínio próprio (opcional)

Vercel → Project → Settings → Domains → adicionar o domínio.
