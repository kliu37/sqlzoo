--1. show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT goal.matchid, goal.player  
FROM goal 
join game on goal.matchid = game.id 
join eteam on goal.teamid = eteam.id
WHERE teamid = 'GER'

--2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
SELECT id,stadium,team1,team2
FROM game join goal on game.id = goal.matchid
where goal.player='Lars Bender'

--3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid,stadium,mdate
FROM game 
JOIN goal ON (id=matchid)
WHERE goal.teamid = 'GER'

--4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1,team2,player
FROM game 
JOIN goal ON (id=matchid)
WHERE player like 'Mario%'

--5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach,gtime
FROM goal 
JOIN eteam on teamid=id
WHERE gtime<=10
 
 --6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select mdate,teamname from game
join eteam on (game.team1=eteam.id)
where coach = 'Fernando Santos'

--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
select player from goal 
join game on matchid = id
where stadium='National Stadium, Warsaw'

--8. Instead show the name of all players who scored a goal against Germany.
SELECT distinct player
FROM game JOIN goal ON goal.matchid = game.id 
WHERE goal.teamid!='GER' and (team1='GER' or team2='GER')
    
--9. Show teamname and the total number of goals scored.
SELECT teamname, count(teamname)
FROM eteam JOIN goal ON id=teamid
group by teamname
ORDER BY teamname   

--10. Show the stadium and the number of goals scored in each stadium.
select stadium, count(stadium)
from game join goal on game.id = goal.matchid
group by stadium

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate,count(team1)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
select matchid,mdate,count(matchid)
from goal join game on goal.matchid=game.id
where teamid='GER'
group by matchid,mdate

--13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2, 
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game JOIN goal ON matchid = id
group by mdate,team1,team2
order by mdate, matchid, team1,team2
