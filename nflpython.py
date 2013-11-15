import nflgame

#games = nflgame.games(2013, week=1)
#games(year, week=None, home=None, away=, kind='REG')

i=1
k=1
while i < 18:
	try:
		nflgame.combine(nflgame.games(2012,i, away="SF", home="SF")).csv(str(k)+".csv")
		k=k+1
	except Exception:
    		pass
	print i
	i=i+1
