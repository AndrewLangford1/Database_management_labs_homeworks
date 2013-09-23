-- Queries Homework 2 --
--Andrew Langford --
-- September 23rd, 2013 --
--Question 1 -- 
-- get the cities of agents booking an order for customer c002 -- 
select	city     
from	Agents
where aid in	(select aid 
		 from Orders
		 where cid = 'c002');
		 
--Question 2 --
--Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto --
--select	pid--
--from	Products --
-- from	Products -- 
--I couldnt quite understand what this one was asking --

--Question 3 --
-- Finds cids and names of customers who never placed an order through agent a03 --
select	cid,name
from 	Customers
where 	cid in	(select	cid
		 from Orders
		 where aid <> 'ao3');
		 
--Question 4 --
--gets the cids and names of customers who ordered both product p01 and p07 --
select	cid,name
from	Customers
where 	cid in	(select	cid
		 from	Orders
		 where	pid in (select	pid      
		 		from   Orders
		 		where 	pid = 'p01')
		 and	pid in (select 	pid
		 		from	Orders
				where 	pid = 'p07')
		);
		
-- Question 5 --
--  get the pid of products by any customers who ever placed an order through agent a03 --
select	pid
from	Products
where	pid in 
	(select	pid   
	 from	Orders   
	 where	cid in
	 	(select	cid
	 	from	Orders
	 	where	aid = 'a03'
	 	)
	 );
	 
-- Question 6 --
-- Get the names and discounts of all customers who place orders through agents in Dallas or Duluth--
select	name, discount
from	Customers
where	cid in 
	(select cid
	from Orders
	where aid in
		(select aid
		 from Agents
		 where	city = 'Dallas'
		 or 	city = 'Duluth'
		 )
	);
	
-- Question 7 --
--Find all customers who have the same discount as that of any customers in Dallas or Kyoto --
select	*
from	Customers
where discount in
	(select discount
	from	Customers
	where	city = 'Dallas'
	or	city = 'Kyoto'
	)
and	(city <> 'Dallas'      
	 and city <> 'Kyoto');