# Class 3 exercises

*Friendly reminder that you should name your variables sensibly. You **will** be reading this code again.*

## 1. Plotting and previous tests

Once again, the first thing to do is download the data we are about to use. Today you will work with a fantasy setting, in fictional world created by George R. R. Martin - "A Song of Ice and Fire".

Link 1 - [War of the 5 kings](https://raw.githubusercontent.com/chrisalbon/war_of_the_five_kings_dataset/master/5kings_battles_v1.csv).

1. As before, take a look at the data directly in R. Make sure you understand what the data file is about.

2. Make a bar plot of the number of battles per ~~location~~ region (remember the `table` function).

3. Historically, when an army attacks, its commander expects a victory, which means battle odds usually favour the attackers (assume a ratio of 10:1 for attacker victory). Is this also true for the "War of 5 Kings"? Define H0.

4. Are there significant differences between the sizes of the attacking and defending armies?

5. Based on the previous tests, how important do you reckon army sizes are regarding victory odds?

## 2. Exploratory data analyses (Dendrograms)

1. Load the "mtcars" dataset built into R

2. Plot a dendrogram of the full vehicle characteristics

3. Install the package "cluster", load the library and view the dataset "plantTraits"

4. Make a dendrogram of the plant traits.

5. As you have noticed, the dendrogram is too large. Plot the dendrogram, only for plants whose height is larger than "6".
*Hint: `variable[variable[, "column_name"] == value,]` probably does what you want.* 

## 3. Exploratory data analyses (PCA)

Link 2 - [SNP data](https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/exercices/TLE.str)

1. Load the data into R. The file contains SNP data from *T. lepidus* individuals from 3 locations - "Geres", "Montezinho" and "Galiza". 

2. Make a PCA analysis using the SNP data to verify if the "populations" are clustered by location.

3. What % of variation is explained by each Principal Component?
