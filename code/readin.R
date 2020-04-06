had <- read.csv("data/HAD.csv")
str(had)
summary(had)

library(ggplot2)

ggplot(had, aes(FMTMETRO3)) +
  geom_bar(color="darkblue", fill="lightblue")

ggplot(had, aes(x="", y=count, fill=FMTMETRO3))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y")
ggplot(data = had, aes(x = 0, y = freq, fill = x)) + 
  geom_bar(stat = "identity") +
  geom_text(aes(label = perc), position = position_stack(vjust = 0.5)) +
  scale_x_continuous(expand = c(0,0)) +
  labs(fill = 'Type', x = NULL, y = NULL, title = 'Deaths', subtitle = 'in perventages') +
  coord_polar(theta = "y") +
  theme_minimal()

count(had$FMTMETRO3)
