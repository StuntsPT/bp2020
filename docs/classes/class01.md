### Class #1

#### Bioinformática Prática 2018

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Programa

1ª semana

* 29-10-2018 – Introdução à cadeira; organização e tratamento de dados
* 30-10-2018 – Revisão de conceitos; introdução ao R
* 31-10-2018 – Visualização de dados; gráficos em R
* 02-11-2018 – Planeamento experimental

|||

## Programa

2ª semana

* 05-11-2018 – Testes de hipóteses
* 06-11-2018 – Testes de hipóteses II
* 07-11-2018 – **Journal Club** (14h-16h)
* 09-11-2018 – Análise de SNPs
* 10-11-2018 – Automatização e reprodutibilidade

|||

## Programa

3ª semana

* 12-11-2018 – Dados de Sequências
* 13-11-2018 – **Apresentações**
* 14-11-2018 – **Apresentações**
* 15-11-2018 – Exercícios
* 16-11-2018 – **Exame TP**

---

## Avaliação

* Exame prático - exame individual realizado em computador, semelhante aos exercícios das aulas teórico-práticas - 50% <!-- .element: class="fragment" data-fragment-index="1" -->
* Seminário apresentado pelos alunos - 25%  <!-- .element: class="fragment" data-fragment-index="2" -->
* Discussão de artigos científicos - 10%  <!-- .element: class="fragment" data-fragment-index="3" -->
* Participação geral na cadeira - 15%. <!-- .element: class="fragment" data-fragment-index="4" -->

|||

## Exame TP

* Baseado nos exercícios feitos ao longo da disciplina <!-- .element: class="fragment" data-fragment-index="1" -->
* Com consulta <!-- .element: class="fragment" data-fragment-index="2" -->
* Todo feito no PC <!-- .element: class="fragment" data-fragment-index="3" -->

|||

## Seminários

* Apresentação individual de 15 minutos <!-- .element: class="fragment" data-fragment-index="1" -->
  * Discussão de 5 minutos <!-- .element: class="fragment" data-fragment-index="1" -->
* Enviem um artigo científico à vossa escolha por email <!-- .element: class="fragment" data-fragment-index="2" -->
  * Focar a apresentação nos conteúdos relacionados com o programa da disciplina <!-- .element: class="fragment" data-fragment-index="2" -->
* Referências no final <!-- .element: class="fragment" data-fragment-index="3" -->

|||

## Journal club

* Discussão de 1 artigo científico <!-- .element: class="fragment" data-fragment-index="1" -->

|||

## Participação Geral

* Participação nas aulas <!-- .element: class="fragment" data-fragment-index="1" -->
* Perguntas durante os seminários <!-- .element: class="fragment" data-fragment-index="2" -->

---

## Ordem das apresentações

* Ficheiro com os nomes dos alunos <!-- .element: class="fragment" data-fragment-index="1" -->
* "Random seed" <!-- .element: class="fragment" data-fragment-index="2" -->
* Script <!-- .element: class="fragment" data-fragment-index="3" -->

|||

## Ordem das apresentações

```R
sorteio = function(names_file, seed) {
    names = read.csv(names_file,
                     header=FALSE)

    set.seed(seed)

    shuffled_names = as.data.frame(sample(t(names)))

    return(shuffled_names)
}

print(sorteio("https://gitlab.com/StuntsPT/bp2018/raw/master/public/classes/C01_assets/nomes.txt", 12345))
```
