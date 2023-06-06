# 1. P(X = 1 || X = 8) = P(X = 1) + P(X = 8)
probabilidade <- log10(1+1/1) + log10(1+1/8)

# 2.
ocorrencias <- 0
for (n in 3:22) {
  p <- 2**n
  while (p >= 10) {
    p = p %/% 10
  }
  if (p == 1 || p == 8)
    ocorrencias = ocorrencias + 1
}

fracao <- ocorrencias / (22 - 3 + 1)

# 3. e 4.
desvio_absoluto <- round(abs(probabilidade - fracao), 4)

desvio_absoluto
