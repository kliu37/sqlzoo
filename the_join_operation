-- 1. show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT goal.matchid, goal.player  
FROM goal 
join game on goal.matchid = game.id 
join eteam on goal.teamid = eteam.id
WHERE teamid = 'GER'
