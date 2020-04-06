## packages=======================================================
pkg <- c("dplyr", "ggplot2", "scales")
lapply(pkg, library, character.only=T)

had <- read.csv("data/HAD.csv")
# str(had)
summary(had)
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

pie(FMTMETRO3)
pie(FMTREGION)
pie(FMTBURDEN)

##=========================================================

