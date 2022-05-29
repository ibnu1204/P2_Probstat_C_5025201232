#Soal 1
n = 9
Responden = c(seq(1:9))
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
Data = data.frame(Responden, x, y)

#1a
diff = Data$y - Data$x
standardev = sd(diff)
standardev

#1b
t.test(x, y, alternative = "greater", var.equal = FALSE)

#1c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)

#Soal 2
install.packages("BSDA")
library(BSDA)

mu = 20000
n = 100
xbar = 23500
standardev = 3900

tsum.test(mean.x = xbar, s.x = standardev, n.x = n, mu = mu, 
          alternative = "greater", var.equal = TRUE)

#2a
#Di README

#2b
#Di README

#2c
#Di README

#Soal 3
n_bdg = 19
n_bl = 27
mu_bdg = 3.64
mu_bl = 2.79
standardev_bdg = 1.67
standardev_bl = 1.32

#3a
#Di README

#3b
tsum.test(n.x = n_bdg, mean.x = mean_bdg, s.x = standardev_bdg,
          n.y = n_bl, mean.y = mean_bl, s.y = standardev_bl,
          alternative = "greater", var.equal = TRUE)

#3c
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2)

#3d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#3e
#Di README

#3f
#Di README

#Soal 4
dataset  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(dataset)
head(dataset)
attach(dataset)

#4a
dataset$V1 <- as.factor(dataset$V1)
dataset$V1 = factor(dataset$V1, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih", "Kucing Oren"))

class(dataset$V1)
group1 <- subset(dataset, V1 == "Kucing Oren")
group2 <- subset(dataset, V1 == "Kucing Hitam")
group3 <- subset(dataset, V1 == "Kucing Putih")

#4b
bartlett.test(Length~V1, data = dataset)

#4c
qqnorm(group1$Length)
qqline(group1$Length)

#4d
#Di README

#4e
model1 <- lm(Length~Group, data=dataset)
anova(model1)
TukeyHSD(aov(model1))

#4f
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")

#Soal 5
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

#5a
GTL <- read_csv("GTL.csv")
head(GTL)
str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + 
      facet_grid(.~Glass, labeller = label_both)

#5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova_test <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova_test)

#5c
data_table <- group_by(GTL, Glass, Temp) %>% summarise(mean = mean(Light), 
            sd = sd(Light)) %>% arrange(desc(mean))
print(data_table)

#5d
tukey_test <- TukeyHSD(anova_test)
print(tukey_test)

#5e
tukey_test.cldData <- multcompLetters4(anova_test, tukey_test)
print(tukey_test.cldData)

cld <- as.data.frame.list(tukey_test.cldData$`Glass:Temp_Factor`)
data_table$tukey_test <- cld$Letters
print(data_table)

write.csv("GTL_summary.csv")
