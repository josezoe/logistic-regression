library(tidyverse)
library(mlogit)
library(DescTools)

# Understanding Flushot dataset

flu=read.csv(choose.files())

longformat=mlogit.data(flu,choice = "Flu",shape="wide")
head(longformat,10)


logitmodel=mlogit(Flu~1|Dosage+Age+Sex,data=longformat)
logitmodel
names(longformat)

summary(logitmodel)

# Call:
#   mlogit(formula = Flu ~ 1 | Dosage + Age + Sex, data = longformat, 
#          method = "nr")
# 
# Frequencies of alternatives:choice
# 0       1 
# 0.61111 0.38889 
# 
# nr method
# 6 iterations, 0h:0m:0s 
# g'(-H)^-1g = 1.16E-06 
# successive function values within tolerance limits 
# 
# Coefficients :
#                Estimate Std. Error z-value Pr(>|z|)   
# (Intercept):1 -22.16517    9.13150 -2.4273 0.015210 * 
# Dosage:1        0.55773    0.19979  2.7916 0.005245 **
# Age:1           0.12644    0.12033  1.0508 0.293369   
# Sex:1           2.56743    1.05086  2.4432 0.014559 * 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Log-Likelihood: -14.231
# McFadden R^2:  0.40846 
# Likelihood ratio test : chisq = 19.653 (p.value = 0.00020033)


