-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
select name, continent, population from world x where continent not in (select continent from world y where y.continent = x.continent and population > 25000000)

-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
select name, continent from world x where population/3 > all (select population from world y where y.continent = x.continent and y.name != x.name and population > 0)
