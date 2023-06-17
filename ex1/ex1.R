library(rio)
library(ggplot2)

# Carregamento dos dados
econ <- import("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/econ.xlsx")

# Filtragem dos dados por data
econ <- subset(econ, as.Date(econ$tempo) >= as.Date("1987-01-01"))

# Variáveis a utilizar
X1 <- econ$gcp
X2 <- econ$tpp

# Transformação aos dados
Z1 <- (X1 - mean(X1)) / sd(X1)
Z2 <- (X2 - mean(X2)) / sd(X2)

# Dados para a construção do gráfico
df <- data.frame(econ$tempo, X1, X2)

# Construção do gráfico
dev.new()
ggplot(data = df, mapping = aes(x = econ$tempo)) +
  geom_line(aes(y = Z1, color = "Gastos de consumo pessoal\n(biliões de dólares)")) +
  geom_line(aes(y = Z2, color = "Taxa de poupança pessoal")) +
  scale_color_manual("", values = c("red", "blue")) +
  labs(x = "Tempo", y = "Dados transformados",
       title = "Evolução dos gastos de consumo pessoal e da taxa de poupança pessoal a partir de 1987")
