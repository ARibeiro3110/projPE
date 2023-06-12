set.seed(1895)
σ <- sqrt(4)
μ0 <- 78.5
α <- 0.08

m <- 100
n <- 21
μ <- 79.7

cont <- 0
for (i in 1:m) {
  X <- rnorm(n, mean = μ, sd = σ)
  
  # Teste de hipóteses para a média, supondo σ^2 conhecido
  media_amostral <- mean(X)
  t0 <- (media_amostral - μ0) / (σ / sqrt(n))
  b <- qnorm(1 - α/2)
  if (-b <= t0 && t0 <= b) {
    cont <- cont + 1
  }
}

round(cont/m, 3)
