# install.packages("ggplot2")

library(ggplot2)

dados <- read.csv("https://web.tecnico.ulisboa.pt/~paulo.soares/pe/projeto/GENDER_EMP_19032023152556091.txt", sep = "\t", header = TRUE)
dados <- subset(dados, dados$IND == "EMP2")
dados <- subset(dados, dados$SEX == "MEN" | dados$SEX == "WOMEN")
dados <- subset(dados, dados$AGE == "1524" | dados$AGE == "2554" | dados$AGE == "5564")
dados <- subset(dados, dados$TIME == 2019)
dados <- subset(dados, dados$COU == "NOR")

dev.new()
par(mar = c(5, 7, 4, 2), cex.axis = 1)
ggplot(dados, aes(x = Age.Group, y = Value, fill = factor(Sex))) +
  geom_col(position = "dodge", colour = "black") +
  geom_text(
    aes(label = Value), vjust = 1.5,
    colour = "black", size = 6,
    position = position_dodge(.9)
  ) +
  scale_fill_brewer(palette = "Pastel2") +
  xlab("\nAge group") +
  ylab("Employment / population ratio\n") +
  labs(fill = "Sex", subtitle = "in Norway") +
  ggtitle("Employment/population ratio, by sex and age group in 2019") +
  theme(axis.text = element_text(size = 12))
