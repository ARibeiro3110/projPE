set.seed(4318)
lambda <- 15.5
k <- 2055
X <- rexp(k, rate = lambda)

S <- cumsum(X)
T <- ceiling(S[k])

eventos_por_intervalo <- numeric(T)
for (s in S) {
  eventos_por_intervalo[ceiling(s)] = eventos_por_intervalo[ceiling(s)] + 1
}

media_eventos <- mean(eventos_por_intervalo)

valor_esperado <- lambda # 1/(1/lambda)

desvio_absoluto <- round(abs(media_eventos - valor_esperado), 4)

desvio_absoluto
