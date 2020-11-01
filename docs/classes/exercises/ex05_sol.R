## Exercises 1 possible solutions

# Data loading, basic statistics and plots
# 2.
male_chol = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdDU5SnRoQ0xlZWhwRUZ6RFNQV042enc&output=csv"), header=TRUE, row.names=1)
female_chol = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdGJHcHZkSUdBcU56aS1OT3lLeU4tRHc&output=csv"), header=TRUE, row.names=1)

# 3.
male_means = apply(male_chol, 2, mean)
male_medians = apply(male_chol, 2, median)

female_means = apply(female_chol, 2, mean)
female_medians = apply(female_chol, 2, median)

# Option 1
names(male_chol) = sub("^X", "", names(male_chol))
years = names(male_chol)
# Alternative
# years = c(1980:2008)
plot(x=years,
     y=male_means,
     type="l",
     col="red",
     lwd=2,
     ylim=c(min(male_means, male_medians)* 0.99, max(male_means, male_medians)* 1.01),
     axes=FALSE,
     main="Mean Cholesterol concentration in male patient's blood, from 1980 to 2008",
     ylab="Cholesterol concentration (mmol/L)",
     xlab="Years")
axis(1, at=years)
axis(2, at=round(seq(min(male_means, male_medians) * 0.99, max(male_means, male_medians) * 1.01, 0.03), 2), las=1)
lines(x=names(male_chol),
      y=male_medians,
      type="l",
      col="blue",
      lwd=2)
legend("topright",
       inset=.05, title="Central tendency measurement",
       c("Mean", "Median"),
       lwd=2, col=c("red", "blue"))

# Option 1
names(female_chol) = sub("^X", "", names(female_chol))
years = names(female_chol)
# Alternative
# years = c(1980:2008)
plot(x=years,
     y=female_means,
     type="l",
     col="purple",
     lwd=2,
     axes=FALSE,
     ylim=c(min(female_means, female_medians)* 0.99, max(female_means, female_medians)* 1.01),
     main="Mean Cholesterol concentration in female patient's blood, from 1980 to 2008",
     ylab="Cholesterol concentration (mmol/L)",
     xlab="Years")
axis(1, at=years)
axis(2, at=round(seq(min(female_means, female_medians) * 0.99, max(female_means, female_medians) * 1.01, 0.03), 2), las=1)
lines(x=names(female_chol),
      y=female_medians,
      type="l",
      col="cyan",
      lwd=2)
legend("topright",
       inset=.05, title="Central tendency measurement",
       c("Mean", "Median"),
       lwd=2, col=c("purple", "cyan"))

# Hypothesis tests

# 1.
# Get t-test p-values
# Can also be done with a for loop, for less typing. But let's just leave it at
# that for now.
p_values = c()
p_values = c(p_values, t.test(x=male_chol$`1980`, y=female_chol$`1980`)$p.value)
p_values = c(p_values, t.test(x=male_chol$`1985`, y=female_chol$`1985`)$p.value)
p_values = c(p_values, t.test(x=male_chol$`1990`, y=female_chol$`1990`)$p.value)
p_values = c(p_values, t.test(x=male_chol$`2000`, y=female_chol$`2000`)$p.value)
p_values = c(p_values, t.test(x=male_chol$`2008`, y=female_chol$`2008`)$p.value)

# Correct for multiple testing
p.adjust(p=p_values, method="fdr")

# 2.
# Paired sample t-test
t.test(x=male_chol$`1980`, y=male_chol$`2008`, paired=TRUE)
t.test(x=female_chol$`1980`, y=female_chol$`2008`, paired=TRUE)

# 3.
# Mr. Anderson problem
shapiro.test(male_chol$`1999`)

wilcox.test(x=male_chol$`1999`, mu=3.6666, conf.level=0.99)

# H0: Mr. Anderson's cholesterol levels are not different from our 1999 sample.
# Wilcoxon's test p-value was below the defined threshold of 0.01, meaning
# that there are significant differences between Mr. Anderson's cholesterol
# levels and those of the 1999 sample. Therefore, H0 is rejected.
# This suggests that Mr. Anderson is, in fact, "The One".
