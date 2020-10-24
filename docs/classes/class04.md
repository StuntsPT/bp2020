#### Class #4

##### Bioinformática Prática 2020

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

### Plotting

---

### How does it work?

<ul>
<li class="fragment">Plotting in R uses a function called `plot()`</li>
  <ul>
  <li class="fragment">There are others, but let's start simple</li>
  </ul>
<li class="fragment">The plot proprieties can either be provided at call time, or added *a posteriori*</li>
<li class="fragment">It is not as confusing as it sounds</li>
</ul>

---

### Rules of engagement

<ul>
<li class="fragment">Lines with a `#` below are wither new, or changed</li>
  <ul>
  <li class="fragment">Pay special attention to them</li>
  </ul>
<li class="fragment">You should clear all plots between each slide</li>
  <ul>
  <li class="fragment">Use the broom icon <img src="C04_assets/broom.png" style="background:none; border:none; box-shadow:none;"> above the **plots** pane for that</li>
  </ul>
</ul>

<p class="fragment">Ready?</p>

---

### A simple dot plot

```R
charles = c(12, 11, 12, 12, 13)
# This is the class of the main professor at the institute

plot(charles)
# Use this function to draw your first plot
```

|||

### Add a line + Title

```R
charles = c(12, 11, 12, 12, 13)
plot(charles, type="o", col="blue", pch="x")
# Check the help for "type"
# "col" sets the colour
# Also check "pch" for dot types

title(main="Students at the institute", col.main="#DAA520", font.main=8)
# This command will **alter** the plot - what happens if you don't clear the buffer?
# Another way to set the colour!
```

|||

### Add another class

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)
# Adds "professor" Scott class data
plot(charles, type="o", col="gray", ylim=c(0,15), pch="x")
# Let's add new limits (try without doing this too)

lines(scott, type="o", pch=22, lty=2, col="red")
# Plots Scott's class
# Check out what "lty" does

title(main="Students at the institute", col.main="#DAA520", font.main=8)
```

|||

### Automate the limits and label axes

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)

st_range = range(0, charles, scott)
# Range function! Let's automate the y-axis

plot(charles, type="o", col="gray", ylim=st_range, pch="x")
# Now we have automated limits

lines(scott, type="o", pch=22, lty=2, col="red")
title(main="Students at the institute", col.main="#DAA520", font.main=8)

title(xlab="Days", col.lab="darkgreen")
# Adds a label to the X axis
title(ylab="Students", col.lab="darkgreen")
# Adds a label to the Y axis
# These will mess up the names! Noooo!
```

|||

### Cleanup

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)

st_range = range(0, charles, scott)

plot(charles, type="o", col="gray", ylim=st_range, pch="x", ann=FALSE)
# This change removes the automatic "lables"

lines(scott, type="o", pch=22, lty=2, col="red")
title(main="Students at the institute", col.main="#DAA520", font.main=8)

title(xlab="Days", col.lab="darkgreen")
title(ylab="Students", col.lab="darkgreen")
```

|||

### Adding a legend

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)

st_range = range(0, charles, scott)

plot(charles, type="o", col="gray", ylim=st_range, pch="x", ann=FALSE)

lines(scott, type="o", pch=22, lty=2, col="red")
title(main="Students at the institute", col.main="#DAA520", font.main=8)

title(xlab="Days", col.lab="darkgreen")
title(ylab="Students", col.lab="darkgreen")

legend(1, st_range[2], c("charles","scott"),
       cex=0.8, 
              col=c("gray","red"), pch=4:22, lty=1:2)
	      # Adds a legend. What are the first 2 arguments?
	      # What does "cex" do?
	      # Check the "pch" numbers too
```

|||

### New axes

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)

st_range = range(0, charles, scott)

plot(charles, type="o", col="gray", ylim=st_range, pch="x", ann=FALSE, axes=FALSE)
# Remove the axes. Careful!

axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
# Adds an X axis (1).
# What do "at" and "lab" do?

axis(2, at=3*0:st_range[2])
# Adds an Y axis (2)
# Take a better look at "at" 

lines(scott, type="o", pch=22, lty=2, col="red")
title(main="Students at the institute", col.main="#DAA520", font.main=8)

title(xlab="Days", col.lab="darkgreen")
title(ylab="Students", col.lab="darkgreen")

legend(1, st_range[2], c("charles","scott"),
       cex=0.8, 
              col=c("gray","red"), pch=4:22, lty=1:2)
