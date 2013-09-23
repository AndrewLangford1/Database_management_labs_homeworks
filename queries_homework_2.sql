-- Queries Homework 2 --
--Andrew Langford --

--Question 1 -- 
-- get the cities of agents booking an order for customer c002 -- 
select	city     
from	Agents
where aid in	(select aid 
		 from Orders
		 where cid = 'c002');
		 
--Question 2 --
--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto --
select	pid
from	Products
where


--Question 3 --
-- Finds cids and names of customers who never placed an order through agent a03 --
select	cid,name
from 	Customers
where 	cid in	(select	cid
		 from Orders
		 where aid <> 'ao3');