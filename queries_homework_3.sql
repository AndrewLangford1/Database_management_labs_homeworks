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
select distinct a.city
from agents a, orders o
where a.aid = o.aid
and o.cid = 'c002';

--Question 3 --
-- 3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries. (Yes, this is also the same question as on homework #2.) --
select distinct pid
from orders
where pid in (select pid 
			  from orders
			  where aid in(select aid 
			  			   from orders
			  			   where cid in(select cid
										from customers
										where city = 'Kyoto')));




-- Question 4 --
-- 4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries. --
select distinct o.pid
from orders o,
	 orders os,
	 customers c
where o.cid = c.cid
and os.aid = o.aid
and c.city = 'Kyoto'




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
full outer join orders
on customers.cid = orders.cid
where orders.ordno is null;

--Question 7 --
-- 7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.--
select distinct a.name as "Agent Name", c.name as "Customer Name"
from orders o inner join customers c on o.cid = c.cid
	inner join agents a on o.aid = a.aid
where a.city = c.city;


-- Quesion 8 --
-- 8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever placed an order with that agent. --
select a.name as "Agent Name", c.name "Customer Name", a.city as "City"
from agents a inner join customers c on a.city = c.city;

-- Quesion 9 --
-- 9. Get the name and city of customers who live in the city where the least number of products are made. --
select distinct name,city
from customers
where city in(select city
			  from (select distinct p.city, count(p.city) as "cCount"
			  		from products p
			  		group by p.city
			  		order by count(p.city) ASC)subquery1
			  group by city
			  limit 1
			 );

-- Question 10 --
-- 10. Get the name and city of customers who live in a city where the most number of products are made.--
select name,city
from customers
where city in(select city
			  from (select distinct p.city, count(p.city) as "cCount"
			  		from products p
			  		group by p.city
			  		order by count(p.city) desc)subquery1
			  group by city
			  limit 1
			 );


-- Question 11--
-- 11. Get the name and city of customers who live in any city where the most number of products are made. --

--Question 12 --
-- 12. List the products whose priceUSD is above the average priceUSD. --
select *
from products
where priceUSD >(select avg(priceUSD)
					from products);

-- Question 13 --
--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low--
select c.name as "Customer Name", o.pid as "Product ID" , o.dollars as "Amount(Dollars)"
from customers c inner join orders o on c.cid = o.cid
order by dollars desc;

-- Question 14 --
-- Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.--
select distinct c.name as "Customer Name", sum(o.qty)
from customers c
full outer join orders o
on c.cid = o.cid
group by c.name
order by c.name asc;

--Question 15 --
-- Show the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them.--
select c.name as "Customer Name", p.name as "Product Name", a.name as "Agent Name"
from customers c, products p, agents a, orders o
where c.cid = o.cid
	and p.pid = o.pid
	and a.aid = o.aid
	and a.city = 'New York';

-- Question 16 --
-- 16. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars. --
select ((p.priceusd * o.qty) + ((p.priceusd * o.qty)*(a.percent/100)) - (p.priceusd * o.qty*(c.discount/100))) as "Actual", o.dollars as "Charged"
from products p, orders o, agents a, customers c
where p.pid = o.pid
and a.aid = o.aid
and c.cid = o.cid




















