# Atualização 35 — Um único Liquid Glass + Claro / Escuro

Esta versão reúne todas as melhorias presentes na atualização 34, sem alteração de dados ou tabelas.

## O que mudou

- Somente o Liquid Glass Premium permanece como acabamento visual. As opções Clássico, Soft Glass, Editorial Chic, Atelier, Aurora e Ameixa & Champagne foram retiradas da seleção de estilos.
- As **paletas** continuam, inclusive **Marsala · Champagne · Rosa seco** (antes chamada apenas Marsala). Seus três tons aparecem juntos na amostra para facilitar a escolha.
- Modo **Claro**, **Escuro** e **Automático** funcionando com todas as paletas. A camada clara tem tons de fundo próprios, textos escuros legíveis e cards de vidro translúcidos.
- O tema e a preferência de modo ficam salvos localmente neste aparelho.
- As preferências legadas de estilo são migradas automaticamente para Liquid Glass Premium.
- O editor avulso de cores antigas (verde/laranja) foi retirado das configurações para evitar conflito com as paletas.

## Publicação

Substitua os arquivos do projeto no GitHub por `index.html` e os ícones deste pacote, preservando a configuração atual de Supabase. Recarregue a página após o deploy Vercel (em celular instalado, encerre e abra o app). Em Configurações > Tema / Marca, escolha a paleta e o modo de exibição.

## Testes

Sintaxe JavaScript e integridade do ZIP verificadas localmente. Ainda é necessário testar o visual e os fluxos no navegador conectado ao Supabase. Em celulares com a configuração de acessibilidade **Reduzir Transparência**, o sistema respeita essa preferência.
