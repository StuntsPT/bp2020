# Display the Student's t distributions with various
# degrees of freedom and compare to the normal distribution

x <- seq(-4, 4, length=100)
hx <- dnorm(x)

degf <- c(1, 3, 8, 30)
colors <- c("red", "blue", "darkgreen", "gold", "black")
labels <- c("df=1", "df=3", "df=8", "df=30", "normal")

plot(x, hx, type="l", lty=2, xlab="x value",
     ylab="Density", main="Comparison of t Distributions")

for (i in 1:4){
    lines(x, dt(x,degf[i]), lwd=2, col=colors[i])
}

legend("topright", inset=.05, title="Distributions",
       labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)

#########
# Normal dist with alpha=0.05

set.seed(1)
draws <- rnorm(1E7)
dens <- density(draws)
plot(dens)
q0 <- quantile(draws, 0)
q025 <- quantile(draws, .025)
q975 <- quantile(draws, .975)
q1000 <- quantile(draws, 1)
x1 <- min(which(dens$x >= q0))
x2 <- max(which(dens$x <  q025))
x3 <- min(which(dens$x >= q975))
x4 <- min(which(dens$x >= q1000))
with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))
with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="gray"))
labels = c("alpha=0.05")
legend("topright", inset=.05, title="Distributions",
       labels, lwd=2, lty=c(1), col=c("grey"))

###########
# Single sample
# t-test

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
ph = diatoms$pH

shapiro.test(ph)

t.test(ph, mu=7, conf.level=0.95)
t.test(ph, mu=7.7, conf.level=0.95)

# Wilcoxon test

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
zn = diatoms$Zn

shapiro.test(zn)

wilcox.test(zn, mu=5000, alternative="less")
wilcox.test(zn, mu=10, alternative="greater")

###################
# 2 samples
# t-test

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
north_rivers_doxy = diatoms$Doxy[diatoms$Stream == "ER" | diatoms$Stream == "BR" | diatoms$Stream == "SR"]
south_rivers_doxy = diatoms$Doxy[diatoms$Stream == "AR" | diatoms$Stream == "CC" | diatoms$Stream == "SPR"]

shapiro.test(north_rivers_doxy)
shapiro.test(south_rivers_doxy)

t.test(x=north_rivers_doxy, y=south_rivers_doxy, conf.level=0.95)

# Man-Withney

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
north_rivers_alk = diatoms$Alk[diatoms$Stream == "ER" | diatoms$Stream == "BR" | diatoms$Stream == "SR"]
south_rivers_alk = diatoms$Alk[diatoms$Stream == "AR" | diatoms$Stream == "CC" | diatoms$Stream == "SPR"]

shapiro.test(north_rivers_alk)
shapiro.test(south_rivers_alk)

wilcox.test(x=north_rivers_alk, y=south_rivers_alk, conf.level=0.95)

###################
# 2 dependent samples
# t-test

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
ph = diatoms$pH

ph2017 = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/diatoms_ph_2017.csv"))$pH

shapiro.test(ph)
shapiro.test(ph2017)

t.test(x=ph, y=ph2017, paired=TRUE, conf.level=0.95)

# Wilcoxon

diatoms = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"))
ph = diatoms$pH

ph2017 = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/diatoms_ph_2017.csv"))$pH

shapiro.test(ph)
shapiro.test(ph2017)

wilcox.test(x=ph, y=ph2017, paired=TRUE, conf.level=0.95)