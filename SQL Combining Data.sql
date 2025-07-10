/*
joins			- Basic joins			- Inner join
										- Left join
										- Right join
										- Full join
				
				- Advanced joins		- Left anti join
										- Right Anti join
										- Full Anti join
										- Cross Join
				
				- How to choose the right join
				- how to join multiple tables
*/

/*
if we want sto join 2 tables how can we join 
there are two methods of combine 
1.) Column wise combining data			: we will use join					- Inner join
																			- Full join
																			- left join
																			- Right join

	## requirement for join there should be a key column

2.) Row wise combining data				: we will use SET operator			- Union
																			- Unoin All
																			- Expect (Minus)
																			- Intersect
	## requirement for set operator there should be same column
*/

/*
Why we need joins
1.) Recombining the data	- big pictures
2.) Data enrichment			- getting extra data 
3.) Check for existence		- filtering
*/


/*
No join 
Syntex		:
select * 
from A;

select *
from B;
*/

/*Retrive all teh data from customers and orders as seprate results*/

select * 
from customers;

select * 
from orders;


/*
Inner join  : returns only matching rows from both tables 
*/

select * 
from customers 
inner join orders
on customers.id = orders.customer_id;


select 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
from customers 
inner join orders
on customers.id = orders.customer_id;

/*use aliaces for the table name*/ 

select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
inner join orders as o
on c.id = o.customer_id;

/*Left Join : returns all rows from left table and only matchinh from right*/


select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
left join orders as o
on c.id = o.customer_id;

/*Right Join : returns all rows from right table and only matching from left*/
/* ## the order of the table is important */

/*get all customers along with their orders including orders with out matching customers*/

select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
right join orders as o
on c.id = o.customer_id


/*Get all customers along with their orders including orders with out matching customers (using left join)*/


select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales  
from  orders as o
left join customers as c
on c.id = o.customer_id


/*Full join : returns all the rows from both tables*/
/* ##there is no matter with table order*/

select 
	c.id,
	c.first_name,
	o.customer_id,
	o.sales
from customers as c
full join orders as o
on c.id = o.customer_id

/*


Advanced Join Type


*/

/*Left Anti join - Returns row from left that has no match in right - only unmatching rows - in taht we d'not want any data from right table		*/

/*
Syntex:
select * 
from table a
left join table b
on a.key = b.key
where b.key is null
*/


/*Get all the customes wh hav'nt placed any order*/

select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null

select 
	c.id,
	c.first_name,
	c.country,
	o.customer_id,
	o.sales
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null


/*get all orders without matching customers*/

select *
from  customers as c
right join orders as o
on c.id = o.customer_id
where c.id is null

/*select *
from customers as c
right join orders as o
on c.id = o.customer_id */

/*get all orders without matching customers using left join*/

select * 
from orders as o
left join customers as c
on c.id = o.customer_id
where c.id is null



/*Right Anti join - Returns row from right that has no match in left - only unmatching rows - in taht we d'not want any data from left table

order of the table is important*/

/*
Syntex:
select * 
from table a
right join table b
on a.key = b.key
where a.key is null
*/


select * 
from customers
full join orders
on id = customer_id


/* get all orders without matching customers*/

select *
from customers as c
right join orders as o
on c.id = o.customer_id
where c.id is null

/* get all orders without matching customers using left join*/

select * 
from orders as o
left join customers as c
on c.id = o.customer_id
where c.id is null


/*Full Anti join - Returns only rows that don't match either tables*/

/*
Syntex:
select * 
from table a
full join table b
on a.key = b.key
where (a.key is null or b.key is null)
*/

/*find customers without otders and orders without customers*/

select * 
from customers as c
full join orders as o
on c.id = o.customer_id
where c.id is null or o.customer_id is null

/* get all customers along with their orders, but only for customers who have placed an order - without using inner join*/


select * 
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is not null


/*cross join - combine every row left with every row from right = all possible combination - cartersian join*/

/*
Syntex:
select * 
from table a
cross join table b
*/

/*genrate all possible combinations of customers and orders*/

select * 
from customers
cross join orders

/*	- How to choose the right join		
					
					- joining			- only match			- use inner join
										- all rows				- one side (master table)	- Left join
																- Both side					- Full side
										- only unmatching		- one side(master table)	- left anti join
																- both side					- Full anti join
*/

/*	- how to join multiple tables   */

/*
select *
from a
left b on
left c on
left d on
where control what you keep
*/

/*
Using salesDB, retrive a list of all orders, along with the related customer, product, and employee details.
for each order, display:
-Order ID
-Customer's name
-Product name
-Sales amount
-Product price
-Salesperson's name
*/

use[SalesDB]


select 
	so.OrderID,
	sc.FirstName as CustomerFirstName,
	sc.LastName as CustomerLastName,
	so.Sales,
	sp.Product as ProductName,
	sp.Price,
	se.FirstName as EmployeeFirstName,
	se.LastName as EmployeeLastname
from Sales.Orders as so
left join Sales.Customers as sc 
on so.CustomerID = sc.CustomerID
left join Sales.Products as sp
on so.ProductID = sp.ProductID
left join sales.Employees as se
on so.SalesPersonID = se.EmployeeID



/*
row combining
SET Operators			- union
						- union all
						- except
						- intersect

*/

/*	union	- -returns all district rows from both queries 
			- remove duplicates */

/*
Syntex:

select 
	col1
	col2
from table1

union

select 
	col1
	col2
from table2

Rules:

1) SET operator can be used almost in all clasuses where |join |Group by| having
2) Orderby is allowed only once at the end of query
3) number of column is also same.
4) data types of columns in each query must be compatible.
5) order of the column should be same
*/

select 
	firstName,
	LastName
from Sales.Customers

union

select 
	firstName,
	LastName
from Sales.Employees


/* Union all			 - returns all rows from both queries, including duplicates*/

select 
	firstName,
	LastName
from Sales.Customers

union all

select 
	firstName,
	LastName
from Sales.Employees

/*Except		 - returns all distinct rows from first query that are not found in the second query
				 -  this is the only one where the order of queries affect the final result. */

select 
	firstName,
	LastName
from Sales.Customers

except

select 
	firstName,
	LastName
from Sales.Employees


/*	intersect - returns common rows between 2 tables */

select 
	firstName,
	LastName
from Sales.Customers

intersect

select 
	firstName,
	LastName
from Sales.Employees



/*

SQL task : orders are stored in seprate table (orders and orderarchive).
combine all orders into one report without duplicates

*/

/*	never use * in union	*/


select 
'Orders' as SourceTable,
[ProductID],
[OrderID],
[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
from Sales.Orders

union

select
'OrdersArchive' as SourceTable,
[OrderID]
,[ProductID]
,[CustomerID]
,[SalesPersonID]
,[OrderDate]
,[ShipDate]
,[OrderStatus]
,[ShipAddress]
,[BillAddress]
,[Quantity]
,[Sales]
,[CreationTime]
from Sales.OrdersArchive
order by OrderID


/*

Delta detection	: identifying the differences or changes(delta) between two batches od data

*/

/*

data completeness check	: EXCEPT operator can be used to compare tables to detect discrepancies between database.

to check this tere are many methos 

1) EXCEPT	: table a to table b
2) EXCEPT	: table b to table a

*/