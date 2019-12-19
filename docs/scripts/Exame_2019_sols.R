## Exercicio 1
# a)
costal_phytoplankton = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/exam_data/phyto_costal.csv", header=T, sep=";", row.names=1)
offshore_phytoplankton = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/exam_data/phyto_offshore.csv", header=T, sep=";", row.names=1)


plankton_plotter = function(datafile, title, save_file) {
  y_limits = range(datafile)
  png(filename=save_file, width=1200, height=800)
  plot(datafile[, 1],
       ylim=y_limits,
       type="l",
       lwd=3,
       col=1,
       axes=F,
       xlab="Year",
       ylab="Phytoplankton annual mean biovolume (MgL/L)",
       main=title)
  
  axis(1, at=1:length(row.names(datafile)), labels=row.names(datafile))
  axis(2, at=seq(y_limits[1], y_limits[2], length.out=6))
  
  for (i in 2:length(datafile)) {
    lines(datafile[i], lwd=3, col=i)
  }
  
  legend("topright", legend=colnames(datafile), lty=1, lwd=3, col=1:length(colnames(datafile)))
  dev.off()
}

plankton_plotter(costal_phytoplankton, "Costal phytoplankton [] across years", "~/lineplot_plankton_costal.png")
plankton_plotter(offshore_phytoplankton, "Offshore phytoplankton [] across years", "~/lineplot_plankton_offshore.png")

# These plots show how the [] of each plankton category evolves across the studied range.


# b) (prova A)
shapiro.test(as.numeric(costal_phytoplankton["2001",]))
shapiro.test(as.numeric(costal_phytoplankton["2000",]))
t.test(x=as.numeric(costal_phytoplankton["2001",]), y=as.numeric(costal_phytoplankton["2000",]), paired=T)

# b) (prova B)
shapiro.test(as.numeric(offshore_phytoplankton["2001",]))
shapiro.test(as.numeric(offshore_phytoplankton["2000",]))
t.test(x=as.numeric(offshore_phytoplankton["2001",]), y=as.numeric(offshore_phytoplankton["2000",]), paired=T)

# The upwelling event did not affect the plankton [].


# c)
small_costal_phytoplankton = costal_phytoplankton[as.character(1994:2011),]

png(filename="~/scatterplot_plankton.png", width=1000, height=1000)
plot(x=as.matrix(small_costal_phytoplankton),
     y=as.matrix(offshore_phytoplankton),
     main="Costal plankton [] Vs. Offshore plankton []",
     ylab="Offshore plankton []",
     xlab="Costal plankton []")
model = lm(as.matrix(offshore_phytoplankton) ~ as.matrix(small_costal_phytoplankton))
abline(model, lwd=3, col="blue")
dev.off()

# d)
shapiro.test(as.matrix(small_costal_phytoplankton))
shapiro.test(as.matrix(offshore_phytoplankton))
cor.test(x=as.matrix(small_costal_phytoplankton), y=as.matrix(offshore_phytoplankton), method="spearman")

# There is a significant (p >= 0.05) correlation between the costal and offshore plankton [].
# Since the Rho is relatively high (0.851), it means that it is possible to make a somewhat
# accurate inference of the costal planktotn [] from the offshore plankton [] and vice versa.


## Exercicio 2

bees_data = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/exam_data/bee_size.tsv", header=T, sep="\t", row.names=1)  # (Prova A)
bees_data = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/exam_data/bee_categories.tsv", header=T, sep="\t", row.names=1)  # (Prova B)

# a)
bee_counts = table(bees_data)
print(bee_counts)

# b)
png(filename="~/barplot_bees.png", width=1000, height=1000)
barplot((bee_counts),
        col=c(1:4),
        ylim=c(0, max(bee_counts) * 1.1),
        main="A. flavipes size category counts",
        ylab="Number of individuals",
        xlab="Size category",
        las=1)
dev.off()

