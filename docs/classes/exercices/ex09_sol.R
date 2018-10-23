## Exercises 4 solutions

# 1.1
value_double = function(x) {
    return(x * 2)
}

print(value_double(9))
print(value_double(6.5))

# 1.2
significance = function(p_value, alpha) {
    if (p_value < alpha) {
        msg = "H0 should be rejected."
    } else {
        msg = "H0 should not be rejected."
    }
    return(msg)
}

print(significance(0.01, 0.05))
print(significance(0.07, 0.05))

# 1.3
repeater = function(words) {
    for (w in words) {
        two_words = paste(w, w, sep=" ")
        print(two_words)
    }
}

repeater(c("Three", "Test", "Words"))

# 2.1
male_data = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdDU5SnRoQ0xlZWhwRUZ6RFNQV042enc&output=csv"), header=TRUE, row.names=1)
female_data = read.csv(url("http://docs.google.com/spreadsheet/pub?key=0ArfEDsV3bBwCdGJHcHZkSUdBcU56aS1OT3lLeU4tRHc&output=csv"), header=TRUE, row.names=1)

cholesterol_tests = function(male_chol, female_chol, alpha) {
    res = t.test(x=male_chol, y=female_chol, conf.level=1-alpha)

    return(res$p.value)
}

p_values = c()
for (i in c("X1980", "X1990", "X2000", "X2008")){
    p_val = cholesterol_tests(male_data[, i], female_data[, i], 0.05)
    p_values = c(p_values, p_val)
}

print(p.adjust(p_values, method="fdr"))

# 2.2
looper = function (years, alpha) {
    p_values = c()
    for (i in years) {
        p_val = cholesterol_tests(male_data[, i], female_data[, i], alpha)
        p_values = c(p_values, p_val)
    }
    adj_pvals = p.adjust(p_values, method="fdr")
    return(adj_pvals)
}

print(looper(c("X1983", "X1992", "X1998", "X2003", "X2005"), 0.05))

# 2.3
# Yes!

# 3.1
diatoms_data = read.csv(url("https://raw.githubusercontent.com/StuntsPT/BP2017/master/classes/C1_assets/Dados_diatoms_heavymetals.csv"), header=TRUE)

diatoms_regression = function (x, y, file_name, xlab, ylab) {
    cor_results = cor.test(x=x, y=y, methos="pearson", conf.level=0.95)
    png(filename=file_name)
    plot(x=x,
         y=y,
         col="brown",
         ylab=ylab,
         xlab=xlab,
         main="Diatoms data scatterplot with regression line")
    abline(lm(y ~ x), col="blue", lwd=3)
    dev.off()

    return(c(cor_results$p.value, cor_results$estimate * cor_results$estimate))
}

print(diatoms_regression(diatoms_data$Zn, diatoms_data$Diversity, "~/corrplot1.png", ylab="Species diversity", xlab="Zn concentration"))

# 3.2
print(diatoms_regression(diatoms_data$Zn, diatoms_data$Richness, "~/corrplot2.png", ylab="Species richness", xlab="Zn concentration"))