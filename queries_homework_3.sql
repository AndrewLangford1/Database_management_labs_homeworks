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
from orders
where cid in (select cid
			from customers
			where city = 'Kyoto')



-- Question 4 --
-- 4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries. --



-- Question 5 --
-- Get the names of customers who have never placed an order. Use a subquery.--
select name
from customers
where cid not in (select cid
				  from orders);

-- Question 6 --
-- 6. Get the names of customers who have never placed an order. Use an outer join. --
select name
from customers
where name not in (select name
					from customers
 					right outer join orders
 					on customers.cid = orders.cid);

--Question 7 --
-- 7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.--
select distinct a.name,c.name
from orders o inner join customers c on o.cid = c.cid
	inner join agents a on o.aid = a.aid
where a.city = c.city;


-- Quesion 8 --
-- 8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever placed an order with that agent. --
select a.name, c.name, a.city
from agents a inner join customers c on a.city = c.city;

-- Quesion 9 --
-- 9. Get the name and city of customers who live in the city where the least number of products are made. --

--Question 12 --
-- 12. List the products whose priceUSD is above the average priceUSD. --
select *
from products
where priceUSD >(select avg(priceUSD)
					from products);

-- Question 13 --
--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low--
select c.name, o.pid, o.dollars
from customers c inner join orders o on c.cid = o.cid
order by dollars desc;
















