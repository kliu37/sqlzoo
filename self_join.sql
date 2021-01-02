--1. How many stops are in the database.
select count(*) from stops

--2. Find the id value for the stop 'Craiglockhart'
select id from stops
where name = 'Craiglockhart'

--3. Give the id and the name for the stops on the '4' 'LRT' service.
select id, name from stops
join route on stop = stops.id
where num = '4'
and company = 'LRT'

--4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having count(*) = 2

--5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
and b.stop=149

--6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
and stopb.name='London Road'

--7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT distinct a.company, a.num
FROM route a join route b on 
(a.company=b.company AND a.num=b.num)
where a.stop = 115 
and b.stop = 137

--8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'


/*10.
Find the routes involving two buses that can go from Craiglockhart to Lochend.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus. */
select distinct c.num, c.company, s.name, l.num, l.company 
from (select * from route where concat(num, company) in (select concat(r2.num, r2.company) from route r2 
join stops s2 on r2.stop = s2.id 
where s2.name='Craiglockhart')) c 
join (select * from route where concat(num, company) in (select concat(r2.num, r2.company) from route r2 
join stops s2 on r2.stop = s2.id 
where s2.name='Lochend')) l on  c.stop = l.stop
join stops s on s.id = l.stop
order by c.num, s.name, l.num
--or
 SELECT DISTINCT  a.num, a.company, 
         trans1.name,  d.num,  d.company
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN route c ON (b.stop=c.stop AND b.num!=c.num)
JOIN route d on (c.company = d.company AND c.num = d.num)
JOIN stops start ON (a.stop=start.id)
JOIN stops trans1 ON (b.stop = trans1.id)
JOIN stops trans2 ON (c.stop = trans2.id)
JOIN stops end ON (d.stop =  end.id)
WHERE  start.name = 'Craiglockhart' AND end.name = 'Lochend'
AND  trans1.name = trans2.name
order by a.num, trans1.name, d.num
                                                         
