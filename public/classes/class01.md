### Class #1

#### Bioinformática Prática 2018

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Programa

1ª semana

* Dia 1 – Introdução à cadeira; organização e tratamento de dados
* Dia 2 – Revisão de conceitos; introdução ao R
* Dia 3 – Visualização de dados; gráficos em R
* Dia 4 – Exercícios de planeamento experimental

|||

## Programa

2ª semana

* Dia 1 – Testes de hipóteses
* Dia 2 – Análise de frequências
* Dia 3 – Sequências de DNA
* Dia 4 – Análise de SNPs
* Dia 5 – Automatização e reprodutibilidade

|||

## Programa

3ª semana

* Dia 1 – GWAS
* Dia 2 – Apresentações
* Dia 3 – Apresentações
* Dia 4 – Exercícios
* Dia 5 – Exame TP

---

## Avaliação

* Exame prático - exame individual realizado em computador, semelhante aos exercícios das aulas teórico-práticas - 50% <!-- .element: class="fragment" data-fragment-index="1" -->
* Seminário apresentado pelos alunos - 25%  <!-- .element: class="fragment" data-fragment-index="2" -->
* Discussão de artigos científicos - 10%  <!-- .element: class="fragment" data-fragment-index="3" -->
* Participação geral na cadeira - 15%. <!-- .element: class="fragment" data-fragment-index="4" -->

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
