#data
data <- read.csv('bs_data_analysis2.csv')
head(data)
lhs <- data$lhs2
close.trust <- data$close.trust2
all <- data$all2


#一般方法且只加入inter
fit <- lm(lhs ~ close.trust*all)
summary(fit)


#plots                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
#install.packages("rockchalk")
library(rockchalk)
plotSlopes(fit, plotx="close.trust", modx="all")



#一般方法且加入inter与自变量调节变量
fit_all <- lm(lhs ~ all + close.trust + all*close.trust)
summary(fit_all)
plotSlopes(fit_all, plotx="close.trust", modx="all")




#lavaan
data1 <- read.csv('bs_data_analysis2.csv')
inter1 <- data1$all2 * data1$close.trust2
data1 <- data.frame(data1$all2, data1$close.trust2, data1$lhs2, inter)
head(data1)

model <- readLines('model.txt')
model

#install.packages("lavaan")
library(lavaan)
fit_model <- sem(model=model, data=data1, se='bootstrap', bootstrap=3000)
summary(fit_model, standardized=TRUE, ci=TRUE, rsquare=TRUE, estimates=TRUE)

library(semPlot)
semPaths(fit_model, what='std')