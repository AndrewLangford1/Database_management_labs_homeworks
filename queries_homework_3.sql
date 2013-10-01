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

--Question 3 --
-- 3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries. (Yes, this is also the same question as on homework #2.) --
select pid
from products
where pid in (select pid
			  from orders
			  where aid in (select aid
			  				from agents
			  				where city = 'Kyoto'));



-- Question 4 --
-- 4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries. --



-- Question 5 --
-- Get the names of customers who have never placed an order. Use a subquery.--
select name
from customers
where cid not in (select cid
				  from orders);