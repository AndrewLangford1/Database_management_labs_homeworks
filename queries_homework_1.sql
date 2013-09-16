--Andrew Langford --
--Queries Homework 1 --


--Displays all data about customers in Customers table.--
select * 
from   customers;

--Displays the name and city for agents with name 'Smith' in Agents table.--
select 	name,city 
from   	agents 
where	name = 'Smith';


--Lists pid,name, and quantity of any products with a price greater than $1.25--
select 	pid,name,quantity 
from 	Products 
where 	priceusd > 1.25;

--Lists ordno and aid for all orders in Orders table.--
select 	ordno,aid 
from 	Orders;

--Lists the names and cities of customers in Customers table not in Dallas.--
select	name,city 
from 	Customers 
where 	city <> 'Dallas';

--Lists the names of agents in Agents table located in New York or Newark-- 
select 	name
from	Agents
where 	city = 'New York'
or 		city = 'Newark';

--Lists all data about products in Products whose cost is $1 or less and isn't from Newark or New York--
select 	*
from	Products
where 	priceusd <= 1.00
and		(city <> 'Newark' and city <> 'New York');




