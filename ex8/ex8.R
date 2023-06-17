# Configurar a semente
set.seed(1208)

# Parâmetros da distribuição de Cauchy
α <- 2.8
β <- 2

# Tamanho da amostra
n <- 163

# Parâmetros da distribuição normal
μ <- 0.5
σ <- sqrt(1.4)

# Calcular as probabilidades dos quantis
q <- seq(1, n) / (n + 1)

# Gerar a amostra e ordenar
amostra_cauchy <- sort(rcauchy(n, location = α, scale = β))

# Quantis da distribuição de Cauchy
quantis_cauchy <- qcauchy(q, location = α, scale = β)

# Quantis da distribuição Normal
quantis_normal <- qnorm(q, mean = μ, sd = σ)

# Criar o gráfico
dev.new()
plot(quantis_cauchy, amostra_cauchy, col = "blue", pch = 19,
     xlab = "Quantis de probabilidade",
     ylab = "Amostra ordenada",
     main = "Gráfico Q-Q de uma amostra de uma população com distribuição de Cauchy
para distribuições Normal e de Cauchy")

points(quantis_normal, amostra_cauchy, col = "red", pch = 19)
abline(0, 1, col = "green")
legend("bottomright", legend = c("Cauchy", "Normal"), col = c("blue", "red"), pch = 19)
