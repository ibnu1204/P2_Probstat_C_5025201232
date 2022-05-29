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
t.test(x, y, paired = TRUE, var.equal = FALSE)

#1c
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

#2b

#2c

#Soal 3
n_bdg = 19
n_bl = 27
mu_bdg = 3.64
mu_bl = 2.79
standardev_bdg = 1.67
standardev_bl = 1.32

#3a

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

#3f

#Soal 4
#4a

#4b

#4c

#4d

#4e

#4f

#Soal 5
#5a

#5b

#5c

#5d

#5e