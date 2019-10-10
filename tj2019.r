#data
data <- read.csv('bs_data_analysis2.csv')
head(data)
lhs <- data$lhs2
close.trust <- data$close.trust2
all <- data$all2


#一般方法且只加入inter
fit <- lm(lhs ~ close.trust*all)
summary(fit)


#plot
library(rockchalk)
plotSlopes(fit, plotx="close.trust", modx="all")



#一般方法且加入inter与自变量调节变量
fit_all <- lm(lhs ~ all + close.trust + all*close.trust)
summary(fit_all)
plotSlopes(fit_all, plotx="close.trust", modx="all")