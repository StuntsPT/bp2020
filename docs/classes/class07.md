### Class #7

#### Bioinformática Prática 2020

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Exploratory data analysis

### Clustering analysis

---

### Main questions

* What is it?
* When is it useful? <!-- .element: class="fragment" data-fragment-index="1" -->
* How does it 'work'? <!-- .element: class="fragment" data-fragment-index="2" -->

---

### What is clustering analysis?

* A way to group objects
* Objects in the same group are closer to each other than to objects in other groups <!-- .element: class="fragment" data-fragment-index="1" -->
* It is not an algorithm, but rather a task (yes, it is that broad) <!-- .element: class="fragment" data-fragment-index="2" -->

![clustering](C07_assets/UPGMA_Dendrogram_5S_data.png) <!-- .element: class="fragment" data-fragment-index="3" -->

---

### When is clustering analysis useful?

* To group data into clusters
* For easy visualization of (di)similarities <!-- .element: class="fragment" data-fragment-index="1" -->
* As a starting point for other analyses <!-- .element: class="fragment" data-fragment-index="2" -->

---

## Dendrogram analysis

---

### How does it work?

* First a distance matrix must be obtained
	* More specifically - a triangular distance matrix <!-- .element: class="fragment" data-fragment-index="1" -->
* Then the distances are converted into a dendrogram <!-- .element: class="fragment" data-fragment-index="2" -->
	* Displays the distance between the objects in a graphical manner <!-- .element: class="fragment" data-fragment-index="3" -->
* Exploratory technique! <!-- .element: class="fragment" data-fragment-index="4" -->

