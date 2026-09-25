# Meu Ecossistema — V61 Trajetos no Controle de Horas

## O que mudou

- Ao selecionar **Deslocamento**, o formulário mostra origem e destino.
- Atalhos: **Casa → Cliente**, **Cliente → Casa**, **Cliente → Cliente** e **Outro**.
- Casa é tratada como local, nunca como cliente.
- A carteira/vínculo continua separada: Bruna Ribeiro, Saber Nutrir ou Pessoal.
- O histórico e o cronômetro ativo mostram o trajeto de forma direta.
- O botão **Editar** também permite corrigir o trajeto.
- Registros antigos continuam válidos e aparecem como antes.

## Como publicar

1. Extraia o pacote.
2. Substitua os arquivos no repositório do GitHub.
3. Confirme o commit; a Vercel fará o deploy automaticamente.
4. No iPhone, após o deploy, feche e abra o aplicativo para carregar a V61.

## Banco de dados

A migração `20260924_trajetos_controle_horas.sql` já foi preparada para a estrutura nova.
Ela apenas adiciona campos opcionais e não altera registros existentes.

