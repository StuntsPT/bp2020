## Exercises 1 possible solutions

# Data loading, basic statistics and plots

male_chol = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdDU5SnRoQ0xlZWhwRUZ6RFNQV042enc&output=csv"), header=TRUE, row.names=1)
female_chol = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdGJHcHZkSUdBcU56aS1OT3lLeU4tRHc&output=csv"), header=TRUE, row.names=1)

male_means = apply(male_chol, 2, mean)
male_medians = apply(male_chol, 2, median)

female_means = apply(female_chol, 2, mean)
female_medians = apply(female_chol, 2, median)

# Option 1
years = names(male_chol) = sub("^X", "", names(male_chol))
# Alternative
# years = c(1980:2008)
plot(x=years,
     y=male_means,
     type="l",
     col="red",
     lwd=2,
     main="Mean Cholesterol concentration in male patient's blood, from 1980 to 2008",
     ylab="Cholesterol concentration (mmol/L)",
     xlab="Years")
lines(x=names(male_chol),
      y=male_medians,
      type="l",
      col="blue",
      lwd=2)
legend("topright",
       inset=.05, title="Distributions",
       c("Mean", "Median"),
       lwd=2, col=c("red", "blue"))

# Option 1
years = names(female_chol) = sub("^X", "", names(female_chol))
# Alternative
# years = c(1980:2008)
plot(x=years,
     y=female_means,
     type="l",
     col="purple",
     lwd=2,
     main="Mean Cholesterol concentration in female patient's blood, from 1980 to 2008",
     ylab="Cholesterol concentration (mmol/L)",
     xlab="Years")
lines(x=names(female_chol),
      y=female_medians,
      type="l",
      col="cyan",
      lwd=2)
legend("topright",
       inset=.05, title="Distributions",
       c("Mean", "Median"),
       lwd=2, col=c("purple", "cyan"))

# Hypothesis tests

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

# Paired sample t-test
t.test(x=male_chol$`1980`, y=male_chol$`2008`, paired=TRUE)
t.test(x=female_chol$`1980`, y=female_chol$`2008`, paired=TRUE)

# Mr. Anderson problem
shapiro.test(male_chol$`1999`)

t.test(x=male_chol$`1999`, mu=3.6666, conf.level=0.99)

# H0: Mr. Anderson's cholesterol levels are not different from our 1999 sample
# The t-test's p-value was below the defined treshold of 0.01, meaning that
# there are significant differences between Mr. Anderson's cholesterol levels
# and those of the comparable sample. This suggests that Mr. Anderson is,
# in fact, "The One".