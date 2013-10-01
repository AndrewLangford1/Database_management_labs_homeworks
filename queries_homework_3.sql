-- Andrew Langford --
-- SQL Queries Homework 2 --
-- Tuesday October 1 --

-- Question 1 --
--  Get the cities of agents booking an order for customer c002. Use a subquery. (Yes, this is the same question as on homework #2). --

select city
from agents
where aid in (select aid 
			 from orders
			 where cid = 'c002');

-- Question 2 --
-- 2. Get the cities of agents booking an order for customer c002. This time use joins; no subqueries.--
select distinct city
from agents a, orders o
where a.aid = o.aid
and o.cid = 'c002';