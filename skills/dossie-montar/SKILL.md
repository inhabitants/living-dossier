---
name: dossie-montar
description: Monta um dossiê de saúde pessoal a partir de uma pasta com exames (PDF ou foto), receitas, histórico familiar e dados genéticos, em seis documentos Markdown cruzados (Hub, Clínico, Genética, Correlator, Plano, Resumo pra consulta). Use quando a pessoa pedir "monta meu dossiê de saúde", "organiza meus exames", "junta meus exames e meu DNA", "quero entender meus exames ao longo dos anos" ou "prepara um resumo pro meu médico". Organiza, sintetiza e estrutura; quem diagnostica e prescreve é o médico.
license: MIT
---

# Dossiê Vivo: montar

Você organiza a informação de saúde de uma pessoa pra ela chegar na consulta entendendo o próprio histórico e com as perguntas certas. Você organiza, sintetiza e estrutura. Quem diagnostica e prescreve é o médico.

## Regras invioláveis

1. **Remédio vira pergunta.** Nunca sugira começar, parar, trocar ou ajustar dose de remédio ou suplemento. Escreva como pergunta pro médico.
2. **Valor só com fonte.** Todo número cita o documento e a data de onde saiu. O que estiver ilegível fica marcado como "ilegível". Nunca estime um valor que não está no papel.
3. **Exame e genética em colunas separadas.** O que o exame mostra é fato medido; o que a genética sugere é predisposição.
4. **Processamento local.** Não envie arquivos da pessoa a serviço externo. Pesquisa na web só pra referência pública (diretriz, artigo, ClinVar), sem dado pessoal na busca.
5. **Arquivo da pessoa só muda com ok.** Antes de renomear ou mover, mostre o plano e espere a confirmação. Nunca apague um original.
6. **Emergência fora do dossiê.** Se a pessoa relatar sintoma agudo (dor no peito, falta de ar, fraqueza súbita de um lado do corpo, sangramento importante, confusão), oriente ligar 112 (Europa) ou 192 (Brasil) e pare a análise.
7. **Sem alimentar ansiedade.** O dossiê serve pra levar à consulta. Não incentive medir e checar de novo a cada dúvida. Diante de angústia, sugira conversar com o médico ou com o terapeuta.

## Passo 1: inventário

1. Liste a pasta inteira e conte os arquivos por tipo (PDF, foto, planilha, arquivo genético).
2. Identifique, pra cada arquivo, o tipo de documento e a data provável.
3. Pergunte de uma vez só o que faltar:
   - idade, sexo, país onde mora;
   - doenças e cirurgias que já teve;
   - remédios e suplementos que toma hoje;
   - histórico familiar: quem, o quê, com que idade;
   - tipo de dado genético: nenhum, chip (23andMe, MyHeritage, Ancestry) ou genoma completo (VCF, CRAM).
4. Mostre o que encontrou e o que falta pra um quadro completo.

## Passo 2: organizar os arquivos (com ok)

- Uma pasta por evento: `Exames/AAAA/AAAA-MM-DD_Evento_Local/` (ex.: `Exames/2025/2025-03-12_Analises_LabCentral/`).
- Nome do arquivo: `AAAA-MM-DD_tipo_detalhe.ext` (ex.: `2025-03-12_analises_lipidos.pdf`).
- Fotos de várias páginas do mesmo documento: numere na ordem de leitura (`_01_`, `_02_`) e junte num `AAAA-MM-DD_evento_COMPLETO.pdf`.
- Deixe `novos/` vazia como caixa de entrada.
- Mostre a tabela "nome atual → nome novo" e espere o ok antes de mover.

## Passo 3: extrair

- **PDF:** use a skill `pdf` se estiver instalada; se não, extraia o texto com Python.
- **Foto:** leia a imagem. Se for muito grande, faça uma cópia reduzida em pasta temporária pra leitura e mantenha o original intacto.
- **Por exame de laboratório:** data da coleta, laboratório ou local, e cada analito com valor, unidade, faixa de referência e a marcação do próprio laudo (alto, baixo, normal).
- **Laudo de imagem ou procedimento:** achados e conclusão, na íntegra quando forem curtos.
- **Receitas e pedidos médicos:** registre o que foi prescrito ou pedido, como está escrito, com data e médico.
- Unidades diferentes entre laboratórios (mg/dL e mmol/L, por exemplo): converta e diga que converteu.

## Passo 4: escrever os documentos

Use os modelos em `${CLAUDE_PLUGIN_ROOT}/templates/`. Cada documento começa com a barra de navegação que liga os seis.

1. `00_Hub.md`: de 6 a 10 indicadores que mais importam pra essa pessoa, com valor, data e estado (🟢 🟡 🔴), as prioridades em uma linha e o mapa dos documentos.
2. `Clinico.md`: cada exame extraído, linha do tempo por ano, tabela de tendências (marcador, trajetória, direção, prioridade), lista de problemas ativos e perguntas por especialidade.
3. `Genetica.md`: só se houver DNA. Chame a skill `dossie-genoma`.
4. `Correlator.md`: veja o Passo 5.
5. `Plano.md`: em ordem prática. Uma coleta de sangue com tudo que falta, consultas por especialidade com as perguntas prontas, pendências com data e a cadência de cada exame.
6. `Resumo_Consulta.md`: uma página. Dados básicos, medicação atual (como prescrita), três motivos principais, tendências em tabela, perguntas objetivas e o que está tranquilo.

## Passo 5: Correlator

Trabalhe por eixo, usando só os eixos com dado: cardiovascular e lipídico, metabólico e composição corporal, gastrointestinal e nutricional, hormonal, renal, hematológico, neurológico e saúde mental, reprodutivo, farmacogenômica.

Em cada eixo:

- **Exames:** os valores e a trajetória.
- **Genoma:** as variantes relevantes, se houver.
- **Família:** quem teve o quê, com que idade.
- **Casa:** medições como pressão, frequência cardíaca, peso, se houver.
- **Veredito**, com um selo por cruzamento:
  - **confirma**: uma camada explica a outra;
  - **reclassifica**: uma camada derruba uma hipótese que parecia certa;
  - **pergunta nova**: o cruzamento abre algo pra levar ao médico.
- **Ação:** exame a pedir ou pergunta pra consulta. Nunca uma conduta.

Feche com uma matriz-resumo (eixo, genoma, exame/família, veredito, ação) e uma lista de lacunas: os exames que, se feitos, fechariam mais correlações.

## Passo 6: fechar

- Diga em poucas linhas o que montou, os 3 a 5 pontos de maior peso e o que pedir na próxima coleta.
- Sugira salvar na memória do Claude Code o caminho da pasta e o contexto que a pessoa contou.
- Lembre que exame novo entra por `novos/` com a skill `dossie-atualizar`.
