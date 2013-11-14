library(ggplot2)

mydata = read.csv("~/Fantasy Football/2012.csv", sep=",", header=T)   

plot(mydata$teams)

ggplot(data = mydata, aes(x = fumbles_lost, y = team, color=team, shape="Cash Flow/Debt")) +
  geom_point() +
  ggtitle("Company Health")+
  ylab("Health Ratios")+
  xlab("Companies")+
  geom_point(data = mydata, aes(x = team, y = fumbles_lost, color=team, shape="Profit/Value")) +
  labs(color = "Company Still Active?", shape = "Metrics")

fumbles = data.frame(1:1520)
for (k in 1:1520){
new[k,]= as.factor(mydata$team[k])  
  
}

#qplot(data=mydata,x=1:1,y=cumsum(fumbles_lost),color=team)
p <- ggplot(data = mydata, aes(x=mydata$team, y=cumsum(mydata$fumbles_lost))) + geom_line() + geom_point()


qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)
qplot(mydata$team, cumsum(mydata$fumbles_lost), data=mydata, xlim=c(1:10), y)


#makes new data frame and then adds subset to new data frame
mf <- data.frame(mydata)
mf[is.na(mf)] <- 0

test <- mf[ mf$fumbles_lost == 8, ]





