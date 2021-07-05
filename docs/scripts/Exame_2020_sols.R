## Problem 1

sediment_data = read.csv("https://raw.githubusercontent.com/StuntsPT/BP2020/master/docs/exam_data/soils.csv", header=T, row.names=2)

# a)

for (f in c(min, max, mean, median)) {
  print(apply(sediment_data[,-1], 2, f))
}

# Alternative:
print(apply(sediment_data[,-1], 2, summary))


# b)
# Prova "A"
png(filename="~/Pb.png")
boxplot(Hg ~ Location, data=sediment_data,
        ylab="[Hg] (mg/Kg)",
        xlab="Local",
        main="'Boxplot': [Hg] por local amostrado",
        col=topo.colors(6))
dev.off()

# Prova "B"
png(filename="~/Sp_R.png")
boxplot(Biomass ~ Location,
        data=sediment_data,
        ylab="Nº de espécies",
        xlab="Local",
        main="'Boxplot': Riqueza específica por local amostrado",
        col=topo.colors(6))
dev.off()

# c)
# Prova "A"
poluted_richness = sediment_data$Richness[sediment_data$Location == "Industry01" | sediment_data$Location == "Industry02" | sediment_data$Location == "Industry03"]
natural_richness = sediment_data$Richness[sediment_data$Location == "Control01" | sediment_data$Location == "Control02" | sediment_data$Location == "Control03"]

shapiro.test(poluted_richness)
shapiro.test(natural_richness)

wilcox.test(x=poluted_richness, y=natural_richness)

# Prova "B"
poluted_hg = sediment_data$Hg[sediment_data$Location == "Industry01" | sediment_data$Location == "Industry02" | sediment_data$Location == "Industry03"]
natural_hg = sediment_data$Hg[sediment_data$Location == "Control01" | sediment_data$Location == "Control02" | sediment_data$Location == "Control03"]

shapiro.test(poluted_hg)
shapiro.test(natural_hg)

wilcox.test(x=poluted_hg, y=natural_hg)

# d)
cor_plotter = function(target, y_var, x_var, x_lab, y_lab, title) {
  png(filename=target, width=1000, height=1000)
  plot(x=x_var,
       y=y_var,
       xlab=x_lab,
       ylab=y_lab,
       main=title,
       col="forestgreen")
  abline(lm(y_var ~ x_var,), col="blue", lwd=3)
  dev.off()
  
}
cor_plotter("~/Hg_Biomass.png", sediment_data$Biomass, sediment_data$Hg, "[Hg] (mg/Kg)", "Biomassa", "'Scaterplot': [Hg] Vs. Biomassa")

# e)
cor_plotter("~/As_Richness.png", sediment_data$Richness, sediment_data$As, "[As] (mg/Kg)", "Sp. Richness", "'Scaterplot': [As] Vs. Sp. Richness")


## Problem 2

cvdata = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/exam_data/new_treatment_data.csv",
                  sep=",",
                  row.names=1)

# a)
Control = cvdata[cvdata[,"Group"] == "Control",]
MedH_only = cvdata[cvdata[, "Drug.02"] == "False" & cvdata[, "Drug.01"] == "True", ]
MedH = cvdata[cvdata[,"Drug.01"] == "True",]
MedHA = cvdata[cvdata[, "Drug.02"] == "True", ]

shapiro.test(Control[,"Age"])
shapiro.test(MedH[,"Age"])

wilcox.test(Control[,"Age"], MedH[,"Age"])


# b)
control_pos_evo = apply(Control[,7:13], 2, sum, na.rm=T)
control_pos_evo_porp = control_pos_evo/length(Control[,1])

MedH_only_pos_evo = apply(MedH_only[,7:13], 2, sum, na.rm=T)
MedH_only_pos_evo_porp = MedH_only_pos_evo/length(MedH_only[,1])

MedHA_pos_evo = apply(MedHA[,7:13], 2, sum, na.rm=T)
MedHA_pos_evo_porp = MedHA_pos_evo/length(MedHA[,1])

plot(control_pos_evo_porp,
     type="o",
     lwd=2,
     col="red",
     ylim=c(0,1),
     axes=F,
     xlab="Days after treatment",
     ylab="Percent positive cases",
     main="Positive cases evolution over time")

lines(MedH_only_pos_evo_porp, lwd=2, col="black", type="o")
lines(MedHA_pos_evo_porp, lwd=2, col="forestgreen", type="o")

axis(1, at=1:7, labels = colnames(cvdata[7:13]))
axis(2, at=seq(0,1,0.1), las=1)

legend(1,0.25,
       legend=c("Control", "MedH", "MedHA"),
       pch="_",
       lwd="2",
       col=c("red", "black", "forestgreen"))

# c)
Cont_MedHA = cvdata[cvdata[,"Group"] == "Control" | cvdata[,"Group"] == "MedHA",]
p_vals = c()

for (day in c("D1", "D3", "D5", "D6")) {
  p_val = fisher.test(table(Cont_MedHA[,c(day, "Group")]))$p.value
  p_vals = c(p_vals, p_val)
}

print(p_vals)
print(p.adjust(p_vals, method="fdr"))

# d) H0: The number of positive cases on D1 is independent between groups

## Problem #3

library(pcaMethods)

Centella = read.csv("https://gitlab.com/StuntsPT/bp2020/raw/master/docs/exam_data/centella_traits.tsv", sep="\t", row.names = 1)

# a)
length(Centella[,-c(1,2,3)])

# b)
centella_pca = pca(Centella[,-c(1,2,3)], scale="vector", method = "svd")

for (i in c(1,2,3)) {
  my_categories = unique(Centella[,i])
  col.cat = as.numeric(factor(Centella[,i], levels=my_categories))
  
  slplot(centella_pca,
         scol=col.cat,
         scoresLoadings=c(TRUE, FALSE),
         sl=NULL,
         spch=1,)
  legend("bottomleft",
         legend=my_categories,
         col=unique(as.factor(Centella[,i])),
         pch=1)  
}


# c)
slplot(centella_pca,
       scol=as.factor(Centella[,2]),
       scoresLoadings=c(F, T),
       sl=NULL,
       spch=1)


# d)
# Prova "B"
High_plants = Centella[Centella[,"Altitude"] == "High",]
Low_plants = Centella[Centella[,"Altitude"] == "Low",]

shapiro.test(High_plants[,"LSA"])
shapiro.test(Low_plants[,"LSA"])

wilcox.test(x=High_plants[,"LSA"], y=Low_plants[,"LSA"])
