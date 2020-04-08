## packages=======================================================
pkg <- c("dplyr", "ggplot2", "scales")
lapply(pkg, library, character.only=T)

had <- read.csv("data/HAD.csv",na.strings = "B")
# str(had)
s = summary(had)
attach(had)

##=========================================================
pie <- function(x){
  d = as.data.frame(table(x))
  d <- d %>%
    # arrange(desc(x)) %>%
    mutate(prop = Freq / sum(d$Freq) *100)
  print(d)
  
  ggplot(d, aes(x="", y=Freq, fill=x)) +
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    theme_void() +
    theme(legend.position="none") +
    scale_fill_brewer(palette="Blues")+
    theme(axis.text.x=element_blank())+
    geom_text(aes(label = paste(percent(prop/100),x, sep="\n")), size=5
              , position = position_stack(vjust = 0.5))
}
pie2 <- function(x){
  d = as.data.frame(table(x))
  d <- d %>%
    # arrange(desc(x)) %>%
    mutate(prop = Freq / sum(d$Freq) *100)
  print(d)
  
  ggplot(d, aes(x="", y=Freq, fill=x)) +
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    theme_void() +
    # theme(legend.position="none") +
    theme(legend.position = "right") +
    scale_fill_brewer(palette="Blues")+
    theme(axis.text.x=element_blank())+
    geom_text(aes(label = percent(prop/100)), size=5
              , position = position_stack(vjust = 0.5))
}

pie(FMTMETRO3)
pie(FMTREGION)
pie2(FMTBURDEN)

##=========================================================
ggplot(had, aes(x=VALUE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

ggplot(had, aes(x=TOTSAL)) + 
  geom_histogram(aes(y=stat(density)), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

ggplot(had, aes(x=AGE1, color=METRO3)) +
  geom_histogram(aes(y=stat(density)), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

##=========================================================
ggplot(had, aes(x=FMTMETRO3, y=LMED, fill=FMTMETRO3)) + 
  geom_boxplot() +
  scale_fill_brewer(palette="Set1")

ggplot(had, aes(x=FMTREGION, y=LMED, fill=FMTMETRO3)) + 
  geom_boxplot() +
  scale_fill_brewer(palette="Set1")

ggplot(had, aes(x=FMTMETRO3, y=TOTSAL, fill=FMTMETRO3)) + 
  geom_boxplot() +
  scale_fill_brewer(palette="Set1") +
  ylim(NA, 2e+05)

ggplot(had, aes(x=FMTREGION, y=TOTSAL, fill=FMTMETRO3)) + 
  geom_boxplot() +
  scale_fill_brewer(palette="Set1") +
  ylim(NA, 2e+05)

