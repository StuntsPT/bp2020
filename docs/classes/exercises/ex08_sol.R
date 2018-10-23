## Exercises 3 solutions

# 1.1
war_data = read.csv(url("https://raw.githubusercontent.com/chrisalbon/war_of_the_five_kings_dataset/master/5kings_battles_v1.csv"), header=TRUE, row.names=1)

# 1.2
barplot(table(war_data$region),
        col="darkred",
        ylab="No. of Battles",
        xlab="Regions",
        main="Locations of battles during the 'War of 5 Kings'")

# 1.3
outcomes = as.matrix(table(war_data$attacker_outcome))

binom.test(x=outcomes[3,], n=sum(outcomes[2:3,]), p=9/10)

# H0: The ratio of attacking force victories during the 'War of 5 Kings' is not significantl different from the expected odds of 1:10
# The binomial test does not reject H0.

# 1.4
shapiro.test(war_data$attacker_size)
shapiro.test(war_data$defender_size)

wilcox.test(x=war_data$attacker_size, y=war_data$defender_size)

# 1.5
# Since there are no significant differences between attacker and defender army sizes, but the attackers still grab a very large
# proportion of victories, it seems that army size is not determinant regarding battle outcomes. Other factors are likely
# more important to determine battle victors.


# 2.1 & 2.2
plot(hclust(dist(mtcars)),
     main="Dendrogram of 'mtcars' data",
     xlab="Car models")

# 2.3
install.packages("cluster")
library("cluster")

# 2.4
View(plantTraits)

dist_matrix = dist(plantTraits)
cluster = hclust(dist_matrix)

plot(cluster,
     main="Dendrogram of 'plantTraits' data",
     xlab="Plants")

# 2.5
dist_matrix = dist(plantTraits[plantTraits[, "height"] > 6,])
cluster = hclust(dist_matrix)

plot(cluster,
     main="Dendrogram of 'plantTraits' whose height is above '6'",
     xlab="Plants")

# 3.1
SNP_full_data = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/exercises/TLE.str"), header=TRUE, row.names=1, sep=" ")
just_snp_data = SNP_full_data[,3:length(SNP_full_data)]
color_categories = SNP_full_data[,2]
populations = SNP_full_data[,1]

# 3.2
source("https://bioconductor.org/biocLite.R")
biocLite("pcaMethods")
library(pcaMethods)

snp_pca <- pca(just_snp_data, scale="none", center=TRUE, nPcs=2, method="nipals")

slplot(snp_pca,
       scol=color_categories,
       scoresLoadings=c(TRUE,FALSE),
       main="PCA from T. lepidus SNP data")
legend("bottomright", legend=unique(populations), col=unique(color_categories), pch=1)

# 3.3
snp_pca@R2

# PC1 explains ~18% of the total data variance and PC2 explains ~12% of the total data variance.