---
name: dossie-atualizar
description: Processa exames, laudos, receitas e pedidos médicos novos (PDF ou foto) que chegaram na pasta novos/ de um dossiê de saúde já montado, renomeia e organiza por evento, e atualiza Hub, Clínico, Correlator, Plano e Resumo. Use quando a pessoa disser "chegou exame novo", "joguei exames na novos", "atualiza meu dossiê", "documenta a consulta de hoje" ou mandar foto de laudo pedindo pra organizar. Organiza e sintetiza; quem diagnostica e prescreve é o médico.
license: MIT
---

# Dossiê Vivo: atualizar

O dossiê já existe (`00_Hub.md`, `Clinico.md`, `Correlator.md`, `Plano.md`, `Resumo_Consulta.md`). Chegou material novo em `novos/`. Seu trabalho é organizar, extrair e costurar no que já existe.

## Regras invioláveis

1. **Remédio vira pergunta.** Registre o que o médico prescreveu, como está escrito. Nunca sugira começar, parar, trocar ou ajustar dose.
2. **Valor só com fonte.** Todo número cita documento e data. Ilegível fica "ilegível".
3. **Exame e genética em colunas separadas.** Genética é predisposição.
4. **Processamento local.** Nada da pessoa vai pra serviço externo.
5. **Arquivo da pessoa só muda com ok.** Mostre o plano de renomeação antes de mover. Nunca apague original.
6. **Emergência fora do dossiê.** Sintoma agudo: oriente 112 (Europa) ou 192 (Brasil) e pare.
7. **Sem alimentar ansiedade.** Achado novo vira pergunta pra consulta, com o tamanho que ele tem.

## Passo 1: ler tudo

1. Liste `novos/`. Leia cada arquivo. Foto grande: cópia reduzida em pasta temporária, original intacto.
2. Pra cada um, identifique o tipo (análises, imagem, prova funcional, receita, pedido de exame, relatório de consulta), a data e o local.
3. Agrupe por evento: páginas do mesmo documento e documentos da mesma consulta ficam juntos. Ordene as páginas pela numeração impressa ou pela sequência lógica.

## Passo 2: organizar (com ok)

- Pasta por evento: `Exames/AAAA/AAAA-MM-DD_Evento_Local/`.
- Arquivo: `AAAA-MM-DD_tipo_detalhe.ext`, com `_01_`, `_02_` quando houver várias páginas.
- Um `AAAA-MM-DD_evento_COMPLETO.pdf` por evento.
- Mostre a tabela "nome atual → nome novo", espere o ok, mova. `novos/` termina vazia.

## Passo 3: extrair e costurar

- **Clinico.md:** a seção do exame (dados extraídos, laudo, leitura), a linha nova na linha do tempo e a tabela de tendências atualizada. Compare com o mesmo exame anterior quando existir (ex.: a mesma prova feita anos antes).
- **00_Hub.md:** painel com a data nova e os indicadores que mudaram.
- **Correlator.md:** só se o dado novo cruza com outra camada. Use os selos confirma, reclassifica ou pergunta nova.
- **Plano.md:**
  - marque como feito o que foi feito, com data;
  - receita: registre remédio, dose e duração como escritos, e acrescente o que vale saber pra consulta (o que esperar, o que ele não cobre, sinais pra avisar o médico) com fonte;
  - pedido de exame: vira pendência com o prazo escrito pelo médico, e a lista do que o pedido cobre e do que ficou de fora em relação às lacunas do dossiê.
- **Resumo_Consulta.md:** medicação atual e tendências.

## Passo 4: relatório curto

Em poucas linhas:

1. o que chegou;
2. o que mudou no quadro;
3. o que cruzou com o que já existia;
4. o que perguntar ao médico;
5. algum dado que precisa de confirmação da pessoa (peso declarado ou medido, data ilegível, página faltando).
