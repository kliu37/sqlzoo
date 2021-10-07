--quiz, problem 4 
 /*SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region
Will be No result due to invalid use of the WHERE function. Because you cannot use aggregate functions in a WHERE clause or in a JOIN condition. The aggregate functions can be used in a select list, or in the HAVING clause of a select statement that includes a GROUP BY clause*/
 /*Correct code is below:
 SELECT region, SUM(area)
 FROM bbc 
 GROUP BY region
 having SUM(area) > 15000000 */
  
--8. List the continents that have a total population of at least 100 million. (the where clause cannot be used with aggregates, but the having clause can)
select continent from world group by continent having sum(population) > 100000000