[Know more](https://davetang.org/muse/2013/08/15/distance-matrix-computation/) <!-- .element: class="fragment" data-fragment-index="5" -->

|||

### A simple example

Euclidian distances!

![Euclidian_dist](C07_assets/euclidian.png) 

```R
euclidean_distance = function(p,q){

    result = sqrt(sum((p - q)^2))

    return(result)
}
```

|||

### A simple example

```R
set.seed(123)
scater_data = data.frame(x=sample(1:10000,7), 
                         y=sample(1:10000,7))

scp = plot(x=scater_data$x, y=scater_data$y, col=1:7, pch=19)

legend("topleft",
       legend = c(row.names(scater_data)),
       pch = 19,
       col = c(1:7))
```

|||

### A simple example

```R
euclidean_distance(scater_data[1,], scater_data[2,])

triang = dist(scater_data)

plot(hclust(triang, method="complete"))
```

---

### A worked example

* Suppose we have some students and their respective grades
* We need to quickly view who has good and poor grades <!-- .element: class="fragment" data-fragment-index="1" -->

|||

### Showtime!

Let's try to group some students

```R
students = ("
Name Maths English
Bart_Simpson 4 3
Lisa_Simpson 19 18
Tom_Sawyer 5 7
Hucklebery_Finn 5 2
Hermione_Granger 20 20
Harry_Potter 15 16
Samwell_Tarly 19 20
Alladin 14 13
Peter_Quill 8 11
Leia_Organa 18 18
Luke_Skywalker 14 16
")

student_matrix = as.matrix(read.table(textConnection(students),
                           header=TRUE,
			   row.names=1))
plot(hclust(dist(student_matrix),method="average"))

```

---

## Exploratory data analysis

### PCA <!-- .element: class="fragment" data-fragment-index="1" -->

---

### Main questions

* What is it?
* When is it useful? <!-- .element: class="fragment" data-fragment-index="1" -->
* How does it 'work'? <!-- .element: class="fragment" data-fragment-index="2" -->

---

### What is a PCA?

* "**P**rincipal **C**omponent **A**nalysis"
* An exploratory method <!-- .element: class="fragment" data-fragment-index="1" -->
* A dimensional reduction technique <!-- .element: class="fragment" data-fragment-index="2" -->
* A way to cluster data from large, complex, datasets <!-- .element: class="fragment" data-fragment-index="3" -->

---

### When is a PCA useful?

* If data simplification is required
* If variables are highly correlated <!-- .element: class="fragment" data-fragment-index="1" -->
* If dealing with 3 dimensional or higher data <!-- .element: class="fragment" data-fragment-index="2" -->

---

### How does a PCA 'work'?

* Uses orthogonal transformation
* Converts possibly correlated variables into uncorrelated <!-- .element: class="fragment" data-fragment-index="1" -->
* The new variables are called "principal components" (PCs) <!-- .element: class="fragment" data-fragment-index="2" -->
* The PCs are sorted by the amount of variability they explain <!-- .element: class="fragment" data-fragment-index="3" -->

[Would you like to know more?](https://tgmstat.wordpress.com/2013/11/21/introduction-to-principal-component-analysis-pca/) <!-- .element: class="fragment" data-fragment-index="4" -->

---

### In practice...

```R
# Get some data
wine <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep=",")

# Add column names
colnames(wine) <- c("Cultivar", "Alcohol", "Malic acid", "Ash",
                    "Alcalinity of ash", "Magnesium", "Total phenols",
                    "Flavanoids", "Nonflavanoid phenols", "Proanthocyanins",
                    "Color intensity", "Hue", "OD280/OD315 of diluted wines",
                    "Proline")

# The first column corresponds to the cultivar class
cultivar_classes <- factor(wine$Cultivar)

winePCA <- prcomp(scale(wine[,-1]))
plot(winePCA$x[,1:2], col = cultivar_classes, main="PCA test plot")
legend("bottomright", legend = c("Cv1","Cv2","Cv3"), pch = 1,
       col = c("black","red","green"))
```

---

### PCAs can take us further, but not in "plain" R

#### Introducing <!-- .element: class="fragment" data-fragment-index="1" --> 

[BioConductor](https://bioconductor.org/) <!-- .element: class="fragment" data-fragment-index="1" -->

|||

### When "vanilla" R just isn't enough

<ul>
<li class="fragment">One of the good things about R is it's expandability</li>
<li class="fragment">It is possible to "import" thousands of external 3rd party packages</li>
<li class="fragment">Bioconductor is more than just a package. It's a 3rd party package repository</li>
  <ul>
  <li class="fragment">It hosts ~~1473~~ ~~1649~~ 1823 bioinformatics related packages (at the time of writing)</li>
  <li class="fragment">It is very easy to use directly from R</li>
  </ul>
</ul>

---

### Trying out "pcaMethods" package

* Easy to use PCA extensions
* First we import the new package

```R
install.packages("BiocManager")
BiocManager::install("pcaMethods")
library(pcaMethods)
```

|||

### Trying out "pcaMethods" package

Next we calculate the PCA and plot it

```R
# Calculate PCA
winePCAmethods = pca(wine[,-1], scale="vector", center=T, nPcs=2, method="svd")

# Plot it
slplot(winePCAmethods,
       scol=cultivar_classes,
       scoresLoadings=c(TRUE,FALSE))

legend("bottomright", legend = c("Cv1","Cv2","Cv3"), pch = 1,
       col = c("black","red","green"))

slplot(winePCAmethods,
       scoresLoadings=c(FALSE,TRUE))
```

|||

### Trying out "pcaMethods" package

Let's squeeze a little more information

```R
str(winePCAmethods) # slots are marked with @
winePCAmethods@R2
```

[Source](https://www.r-bloggers.com/principal-component-analysis-in-r/)

|||

### Still skeptic?

Let's test it!

```R
shapiro.test(wine$Ash)
wilcox.test(x=wine$Ash[wine$Cultivar == "2"], y=wine$Ash[wine$Cultivar == "3"])
wilcox.test(x=wine$Ash[wine$Cultivar == "2"], y=wine$Ash[wine$Cultivar == "1"])

# What about this one?
wilcox.test(x=wine$Ash[wine$Cultivar == "3"], y=wine$Ash[wine$Cultivar == "1"])

```