```

|||

### Getting data from an external file

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")
# Now we load the data from an external source

max_y = max(classes_data)
# Get maximum value to adjust axes to

plot_colors <- c("gray","red","orange")
# Define plot colours previously to avoid large trains of code later on

plot(classes_data$Charles, type="o", col=plot_colors[1], pch="x",
     ylim=c(0,max_y), axes=FALSE, ann=FALSE)
# We also have to adjust our plotting function

axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
axis(2, at=3*0:max_y)
# We also had to change the Y-axis to use the new variable

lines(classes_data$Scott, type="o", pch=22, lty=2,
      col=plot_colors[2])
# The line for "Scott" also needs to refer to the new data source

lines(classes_data$Logan, type="o", pch=14, lty=6, 
      col=plot_colors[3])
# There is new data, this time for "professor" Logan

title(main="Students at the institute", col.main="#DAA520", font.main=8)
title(xlab="Days", col.lab="darkgreen")
title(ylab="Students", col.lab="darkgreen")

legend(1, max_y, names(classes_data), cex=0.8, col=plot_colors, 
       pch=c(4, 22, 14), lty=c(1,2,6))
# The code to set the legend is also changed. can you tell why?
# Maybe now it should be placed somewhere else...

```

[Alternate link](https://raw.githubusercontent.com/StuntsPT/BP2020/master/docs/classes/C04_assets/classes_data.txt)

|||

### "Saving the plot"

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

max_y = max(classes_data)
plot_colors <- c("gray","red","orange")

png(filename="C:\figure.png", height=295, width=300, 
    bg="white")
# In order to save a plot we first need to tell R some information
# Can you tell what each option does?

plot(classes_data$Charles, type="o", col=plot_colors[1], pch="x",
     ylim=c(0,max_y), axes=FALSE, ann=FALSE)

axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
axis(2, at=3*0:max_y)

lines(classes_data$Scott, type="o", pch=22, lty=2,
      col=plot_colors[2])

lines(classes_data$Logan, type="o", pch=14, lty=6, 
      col=plot_colors[3])

title(main="Students at the institute", col.main="#DAA520", font.main=8)

title(xlab="Days", col.lab="darkgreen")
title(ylab="Students", col.lab="darkgreen")

legend(1, max_y, names(classes_data), cex=0.8, col=plot_colors, 
       pch=c(4, 22, 14), lty=c(1,2,6))

dev.off()
# Now that our plot is complete, we just have to 
# "turn off" the device driver (which flushes output to our png image)
```

---

### Summary

<ul>
 <li class⁼"fragment">`plot()` will start a new plot in R</li>
 <li class="fragment">We can keep changing it until we "close" it</li>
 <ul>
  <li class="fragment">`lines()` will allow us to plot additional lines</li>
  <li class="fragment">`title()` allows for changing the title, subtitle and add axis lables</li>
  <li class="fragment">`axis()` allows for axes manipulations</li>
  <li class="fragment">`legend()` adds a legend to the plot</li>
 </ul>
 <li class="fragment">`dev_off()` will end it</li>
</ul>

---

### Phew!

![It's over](C04_assets/done.gif)

---

### Bar plots

<ul>
<li class="fragment">Bar plots are great for frequency data</li>
<li class="fragment">They combine really well with data from the `table()` function</li>
<li class="fragment">Let's look at the `barplot()` function!</li>
</ul>

|||

### Bar plot basics

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

barplot(classes_data$Charles)
# Try with Scott too
```

[Alternate Link](https://github.com/StuntsPT/BP2020/raw/master/docs/classes/C04_assets/classes_data.txt)

|||

#### "Side by side"

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

barplot(as.matrix(classes_data), main="Institute", ylab= "Total Students",
        beside=TRUE, col=rainbow(5))
# Let's try plotting all classes at once!
# And add some colour too!

legend("topleft", c("Mon","Tue","Wed","Thu","Fri"), cex=0.6, 
       bty="n", fill=rainbow(5))
# Let's also add a (small) Legend, but let's remove the border this time.
# Check the "bty" option documentation!
# Check the "rainbow" function too!
```

|||

### Focus on weekdays

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

barplot(t(classes_data), main="Institute", ylab="Total Students", 
        col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8) 
# Let's transpose the matrix to get a differente view (t())
# Use heat colours instead (heat())
# Add 10% space between each bar ("spcace" argument)
# Decrease the size of labels, just because we can

legend("topleft", names(classes_data), cex=0.8, fill=heat.colors(3))
# We now add the legend. But it's not looking so good now. Is it?
```

|||

### How can we improve the legend?

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

par(xpd=T, mar=par()$mar+c(0,0,0,4))
# Let's add some space, right of our figure

barplot(t(classes_data), main="Institute", ylab="Total Students", 
        col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8) 

legend(6, 30, names(classes_data), cex=0.8, fill=heat.colors(3))
# Now we can set the figure to somewhere it won't cover any parts
# of our plot
```

|||

### Something still bothers me...

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

par(xpd=T, mar=par()$mar+c(0,0,0,4))

barplot(t(classes_data), main="Institute", ylab="Total Students", 
        col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8,
	ylim=c(0,30))
# We now added a `ylim` parameter to our plot. This will make sure
# the y axis does not end before the data

legend(6, 30, names(classes_data), cex=0.8, fill=heat.colors(3))
```

---

### Summary

<ul>
 <li class⁼"fragment">`barplot()` will draw a barplot</li>
 <li class="fragment">This function works in a similar fashion to `plot()`</li>
 <li class="fragment">It is very versatile, when combined with the `t()` function</li>
</ul>

---

### What about that `par` thing?

<ul>
 <li class⁼"fragment">`par()` contains the plotting parameters</li>
 <ul>
  <li class="fragment">It works like any other R object</li>
 </ul>
 <li class="fragment">Contains a lot of parameters, some of the most frequent are:</li>
 <ul>
  <li class="fragment">`mar()` - set internal margins</li>
  <li class="fragment">`oma()` - set external margins</li>
  <li class="fragment">`mgp()` - set axes distances</li>
  <li class="fragment">`mfrow()` - set number of rows</li>
  <li class="fragment">`mfcol()` - set number of columns</li>
 </ul>
</ul>

|||

### Using `par()`

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

par(mfrow=c(1,2))
# Divides the drawing area in 2 columns

barplot(t(classes_data), main="Institute", ylab="Total Students", 
        col=heat.colors(3), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8) 
barplot(as.matrix(classes_data), main="Institute", ylab= "Total Students",
        beside=TRUE, col=rainbow(5))
# Now we tell R to draw 2 plots at the same time
```

---

### Getting there

![Burn](C04_assets/burns.gif)

---

### Pie charts

<ul>
 <li class⁼"fragment">`pie()` will plot a pie chart</li>
 <li class="fragment">It's parameters are similar to those of other plots</li>
 <ul>
  <li class="fragment">But are usually a lot less flexible</li>
 </ul>
</ul>

|||

### Pie charts

![have fun](C04_assets/have_fun.gif)

---

### Histograms

<ul>
 <li class⁼"fragment">`hist()` will plot an histogram</li>
 <li class="fragment">Are great for representing data distributions</li>
 <li class="fragment">R will bin the data for you</li>
 <ul>
  <li class="fragment">But of course, you can control that too</li>
 </ul>
</ul>

|||

### Basic histogram

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

hist(classes_data$Charles)
```

|||

### Adding more data

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

all_classes = c(classes_data$Charles, classes_data$Scott, 
                classes_data$Logan)
# We must concatenate all our columns into a singhle vector to get full data

hist(all_classes, col="gold")
# We draw the plot again, this time with some colour...
# Well, that didn't go all that well, did it?
```

|||

### Controlling the bins

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

all_classes = c(classes_data$Charles, classes_data$Scott, 
                classes_data$Logan)

max_num <- max(all_classes)
# Get the highest value to help with binning

hist(all_classes, col="gold", breaks=max_num, 
     xlim=c(0,max_num), right=F, main="Class attendances", las=1)
# Define the "breaks", "xlim" and add a title
# What does "las" do?
# What does "right" do?
```

|||

### Even more control!

```R
classes_data = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/classes/C04_assets/classes_data.txt", header=TRUE, sep="\t")

all_classes = c(classes_data$Charles, classes_data$Scott, 
                classes_data$Logan)

max_num <- max(all_classes)

brk <- c(0,1,2,3,4,10,11,12,13,14,15)
# Set the breaks ourselves

hist(all_classes, col=heat.colors(length(brk)), breaks=brk, 
     xlim=c(0,max_num), right=F, main="Probability Density", 
     las=1, freq=F)
# We now use our own breaks, and turn the plot into a
# probability density plot (freq)
# We also switch the static colour with a gradient
```

---

### Summary

<ul>
 <li class⁼"fragment">Histograms are very much like other plots</li>
 <li class="fragment">The main difference is in binning</li>
 <li class="fragment">There are many more options</li>
</ul>

---

### Why?

![scott](C04_assets/scott.gif)

---

### Distribution sampling

<ul>
 <li class⁼"fragment">We can use R to sample known distributions</li>
 <li class="fragment">Histograms are great for that too</li>
</ul>

```R
samples = rnorm(1000)

hist(samples, col="lightblue", freq=F)
```

---

### Almost forgot!

```R
rdm0 = rnorm(100)
rdm1 = rnorm(100, 1)
rdm2 = rnorm(100, 0, 0.5)
rdm3 = rnorm(100, 1, 2)

boxplot(rdm0, rdm1, rdm2)

boxplot(rdm0, rdm1, rdm2, rdm3, col="brown")
```

|||

### Boxplots can be more complex

```R
boxplot(mpg~cyl, data=mtcars, notch=TRUE,
        col=(c("gold","darkgreen","red")),
        main="Mileage by engine type", xlab="# of cylinders",
        ylab="MPG")
# Can you tell what we are doing here?
```

---

### Finally

