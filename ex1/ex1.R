# install.packages("rio")
# install.packages("ggplot2")

library(rio)
library(ggplot2)

econ <- import("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/econ.xlsx")
econ <- subset(econ, as.Date(econ$tempo) >= as.Date("1987-01-01"))

X1 <- econ$gcp
X2 <- econ$tpp

X1 <- (X1 - mean(X1)) / sd(X1)
X2 <- (X2 - mean(X2)) / sd(X2)

df <- data.frame(econ$tempo, X1, X2)

dev.new()
ggplot(data = df, mapping = aes(x = econ$tempo)) +
  geom_line(aes(y = X1, color = "GCP")) +
  geom_line(aes(y = X2, color = "TPP")) +
  scale_color_manual("", values = c("GCP" = "red", "TPP" = "blue")) +
  labs(x = "Data", y = "", title = "Gastos de consumo pessoal e Taxa de poupança pessoal ") +
  theme_minimal()
