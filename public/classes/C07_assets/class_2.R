# Class 2 data
# Chi² dists

x <- seq(0, 60, length=100)
hx <- dchisq(x, df=1)

degf <- c(1, 3, 8, 15, 30)
colors <- c("black", "red", "blue", "darkgreen", "gold")
labels <- c("df=1", "df=3", "df=8", "df=15", "df=30")

plot(x, hx, type="l", lwd=2, xlab="x value",
     ylab="Density", main="Comparison of Chi² Distributions")

for (i in 1:5){
    lines(x, dchisq(x,degf[i]), lwd=2, col=colors[i])
}

legend("topright", inset=.05, title="Distributions",
       labels, lwd=2, col=colors)

####

# Chi² example 1

obs = c(2235, 2301)
exp = c(0.5, 0.5)

chisq.test(x=obs, p=exp)

###

# Multiple Chi² tests

p_vals = c()

obs = c(1300, 3000, 1500)
exp = c(0.25, 0.5, 0.25)

chisq.test(x=obs, p=exp)

for (i in 1:length(obs)) {
    partial_obs = c(obs[i], sum(obs[-i]))
    partial_exp = c(exp[i], sum(exp[-i]))
    part_chisq = chisq.test(x=partial_obs, p=partial_exp)

    p_vals[i] = part_chisq$p.value
}

print(p_vals)
p.adjust(p_vals, method="fdr")

##############
# Exact tests

# example binomial distribution

trials = 10
prob = 0.5

x = seq(0, trials)                   # x is a sequence, 1 to trials
y = dbinom(x, size=trials, p=prob)   # y is the vector of heights

barplot (height=y,
         names.arg=x,
         xlab="Number of heads",
         ylab="Probability under null hypothesis")

# Binomial vs Chi²

obs = c(3, 11)
exp = c(0.5, 0.5)

chisq.test(x=obs, p=exp)

binom.test(x=obs[1], n=sum(obs), p=exp[1], conf.level=0.95)

# Multinomial test

if(!require("XNomial")){
    install.packages("XNomial")
    library("XNomial")
}

obs = c(4, 27, 12)
exp = c(0.25, 0.5, 0.25)

chisq.test(x=obs, p=exp)

xmulti(obs=obs, expr=exp)

#####
# Independence tests
# Chi²

R1 = c(4682, 30)
R2 = c(8813, 76)

side_effects_matrix = matrix(c(R1, R2),
                             nrow=2,
                             byrow=TRUE)

# Naming if not mandatory:
rownames(side_effects_matrix) = c("Night", "Morning")
colnames(side_effects_matrix) = c("No.side.effects",
                     "Side.effects")


chisq.test(side_effects_matrix,
           correct=TRUE)

# Fischer's exact test

text_input =("
Frequency  Dead  Alive
Daily       1        24
Weekly      5        20
Monthly    14        11
Quarterly  11        14
")

small_samples_matrix = as.matrix(read.table(textConnection(text_input),
                                 header=TRUE,
                                 row.names=1))

fisher.test(small_samples_matrix,
            alternative="two.sided")


##################################
# Regression
# Class plot

height <- c(176, 154, 138, 196, 132, 176, 181, 169, 150, 175)
bodymass <- c(82, 49, 53, 112, 47, 69, 77, 71, 62, 78)

plot(bodymass, height)

plot(bodymass, height, pch = 16, cex = 1.3, col = "blue",
     main = "HEIGHT PLOTTED AGAINST BODY MASS",
     xlab = "BODY MASS (kg)",
     ylab = "HEIGHT (cm)")

abline(lm(height ~ bodymass))


#### Example 1
# Correlation and regressionSpecies
Input = ("
Town                  State  Latitude  Species
'Bombay Hook'          DE     39.217    128
'Cape Henlopen'        DE     38.800    137
'Middletown'           DE     39.467    108
'Milford'              DE     38.958    118
'Rehoboth'             DE     38.600    135
'Seaford-Nanticoke'    DE     38.583     94
'Wilmington'           DE     39.733    113
'Crisfield'            MD     38.033    118
'Denton'               MD     38.900     96
'Elkton'               MD     39.533     98
'Lower Kent County'    MD     39.133    121
'Ocean City'           MD     38.317    152
'Salisbury'            MD     38.333    108
'S Dorchester County'  MD     38.367    118
'Cape Charles'         VA     37.200    157
'Chincoteague'         VA     37.967    125
'Wachapreague'         VA     37.667    114
")

Data = read.table(textConnection(Input),header=TRUE)

# Plot the data
plot(Species ~ Latitude,
     data=Data,
     pch=16,
     xlab = "Latitude",
     ylab = "Species")

# Correlation
cor.test( ~ Species + Latitude,
          data=Data,
          method = "pearson",
          conf.level = 0.95)

# Regression
model = lm(Species ~ Latitude,
           data = Data)

summary(model)

# Plot it
int =  model$coefficient["(Intercept)"]
slope =model$coefficient["Latitude"]

plot(Species ~ Latitude,
     data = Data,
     pch=16,
     xlab = "Latitude",
     ylab = "Species")

abline(int, slope,
       lty=1, lwd=2, col="blue")