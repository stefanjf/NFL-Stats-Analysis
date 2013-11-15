library(ggplot2)

mydata = read.csv("~/Fantasy Football/2012.csv", sep=",", header=T)   
#Wk1 = read.csv("~/repos/nfl_modeling/1.csv", sep=",", header=T) 

#Quick way to load all csv files at once
path <- list("~/repos/nfl_modeling/1.csv", "~/repos/nfl_modeling/2.csv", "~/repos/nfl_modeling/3.csv", "~/repos/nfl_modeling/4.csv", "~/repos/nfl_modeling/5.csv", "~/repos/nfl_modeling/6.csv", "~/repos/nfl_modeling/7.csv", "~/repos/nfl_modeling/8.csv", "~/repos/nfl_modeling/9.csv", "~/repos/nfl_modeling/10.csv", "~/repos/nfl_modeling/11.csv", "~/repos/nfl_modeling/12.csv", "~/repos/nfl_modeling/13.csv", "~/repos/nfl_modeling/14.csv", "~/repos/nfl_modeling/15.csv", "~/repos/nfl_modeling/16.csv")
#Up:for Mac ... Bottom: for Win
path <- list("~/Fantasy Football/1.csv", "~/Fantasy Football/2.csv", "~/Fantasy Football/3.csv", "~/Fantasy Football/4.csv", "~/Fantasy Football/5.csv", "~/Fantasy Football/6.csv", "~/Fantasy Football/7.csv", "~/Fantasy Football/8.csv", "~/Fantasy Football/9.csv", "~/Fantasy Football/10.csv", "~/Fantasy Football/11.csv", "~/Fantasy Football/12.csv", "~/Fantasy Football/13.csv", "~/Fantasy Football/14.csv", "~/Fantasy Football/15.csv", "~/Fantasy Football/16.csv")


all_games <- lapply(path, read.csv)

#This selects the game from the game list and converts it into a data frame.
testdf <- as.data.frame(all_games[6])




#Yearly stats. Get rid of NAs
mf <- data.frame(mydata)
mf[is.na(mf)] <- 0
#list of all team names
teams <- c("ATL","BUF","CHI","CIN","CLE","BAL","DAL","DEN","DET","GB","TEN","IND","KC","OAK","STL","MIA","MIN","NE","NO","NYG","NYJ","PHI","PIT","SD","SF","SEA","ARI","TB","WAS","CAR","JAC","HOU")
teamStats <- as.data.frame(teams)
#Gets team stats for entire year
for (k in 1:32){
  test <- mf[mf$team == teams[k], ]
  teamStats[k,2] <- sum(test$passing_yds)#, test$rushing_yds)
}
colnames(teamStats) <- c("team", "yards")
teamStatsOrdered <- teamStats[order(teamStats$yards),]
teamStatsOrdered<-data.frame(teamStatsOrdered, row.names=NULL)
teamStatsOrdered[,3] <- c(1:32)

avg <- data.frame(1:15,1:15,1:15,1:15)

#get average of team stats over the season
for (k in 1:16){
  single_game <- as.data.frame(all_games[k])
  #makes new data frame and then adds subset to new data frame
  single_game[is.na(single_game)] <- 0
  single_game_subset <- single_game[single_game$team != "SF", ]
  avg[k,1] <- as.character(single_game_subset$team[1])  
  avg[k,2] <- sum(single_game_subset$passing_yds)#, test$rushing_yds)
  avg[k,3] <- sum(single_game_subset$rushing_yds)#, test$rushing_yds)
  #find average for each opponent and put it in column
  season_total <- teamStats[teamStats$team == as.character(single_game_subset$team[1]), ][2]
  avg[k,4] <- season_total/16
}

#colnames(avg[1]) <- "avg"
colnames(avg)[1] <- "team"
colnames(avg)[2] <- "pass_yards"
colnames(avg)[3] <- "rush_yards"
colnames(avg)[4] <- "opp"

#THIS GRAPH WORKS!!!
p <- ggplot(data = avg, aes(x=c(1:16), y=avg$pass_yards), labels=avg$team) + geom_line() + geom_point() + scale_x_discrete(labels=avg$team) + ylim(0,500) +
geom_line(data = avg, aes(x=c(1:16), y=avg$opp, colour="#000099"),show_guide = FALSE) + geom_point(data = avg, aes(x=c(1:16), y=avg$opp, colour="#000099"),show_guide = FALSE)
p













#boxplot(data=avg,x=avg$yards, main="passing yards allowed", xlab="SF", ylab="Passing Yards")



fumbles = data.frame(1:1520)
for (k in 1:1520){
new[k,]= as.factor(mydata$team[k])  
  
}

#qplot(data=mydata,x=1:1,y=cumsum(fumbles_lost),color=team)
p <- ggplot(data = mydata, aes(x=mydata$team, y=cumsum(mydata$fumbles_lost))) + geom_line() + geom_point()


qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)
qplot(mydata$team, cumsum(mydata$fumbles_lost), data=mydata, xlim=c(1:10), y)

#  test <- mf[mf$team == "SF", ]



p <- ggplot(data = teamStatsOrdered, aes(x=ordered, y=yards), labels=teamStatsOrdered$team) + geom_bar(stat="identity")
p <- p + scale_x_discrete(limits=teamStatsOrdered$team)
p



