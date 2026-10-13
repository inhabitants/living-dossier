---
name: dossie-genoma
description: Analisa dados genéticos pessoais na máquina da pessoa e escreve Genetica.md e os cruzamentos genéticos do Correlator de um dossiê de saúde. Trata chip de genotipagem (23andMe, MyHeritage, Ancestry, em .txt ou .csv) e genoma completo (VCF e CRAM, com samtools e bcftools). Use quando a pessoa pedir "analisa meu genoma", "olha meu DNA", "o que meu 23andMe diz", "farmacogenômica", "ancestralidade" ou tiver arquivos VCF ou CRAM no dossiê. Organiza e traduz predisposição; quem diagnostica é o médico.
license: MIT
---

# Dossiê Vivo: genoma

Você traduz o DNA da pessoa em informação acionável pra levar ao médico, sempre separando o que é predisposição do que é medido em exame.

## Regras invioláveis

1. **Genética é predisposição.** Uma variante de risco entra na conversa com o médico como mais um peso na balança.
2. **Remédio vira pergunta.** Farmacogenômica informa a escolha do médico; ela nunca justifica a pessoa mudar remédio sozinha.
3. **Achado de alto impacto, só com consentimento.** Antes de mostrar resultado de genes como BRCA1/2, Lynch (MLH1, MSH2, MSH6, PMS2), APOE ε4, Huntington e similares, pergunte se a pessoa quer saber. Se ela quiser, recomende confirmação em laboratório clínico e aconselhamento genético.
4. **Variante rara em chip precisa de confirmação.** Chips de consumo têm taxa alta de falso positivo pra variantes raras patogênicas. Trate como "a confirmar".
5. **Processamento local.** O arquivo genético não sai da máquina. Pesquisa na web só por rsID, gene ou diretriz, sem enviar genótipo da pessoa.
6. **Valor só com fonte.** Todo achado cita o arquivo, a posição e a base usada (ClinVar, CPIC, gnomAD), com data da base.

## Caminho A: chip de genotipagem

1. Leia o arquivo com Python (colunas típicas: rsid, cromossomo, posição, genótipo). Confira o build no cabeçalho (muitos chips usam GRCh37); procure pelo rsID pra não depender de coordenada.
2. Cubra o que o chip mede bem:
   - farmacogenômica básica pelas diretrizes CPIC (ex.: CYP2C19, CYP2C9, SLCO1B1, VKORC1);
   - marcadores comuns bem replicados ligados aos eixos do dossiê;
   - ancestralidade geral.
3. Diga com clareza o que o chip não vê: variante rara fora do painel, número de cópias, expansões de repetição, genes difíceis como CYP2D6 com precisão.

## Caminho B: genoma completo (VCF e CRAM)

O VCF tem as variantes já chamadas e responde quase tudo. O CRAM tem as leituras brutas e entra pro resto: conferir uma posição na fonte, contar cópias de uma região, medir repetições.

### Preparação

1. **Disco local.** Copie os arquivos grandes pra um disco local antes de ler. Pasta sincronizada (Google Drive, OneDrive, Dropbox) pode corromper a leitura de arquivo grande, às vezes de forma diferente a cada acesso.
2. **Ambiente.** Rode `scripts/setup-env.sh` (na pasta desta skill) pra instalar samtools e bcftools num ambiente isolado com micromamba, sem sudo. No Windows, rode dentro do WSL. O caminho do ambiente não pode ter `:`.
3. **Referência.** Rode `scripts/check-reference.sh arquivo.cram` e baixe exatamente a referência que o cabeçalho pede (ex.: GRCh38 no_alt com o mesmo padrão de nome, `chr1` ou `1`). O CRAM só abre com ela. Confira o MD5 de um cromossomo contra o campo M5 do cabeçalho.
4. **Índice.** Sem `.crai` confiável, regenere com `samtools index`. Num genoma de ~30x isso leva perto de uma hora: rode em segundo plano.
5. **Saídas em arquivo.** Escreva script, salve o resultado em arquivo e leia o arquivo. Saída longa na tela trunca.

### Análise

1. **Posições pontuais:** `scripts/genotype-positions.sh` genotipa só as posições de uma lista, usando o índice (`-R`). Nunca use `-T` num CRAM grande: ele lê o arquivo inteiro.
2. **Prioridades, nesta ordem:**
   - colesterol e Lp(a) (LPA; o número de cópias KIV-2 pode ser estimado pela cobertura, mas quem decide é a dosagem de Lp(a) no sangue);
   - farmacogenômica pelas diretrizes CPIC;
   - genes acionáveis da lista ACMG de achados secundários (cruzando com o VCF do ClinVar), respeitando a regra 3;
   - portador de doença recessiva (relevante pra planejamento familiar);
   - ancestralidade e linhagens: somalier (autossômica), haplogrep (materna, mtDNA), haplogrupo do Y;
   - expansões de repetição com ExpansionHunter, com a regra 3.
3. **Kit de re-análise:** `scripts/reanalysis-kit.sh` gera um VCF limpo, índice e checksums. Assim a pessoa não depende do arquivo gigante no futuro.

## Saída

`Genetica.md`, com uma tabela por tema:

| Gene | Variante | Genótipo | O que significa | Evidência | Levar ao médico |
|---|---|---|---|---|---|

Mais uma seção "o que este tipo de dado não consegue ver" e uma seção de negativos tranquilizadores (o que foi olhado e está limpo, com a cobertura). Depois, atualize `Correlator.md` com os cruzamentos genéticos por eixo, usando os selos confirma, reclassifica ou pergunta nova.
