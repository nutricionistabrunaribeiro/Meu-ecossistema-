# Meu Ecossistema — versão 67 • Documentação simplificada

## O que mudou

- O **Controle de documentação de cada cliente** agora mostra somente **17 itens principais**, organizados em quatro blocos, com os mesmos assuntos da seção Documentação do checklist fornecido em 16/11/2026.
- Itens que apareciam separados no sistema, mas unidos no checklist, aparecem apenas uma vez na lista principal (por exemplo: Manual e POPs; PGR, PCMSO e LTCAT).
- **Extintores de incêndio** continuam com validade e botão de cadastro individual.
- Registros anteriores e documentos extras continuam no banco, sem exclusão. Aparecem em áreas recolhíveis **Outros registros já cadastrados** e **Extintores individuais**.
- Situações e datas existentes continuam calculadas conforme os registros já cadastrados; o sistema não transfere automaticamente datas de um documento para outro.

## Atenção aos itens agrupados

Ao juntar itens na tela, **não juntamos seus registros no banco**. Quando existem várias datas (por exemplo, PGR e PCMSO), a linha principal exibe o primeiro documento encontrado; os demais permanecem em **Outros registros já cadastrados**. Revise esses dados antes de usar a lista como evidência completa de regularidade.

## Como atualizar

1. Salve um backup JSON e uma cópia da versão atual.
2. Substitua somente o `index.html` do seu repositório pelo da pasta desta versão, mantendo os demais arquivos.
3. Aguarde a publicação da Vercel e abra **Trabalho → Clientes → Controle de documentação**.
4. Confirme a lista de 17 itens, abra os registros antigos e teste o cadastro de extintores.

Não há SQL a executar, e **nenhum dado foi apagado**. O código passou no teste de sintaxe, mas a interface com seus dados reais precisa ser verificada após a publicação.
