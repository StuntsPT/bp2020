### Class #2

#### Bioinformática Prática 2018

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Getting started

* Data handling
* Text files
* Simple formatting

---

## R

![Imagem do R](link_to_R_image.png)

[GNU R](https://www.r-project.org/)

---

## Meet R

![R console](link_to_R_console.png)

---

## RStudio - an R IDE

![RStudio_image](link_to_rstudio.png)

* Text editor <!-- .element: class="fragment" data-fragment-index="1" -->
* Console <!-- .element: class="fragment" data-fragment-index="2" -->
* Workspace objects <!-- .element: class="fragment" data-fragment-index="3" -->
* Multi-purpose <!-- .element: class="fragment" data-fragment-index="4" -->

---

## How do I use this thing?

* Calculator

```R
4+4
[1] 8

(2 + 5)*6/(6-2)
[1] 10.5
```

|||


## How do I use this thing?

* Text processor

```R
print("Good Morning World!")
[1] "Good Morning World!"
```

![Bart Simpson](Link to bart simpson.png)

---

## R programming 101

### Variables

```R
txt = "Good Morning World!"

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
df = data.frame(n, s, b)  # df is a data frame 
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
```

---

## Functions


