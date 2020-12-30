--1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962
 
 --2. Give year of 'Citizen Kane'.
select yr from movie
where title='Citizen Kane'

--3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

--4. What id number does the actor 'Glenn Close' have?
select id from actor where name = 'Glenn Close'

--7. Obtain the cast list for the film 'Alien'
select name 
from actor 
join casting on actor.id = casting.actorid 
join movie on movie.id = casting.movieid
where movie.title = 'Alien'

--8. List the films in which 'Harrison Ford' has appeared
select title from movie m
join casting c on m.id=c.movieid
join actor a on a.id=c.actorid
where name='Harrison Ford' 

--9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select m.title from movie m
join casting c on m.id = c.movieid
join actor a on a.id = c.actorid
where a.name = 'Harrison Ford' 
and c.ord != 1

--10. List the films together with the leading star for all 1962 films.
select m.title, a.name from movie m
join casting c on m.id = c.movieid
join actor a on a.id = c.actorid
where m.yr = '1962'
and c.ord = 1

--11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr 
HAVING COUNT(title) > 2

--12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT m.title, a.name 
from casting c join movie m on c.movieid = m.id
join actor a on a.id = c.actorid
WHERE c.ord = 1
and movieid in (select movieid from casting where actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
 
 --13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
select a.name from actor a
join casting c on c.actorid = a.id
join movie m on m.id = c.movieid
where c.ord = 1
group by a.name
having count(c.movieid) >= 15
order by a.name
 
 --14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
 select m.title, count(a.name) from movie m
join casting c on m.id = c.movieid
join actor a on c.actorid = a.id
where m.yr = '1978'
group by m.title
order by count(a.name) DESC, m.title

 
--15. List all the people who have worked with 'Art Garfunkel'.
--Find out what movie this actor has been acted, and then according to the movie list find out who has played on those movie. 
select a.name from actor a
join casting c on c.actorid = a.id
where movieid in (select movieid from casting where actorid in (
select id from actor where name = 'Art Garfunkel'))
and a.name != 'Art Garfunkel'

