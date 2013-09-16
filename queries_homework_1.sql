--Andrew Langford --
--Queries Homework 1 --


--1. Lists all data for all customers.--
select * 
from   customers;

--2. Lists the name and city of agents named Smith.--
select 	name,city 
from   	agents 
where	name = 'Smith';


--3. Lists pid, name, and quantity of products costing more than US$1.25.--
select 	pid,name,quantity 
from 	Products 
where 	priceusd > 1.25;

--4. Lists the ordno and aid of all orders.--
select 	ordno,aid 
from 	Orders;

--5. Lists the names and cities of customers not in Dallas.--
select	name,city 
from 	Customers 
where 	city <> 'Dallas';

--6. Lists the names of agents in New York or Newark.-- 
select 	name
from	Agents
where 	city = 'New York'
or 		city = 'Newark';

--7. Lists all data for products not in New York or Newark that cost US$1 or less.--
select 	*
from	Products
where 	priceusd <= 1.00
and		(city <> 'Newark' and city <> 'New York');

--8. Lists all data for orders in January or March. --
select	*
from 	Orders
where 	mon = 'jan'
or 		mon = 'mar';

--9. Lists all data for orders in February less than US$100. --
select	*
from	Orders
where	mon = 'feb'
and 	dollars < 100.00;

--10. Lists all orders from the customer whose cid is C005.--
select	*
from 	Orders
where 	cid = 'c005';