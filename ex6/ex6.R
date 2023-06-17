a <- 1
b <- 8
c <- 3
d <- 22

# 1. P(X = a || X = b) = P(X = a) + P(X = b)
probabilidade <- log10(1+1/a) + log10(1+1/b)

# 2.
ocorrencias <- 0
for (n in c:d) {
  p <- 2^n
  while (p >= 10) {
    p = p %/% 10
  }
  if (p == a || p == b)
    ocorrencias = ocorrencias + 1
}

fracao <- ocorrencias / (d - c + 1)

# 3. e 4.
desvio_absoluto <- round(abs(probabilidade - fracao), 4)

desvio_absoluto
