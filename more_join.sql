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

--

