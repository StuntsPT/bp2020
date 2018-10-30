### Class #2

#### Bioinformática Prática 2018

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

<img src="C02_assets/R_logo.png" style="background:none; border:none; box-shadow:none;">

[GNU R](https://www.r-project.org/)

---

## Meet R

<img src="C02_assets/R-console.gif" style="background:none; border:none; box-shadow:none;">

---

## RStudio - an R IDE

![RStudio_image](C02_assets/rstudio.png)

* Text editor (Top left) <!-- .element: class="fragment" data-fragment-index="1" -->
* Console (Bottom left) <!-- .element: class="fragment" data-fragment-index="2" -->
* Workspace objects (Top right) <!-- .element: class="fragment" data-fragment-index="3" -->
* Multi-purpose (Bottom right) <!-- .element: class="fragment" data-fragment-index="4" -->

---

## How do I use this thing?

Calculator

<pre class="fragment"><code>4 + 4
[1] 8

(2 + 5) * 6 / (6 - 2)
[1] 10.5
</code></pre>

|||


## How do I use this thing?

Text processor

<pre class="fragment"><code>print("Good Morning World!")
[1] "Good Morning World!"
</code></pre>

<img class="fragment" src="C02_assets/BS_good_morning.gif" style="background:none; border:none; box-shadow:none;">

|||

## How do I use this thing?

```R
2 < 3  # Logical operators

2 > 3

2 <= 3

2 >= 3

2 == 2

2 == 2 | 2 >= 3  # OR

2 == 2 & 2 < 3  # AND
```

---

## R programming 101

### Variables

```R
txt = "Good Morning World!"
txt <- "Good Morning World!"  # Old syntax
print(txt)
```

---

## Basic variable types

* Numeric (1.5) - AKA "Float" <!-- .element: class="fragment" data-fragment-index="1" -->
* Integer (1) - these have to be coerced <!-- .element: class="fragment" data-fragment-index="2" -->
* Complex (1+2i) - for imaginary numbers <!-- .element: class="fragment" data-fragment-index="3" -->
* Logical (TRUE) - or FALSE <!-- .element: class="fragment" data-fragment-index="4" -->
* Character ("ABC") - AKA "String" <!-- .element: class="fragment" data-fragment-index="5" -->

|||

## Basic variable types

```
number = 1.5
class(number)
```

* Try this with other variable types <!-- .element: class="fragment" data-fragment-index="1" -->

---

## Advanced variable types

### Vector

A **vector** is a **sequence** of data elements **of the same basic type**. Members in a vector are called "components". It is defined using `c()`:

```R
c(1,2,1)

c("AA", "Aa", "aa")

c(TRUE, FALSE, TRUE)
```

|||

## Vector

We can perform a lot of operations on vectors:

```R
a = c(1, 3, 5, 7)
a * 5  # Multiplication
b = c(1, 2, 4, 8) 
a + b  # Arithmetics with vectors
d = c(1, 2)
a + d  # Recycling rule!
a[2]  # Indexing
```

---

## Advanced variable types

### Factor

Factors are used for storing **categorical variables**.

<img src="C02_assets/pokeball.png" style="background:none; border:none; box-shadow:none;">

<pre class="fragment"><code>captured_pokemon = c("normal", "normal", "electric", "fire", "fire", "fire", "water", "grass")
captured_pokemon_types = factor(captured_pokemon)
</pre></code>

---

## Advanced variable types

### Matrix

A **matrix** is a collection of **data elements** arranged in a **two-dimensional rectangular layout**. It is defined using a `function`.

```R
M = matrix(c(1, 2, 3, 4, 5, 6),  # data elements
           nrow=2,  # number of rows
	   ncol=3)  # number of columns
M

M[1,2]  # Bidimensional indexing!
M[1,]  # Get a single row
M[,1]  # Get a single column
```

---

## Advanced variable types

### List

A list is a generic vector containing other objects

```R
n = c(2, 3, 5) 
s = c("aa", "bb", "cc", "dd", "ee") 
b = c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x = list(n, s, b, 3)  # x contains copies of n, s, b 
```

---

## Advanced variable types

### Data Frame

A **data frame** is used for storing data tables. It is a set of vectors of equal length.

```R
n = c(2, 3, 5) 
s = c("aa", "bb", "cc") 
b = c(TRUE, FALSE, TRUE) 
dframe = data.frame(n, s, b)  # dframe is a data frame 
```

|||

## Advanced variable types

### Data Frame

```R
mtcars  # Built in data! 
head(mtcars)  # Try this instead...
mtcars[1, 2]  # Indexing
mtcars["Mazda RX4", "cyl"]  # Named indexing!

mtcars[[9]]  # Get column 9
mtcars[["am"]]  # Get column "am"
mtcars$am  # Alternative - notice the lack of quotes
mtcars[,"am"]  # Another alternative
mtcars["mpg"]  # Calling it like this will get the names too

mtcars[1,]  # Get row 1

mtcars$am == 0  # Logical indexing!!!111!!one

mtcars[mtcars["cyl" == 6],]  # Can you guess what this does?
```

---

## Functions

R functions are invoked by its **name**, then followed by the parenthesis, and zero or more arguments.

```R
c(1, 2, 3)

sum(1, 2)

head(mtcars)

seq(10, 30)
```

* We can also define our own functions. More on that later. <!-- .element: class="fragment" data-fragment-index="1" -->

|||

## Functions

```R
# See also

mean()
sd()
max()
min()
summary()
table()

```

---

## Variable coercion

* There are functions than can be used to transform variables:

```R

as.data.frame(MATRIX)

as.numeric(INTEGER)

as.character(NUMERIC)

# Many more!

```

---

## Getting help

"When in doubt, ask."
You can ask R for help with the command `?function`. Or if you need help on a **topic** rather than a function, use the `??` notation ("fuzzy search").

```R
?head

??multivariate
```

---

## Installing external packages

<ul>
<li class="fragment">
One of R's greatest strengths is how many 3rd party packages are developed for it
</li>
<li class="fragment">
Installing these external packages is as easy as typing `install.packages(pkg_name)`
</li>
<li class="fragment">
We then have to load the packages we need in order to use them
</li>
</ul>
<pre class="fragment">
<code>install.packages("psych")

library("psych")
</code></pre>

---

## Missing data

Missing data is coded in R as `NA`, which stands for "**N**ot **A**vailable"

```R
v = c(1, 2, NA, 4)
is.na(v)

mean(v)

mean(v, na.rm=TRUE)
```

---

## Loading data from external sources

You don't have to type data into R manually. You can load data directly from files. You can use `read.csv()` or `read.table()`.

```R
data = read.csv("/path/to/file.csv")

data = read.table("/path/to/file.txt", header=FALSE, sep="\t")

data = read.table("https://some.site.with.data.com/datafile.txt", header=TRUE, sep=";", dec=",")
```

---

# Break time!