# c)
obs = as.numeric(bee_counts)
exp = c(2/9, 1/9, 4/9, 2/9)

chisq.test(x=obs, p=exp)

p_vals = c()

for (i in 1:length(obs)) {
  partial_obs = c(obs[i], sum(obs[-i]))
  partial_exp = c(exp[i], sum(exp[-i]))
  part_chisq = chisq.test(x=partial_obs, p=partial_exp)
  
  p_vals[i] = part_chisq$p.value
}

print(p_vals)
p.adjust(p_vals, method="fdr")

# The total Chi² test revelaed that there are significant differences between the original bees' size categores porportions and the current ones (p < 0.05)
# A: The partial Chi² test revealed that the size category "Large" has a different porportion from that of the original population
# B: The partial Chi² test revealed that the size categories "Large" and "Huge" have a different porportion from those of the original population

# d)

# 1. General Chi²: There are no significant differences between the porportions of current population size categories and those of the original populations
# 2. Partial Chi² 1: There are no significant differences between the porportions of current population small bees and those of the original populations
# 3. Partial Chi² 2: There are no significant differences between the porportions of current population medium bees and those of the original populations
# 4. Partial Chi² 3: There are no significant differences between the porportions of current population large bees and those of the original populations
# 5. Partial Chi² 4: There are no significant differences between the porportions of current population huge bees and those of the original populations


## Exercicio 3
petrels = read.csv("https://gitlab.com/StuntsPT/bp2019/raw/master/docs/exam_data/petrels.csv", header=T, sep=",", row.names=1)

# a)
length(unique(petrels[, "Origin"]))
length(unique(petrels[, "Measurer"]))

# b)
library(pcaMethods)

petrels_pca = pca(petrels[, -c(1:8)], scale="vector", method="nipals", center=T, nPcs=2)
petrel_classes = factor(petrels[, "Species"])
petrel_colours = factor(petrels[, "Species_colours"])

png(filename="~/PCA_scores_petrels.png", width=1000, height=1000)
slplot(petrels_pca,
       scol=petrel_colours,
       sl=NULL,
       spch="x",
       scoresLoadings=c(TRUE,FALSE))

legend("topright", legend=levels(petrel_classes), pch="x",
       col=levels(petrel_colours), cex=0.8)
dev.off()

# It is notpossible to accurately determine of which species the individual “TP21631” belongs to, based on this PCA,
# since it is located in an area of the plot where individuals from both species can be found.


# c)
png(filename="~/PCA_loadings_petrels.png", width=1000, height=1000)
slplot(petrels_pca,
       scoresLoadings=c(FALSE,TRUE))
dev.off()

# "EarCovertColour" is a good variable to discern samples along PC1, which is the PC that can somewaht discern between species.

shapiro.test(petrels[petrels[,"Species"] == "P.georgicus", "EarCovertColour"])
shapiro.test(petrels[petrels[,"Species"] == "P.whenuahouensis", "EarCovertColour"])
wilcox.test(x=petrels[petrels[,"Species"] == "P.georgicus", "EarCovertColour"],
            y=petrels[petrels[,"Species"] == "P.whenuahouensis", "EarCovertColour"])

# According to the performed Wilcoxon test, the values of this variable are significantly different between *P. georgicus* and *P. whenuahouensis*.

# d)
petrel_classes = factor(petrels[, "Measurer"])
petrel_colours = factor(petrels[, "Measurer_colours"])

png(filename="~/PCA_scores_petrels_measurers.png", width=1000, height=1000)
slplot(petrels_pca,
       scol=petrel_colours,
       sl=NULL,
       spch="x",
       scoresLoadings=c(TRUE,FALSE))

legend("topright", legend=levels(petrel_classes), pch="x",
       col=levels(petrel_colours), cex=0.8)
dev.off()

# The PCA using the measurer as a discrimnant reveals that individuals show up grouped by measurer.
# This can be indicative of observer bias.