set.seed(1430)
m <- 2298
n <- 19
quantil <- 0.69

somas_quadrados <- numeric(m)

for (i in 1:m) {
  amostra <- rnorm(n)
  somas_quadrados[i] <- sum(amostra^2)
}

quantil_amostra <- quantile(somas_quadrados, probs = quantil, type = 2)
quantil_teorico <- qchisq(quantil, df = n)

diferenca <- round(abs(quantil_amostra - quantil_teorico), 4)

diferenca
