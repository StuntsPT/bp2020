### Class #4

#### Bioinformática Prática 2018

<img src="C01_assets/logo-FCUL.png" style="background:none; border:none; box-shadow:none;">

<center>Francisco Pina Martins</center>

<center>[@FPinaMartins](https://twitter.com/FPinaMartins)</center>

---

## Plotting

---

## How does it work?

<ul>
<li class="fragment">Plotting in R uses a function called `plot()`</li>
  <ul>
  <li class="fragment">There are others, but let's start simple</li>
  </ul>
<li class="fragment">The plot proprieties can either be provided at call time, or added *a posteriori*</li>
<li class="fragment">It is not as confusing as it sounds</li>
</ul>

---

## Rules of engagement

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

## A simple dot plot

```R
charles = c(12, 11, 12, 12, 13)
# This is the class of the main professor at the institute

plot(charles)
# Use this function to draw your first plot
```

|||

## Add a line + Title

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

## Add another class

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

## Automate the limits and label axes

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

## Cleanup

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

## Adding a legend

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
              col=c("gray","red"), pch=4:22, lty=1:2);
	      # Adds a legend. What are the first 2 arguments?
	      # What does "cex" do?
	      # Check the "pch" numbers too
```

|||

## New axes

```R
charles = c(12, 11, 12, 12, 13)
scott = c(2, 3, 3, 15, 15)

st_range = range(0, charles, scott)

plot(charles, type="o", col="gray", ylim=st_range, pch="x", ann=FALSE, axes=FALSE)
# Remove the axes. Careful!

axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
# Adds an X axis (1).
# What do "at" and "lab" do?

axis(2, at=4*0:st_range[2])
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

## Getting data from an external file
