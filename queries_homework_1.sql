--Andrew Langford --
--Queries Homework 1 --


--Lists all data for all customers.--
select * 
from   customers;

--Lists the name and city of agents named Smith.--
select 	name,city 
from   	agents 
where	name = 'Smith';


--Lists pid, name, and quantity of products costing more than US$1.25.--
select 	pid,name,quantity 
from 	Products 
where 	priceusd > 1.25;

--Lists the ordno and aid of all orders.--
select 	ordno,aid 
from 	Orders;

--Lists the names and cities of customers not in Dallas.--
select	name,city 
from 	Customers 
where 	city <> 'Dallas';

--Lists the names of agents in New York or Newark.-- 
select 	name
from	Agents
where 	city = 'New York'
or 		city = 'Newark';

--Lists all data for products not in New York or Newark that cost US$1 or less.--
select 	*
from	Products
where 	priceusd <= 1.00
and		(city <> 'Newark' and city <> 'New York');

--Lists all data for orders in January or March. --
select	*
from 	Orders
where 	mon = 'jan'
or 		mon = 'mar';


