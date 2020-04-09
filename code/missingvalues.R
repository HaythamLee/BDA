had <- read.csv("data/HAD.csv")
str(had)
summary(had)

# install.packages("mice")
library(mice)
# install.packages("VIM")
library(VIM) 
had.aggrplot<-aggr(had, col=c('lightblue','red'), 
                   numbers=TRUE, prop = TRUE, sortVars=TRUE, 
                   labels=names(had), cex.axis=.7, gap=3)