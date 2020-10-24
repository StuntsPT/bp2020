### Class #1

#### Bioinformática Prática 2020

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Programa

**1ª semana**

* 28-10-2020 – Introdução à disciplina; organização e tratamento de dados
* 29-10-2020 – Introdução ao R
* 30-10-2020 – Revisão de conceitos (*Ciências Research Day*)
* 31-10-2020 – Gráficos em R
* 01-11-2020 - **Feriado**

|||

## Programa

**2ª semana**

* 04-11-2020 – Testes de hipóteses
* 05-11-2020 – Testes de hipóteses II
* 06-11-2020 – **Journal Club** (14-16h) - Seminário
* 07-11-2020 – Análise exploratória
* 08-11-2020 – Automatização e reprodutibilidade

|||

## Programa

**3ª semana**

* 11-11-2020 – Revisões (14h-16h) - Seminário
* 12-11-2020 – **Apresentações**
* 13-11-2020 – **Apresentações**
* 14-11-2020 – Exercícios
* 15-11-2020 – **Exame TP**

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
* 100% digital <!-- .element: class="fragment" data-fragment-index="3" -->

|||

## Seminários

* Apresentação individual de 15 minutos <!-- .element: class="fragment" data-fragment-index="1" -->
  * Discussão de 5 minutos <!-- .element: class="fragment" data-fragment-index="1" -->
* Enviem um artigo científico à vossa escolha por email <!-- .element: class="fragment" data-fragment-index="2" -->
  * Focar a apresentação nos conteúdos relacionados com o programa da disciplina <!-- .element: class="fragment" data-fragment-index="2" -->

|||

## Journal club

* Discussão de um artigo científico <!-- .element: class="fragment" data-fragment-index="1" -->

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

print(sorteio("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C01_assets/nomes.txt", 12345))
```
