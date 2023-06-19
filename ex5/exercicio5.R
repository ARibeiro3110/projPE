set.seed(1032)
p <- 0.45
n <- 1153

vetor <- rep(-1, n)

for (i in 1:n) {
  u <- runif(1, 0, 1)
  
  x <- 0
  while (TRUE) {
    a <- pgeom(x - 1, p, lower.tail = TRUE, log.p = FALSE)
    b <- pgeom(x, p, lower.tail = TRUE, log.p = FALSE)
    if (a < u && u <= b) {
      vetor[i] = x
      break
    }
    x <- x + 1
  }
}

media <- mean(vetor)
desvio_padrao <- sd(vetor)

valores_superiores_media <- vetor[vetor > media]

valores_final <- valores_superiores_media[valores_superiores_media > (media + desvio_padrao)]

proporcao <- round(length(valores_final) / length(valores_superiores_media), 4)

proporcao
