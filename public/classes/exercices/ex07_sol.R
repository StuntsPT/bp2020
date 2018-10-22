# Exercises 2 possible solutions

magic_beans = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/exercices/Magic_beans_lower.csv"), header=TRUE, row.names=1)

# Size category
size_category_counts = data.frame(table(magic_beans$size.category))

barplot(height=size_category_counts$Freq,
        width=c(3,2,1),
        names.arg=size_category_counts$Var1,
        col="red",
        ylab="Magic beans",
        xlab="Size category",
        main="Magic bean counts per size category")

# Colours
colour_counts = data.frame(table(magic_beans$colour))

barplot(height=colour_counts$Freq,
        width=1,
        names.arg=colour_counts$Var1,
        col=as.vector(colour_counts$Var1),
        ylab="Magic beans",
        xlab="Colour category",
        main="Magic bean counts per colour")

# Hypothesis tests
# 2.1:
colour_expectations = c(1/6,1/6,1/6,1/6,1/6,1/6)
colour_observations = as.vector(colour_counts$Freq)
chisq.test(x=colour_observations, p=colour_expectations)

# H0: The obsrved colour distribution is not different from the expectation of 1:1:1:1:1:1.
# The Chi² test indicates that there are significant deviations from the expected distribuition

# 2.2
p_vals = c()
for (i in 1:length(colour_expectations)) {
    partial_obs = c(colour_observations[i], sum(colour_observations[-i]))
    partial_exp = c(colour_expectations[i], sum(colour_expectations[-i]))

    partial_chisq = chisq.test(x=partial_obs, p=partial_exp)

    p_vals[i] = partial_chisq$p.value
    }

q_values = p.adjust(p_vals, method="fdr")
# According to the q-values, assuming alpha==0.05, only the green beans are not significantly different from the expected proportion.

# 2.3
library("XNomial")
xmulti(obs=table(magic_beans$size.category[magic_beans$colour == "red"]), expr=c(1,1,1))
# The multinomial test indicates that the red beans' size categories are not significantly different from the expectation of 1:1:1

# 2.4
chisq.test(table(magic_beans))
# H0: The bean colour does not influence the distribution of the size categories
# The Chi² test does not reject H0, therefore independence between colour and size category prportions is assumed.

# 2.5
library("XNomial")
xmulti(obs=c(89,322,16), expr=c(5,15,1))
# The porportions of troop types aboard the Imperial Star Destroyer are not significantly different fro what is expected for a ground strike.
# The rebel base should deploy defences to react to a ground assault.

## Regression

# 3.1
plot(x=faithful$eruptions,
     y=faithful$waiting,
     col="brown",
     ylab="waiting time (in seconds)",
     xlab="eruption duration (in seconds)",
     main="Geyser eruption duration Vs. interval before the eruption")

# 3.2
cor.test(x=faithful$eruptions, y=faithful$waiting, methos="pearson", conf.level=0.95)
# The strength of the correlation "r" is 0.9008112. It is significant (p-value < 2.2e-16)

# 3.3
abline(lm(faithful$waiting ~ faithful$eruptions), col="blue", lwd=3)