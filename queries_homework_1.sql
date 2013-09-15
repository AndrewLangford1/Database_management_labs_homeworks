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

--Lists ordno and aid for all orders.--
select 	ordno,aid 
from 	Orders;

select	name,city 
from 	Customers 
where 	city <> 'Dallas';


