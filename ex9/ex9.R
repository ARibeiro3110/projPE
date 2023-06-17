set.seed(1593)
k <- 1000
p <- 0.5
γ <- 0.91
α <- 1 - γ
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
m <- length(n_values)

medias_diferencas <- numeric(length(n_values))

for (i in 1:m) {
  diferencas <- numeric(k)
  n <- n_values[i]
  
  for (j in 1:k) {
    X <- rbinom(n, size = 1, prob = p)
    
    # Método 1
    media <- mean(X)
    z <- qnorm((1 + γ)/2, mean = 0, sd = 1)
    
      ## Resolução da equação de segundo grau:
      a <- (1 + z^2 / n)
      b <- -2 * media - z^2 / n
      c <- media^2
      solucao1 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)
      solucao2 <- (-b + sqrt(b^2 - 4*a*c)) / (2*a)
      comprimento1 <- solucao2 - solucao1
    
    # Método 2
    b_ <- qnorm(1 - α/2, mean = 0, sd = 1)
    limite_inferior <- media - b_ * sqrt( (media * (1 - media)) / n_values[i])
    limite_superior <- media + b_ * sqrt( (media * (1 - media)) / n_values[i])
    comprimento2 <- limite_superior - limite_inferior
    
    # Diferença entre os comprimentos
    diferencas[j] <- comprimento2 - comprimento1
  }
  
  medias_diferencas[i] <- mean(diferencas)
}

# Criar o gráfico
dev.new()
par(mar = c(5, 5, 4, 2))
plot(n_values, medias_diferencas, col = "blue", pch = 19, type = "b",
     xlab = "Tamanho da amostra",
     ylab = "Diferença entre os comprimentos dos intervalos de confiança",
     cex.lab = 1.4, cex.main = 1.5, cex.axis = 1.3, cex = 1.5,
     main = paste("Diferenças médias entre os comprimentos dos intervalos de confiança\n",
                  "construídos pelo Método 2 e pelo Método 1, em função do tamanho da amostra"))
