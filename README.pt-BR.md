# Dossiê Vivo (Living Dossier)

Um plugin pro Claude Code que organiza a sua vida médica numa pasta: exames, genoma, família e o que você mede em casa, cruzados num lugar só. Você chega na consulta sabendo o que perguntar.

> **Organização, síntese e estruturação de informação.** O médico tem a palavra final. Remédio só com receita. Leia o [AVISO](AVISO.md) antes de usar.

Site: [sapiensinteticos.com/living-dossier](https://www.sapiensinteticos.com/living-dossier?lang=pt) · Read in English: [README.md](README.md)

## Por que eu fiz isso

Teve uma fase em que o meu primeiro cérebro estava falhando. Eu tive névoa mental: o raciocínio não acompanhava, eu perdia o fio, e decidir qualquer coisa sobre a minha própria saúde virou um peso que eu não conseguia carregar sozinho.

Foi aí que a IA virou o meu segundo cérebro. Na época era o Gemini, uma tecnologia bem abaixo da de hoje, e mesmo assim ela me protegeu. Organizou o que eu não conseguia organizar, traduziu laudos e conversas com médicos, e me devolveu o mínimo de controle pra tomar decisões melhores quando a minha cognição não conseguia acompanhar. Ajudou a salvar a minha vida.

Com o tempo, juntei anos de exames, laudos de médicos diferentes em países diferentes, o histórico da minha família e o meu genoma. Me conhecer em nível biológico, com um agente traduzindo tudo isso, me deu a oportunidade de voltar pra uma vida que eu achava que já era passado. Hoje quem faz esse trabalho comigo é o Claude Opus 5.5, do jeito mais responsável e detalhado que eu já vi.

Nada disso é dica médica. É a minha motivação. Saúde varia muito de pessoa pra pessoa, e o que funcionou pra mim serve como ponto de partida.

O que eu sinto agora é só gratidão. Ao Gemini, e a todo o contexto que tornou isso possível: a tecnologia que ficou mais barata ano após ano, o open source, a pesquisa e o material publicado por gente que eu nunca vou conhecer, que alimentou base atrás de base até chegar em mim. Este plugin é a minha forma de devolver um pouco. Ele é de graça e totalmente livre, pra que pessoas melhores e mais inteligentes que eu façam bom uso e adaptem à necessidade delas.

Borderless

## O que ele faz

- Lê laudos em PDF e fotos de exame e extrai cada valor com data, laboratório e referência.
- Monta seis documentos em Markdown: Hub, Clínico, Genética, Correlator, Plano e Resumo pra consulta.
- Cruza exames, genética, família e medições de casa, e marca cada cruzamento como **confirma**, **reclassifica** ou **pergunta nova**.
- Transforma tudo que envolve remédio em pergunta pro médico.
- Organiza os arquivos numa pasta por evento, com nome padronizado.
- Com genoma completo, guia a análise na sua máquina com ferramentas abertas de bioinformática.

## O que ele não faz

- Diagnóstico.
- Indicação, troca ou suspensão de remédio.
- Cálculo de risco que substitua avaliação médica.
- Atendimento de urgência. Sintoma agudo é caso de emergência: **112** na Europa, **192** (SAMU) no Brasil.

## Instalação

No Claude Code:

```
/plugin marketplace add inhabitants/living-dossier
/plugin install living-dossier@living-dossier
```

Pra testar uma cópia local, troque `inhabitants/living-dossier` pelo caminho da pasta.

Recomendado: as skills oficiais de documento da Anthropic, pra ler PDF.

```
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
```

Qualquer outro agente segue as skills direto do repositório: aponte pro [`llms.txt`](llms.txt).

## Como usar

1. Crie uma pasta pra sua saúde, **fora de qualquer repositório git**. Junte laudos, fotos, receitas e o arquivo de DNA. Dentro dela, crie `novos/`, que vira a caixa de entrada.
2. Abra o Claude Code nessa pasta e peça: *"monta meu dossiê de saúde"*. A skill `dossier-build` faz o inventário, pergunta o que falta e escreve os documentos.
3. Exame novo: jogue o PDF ou a foto em `novos/` e peça *"chegou exame novo"*. A skill `dossier-update` renomeia, organiza e atualiza tudo.
4. DNA: peça *"analisa meu genoma"*. A skill `dossier-genome` trata chip (23andMe, MyHeritage, Ancestry) e genoma completo (VCF e CRAM).
5. Leve o resumo de uma página na próxima consulta.

As skills são escritas em inglês e respondem na sua língua: pede em português e o dossiê sai em português.

## O que sai

| Documento | Conteúdo |
|---|---|
| `00_Hub.md` | Painel com os indicadores que mais importam e links pros outros documentos |
| Clínico | Cada exame extraído, linha do tempo por ano, tendências, problemas ativos |
| Genética | Só o acionável: risco cardiovascular, farmacogenômica, portador, ancestralidade |
| Correlator | Por eixo de saúde, exame × genética × família × casa, com o selo de cada cruzamento |
| Plano | O que fazer em ordem: coleta, consultas com perguntas prontas, cadência de exames |
| Resumo pra consulta | Uma página pra levar ao médico |

Os modelos estão em [`templates/`](templates/). Um dossiê pronto, de uma paciente fictícia, está em [`examples/pt-BR/`](examples/pt-BR/).

## Privacidade

- Os seus dados ficam na sua pasta. O plugin não tem servidor e não coleta nada.
- O Claude lê, pela API da Anthropic, os arquivos que abre pra você. Com genoma completo, as ferramentas rodam no seu computador e o Claude lê só os resultados; o arquivo bruto fica no disco.
- DNA é o dado mais permanente que você tem: senha a gente troca, genoma fica. Evite subir o seu arquivo em site de interpretação gratuita.
- O `.gitignore` deste repositório bloqueia os formatos comuns de exame e DNA, mas a proteção principal é a sua pasta de dossiê ficar fora do git.

## Situação

Publicado como está, por uma pessoa, de graça. Não tem promessa de suporte. Fork é bem-vindo, e pull request também, seguindo o [CONTRIBUTING](CONTRIBUTING.pt-BR.md).

## Licença

[MIT](LICENSE). Use, copie, adapte.

Da bancada do [Sapiens Sintéticos](https://www.sapiensinteticos.com). Sem vínculo com a Anthropic. Claude é marca da Anthropic, PBC.
