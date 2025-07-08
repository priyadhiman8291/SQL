/*
SQL Query Clauses- 
select
distinct
top
from
join
where
group by
having
order by
*/

--Syntex - select * (all) retrives all the columns from the tables
--from  tell sql where to find your data



/*select clause*/

--- select * from table_name

select * 
from customers


select * 
from orders


--- select few columns

select 
	first_name, 
	score,
	country
from customers

-- if i change the order of the column name in query the table will also change :-)



/* where clause - Filter te data based on the condition*/



--- syntex : select * from table_name where condition

select 
	first_name,
	country
from customers
where score > 500

select *
from customers
where score !=0

select *
from customers
where country = 'Germany'

select 
	first_name,
	country
from customers
where country = 'Germany'



/* order by clause - sort ypur data from asc to dec or vice versa*/



--- syntex : select * from table_name order by condition

select *
from customers
order by score desc


select *
from customers
order by score asc


--- (Nested) order by - sort your data

select * 
from customers
order by country ASC , score DESC

select * 
from customers
order by score DESC , country ASC


/*group by - aggregate your data -  combines rows with the same value
 aggrigate a column by another column*/


-- syntex:  select cuntry sum(score) from table group by country

select 
	country,
	SUM(score) as total_score
from customers 
group by country 


select 
	country,
	SUM(score) as total_score,
	COUNT(id) as total_customers
from customers
group by country


--- having  - filter the data after aggrigation can be used only with group by

-- syntex:  select cuntry sum(score) from table group by country having condition

select
	country,
	SUM(score)
from customers
group by country
having SUM(score) >800


select 
	country,
	sum(score)
from customers
where score>400
group by country 
having SUM(score)>800 


/* Find the average score for each each country considering only customers with a score not equal to 0 and return only those 
countries with an average score greater then 430*/


select 
	country,
	AVG(score) as avg_score
from customers
where score!=0
group by country
having AVG (score)>430


/*Distinct - removes duplicates(repeted values) each value appers only ones*/

--syntex: select Distinct col_name from table

select  DISTINCT country
from customers

select  DISTINCT country as Country
from customers

/*Top - limit your data - restrict the number of rows returned */

-- syntex: select top (row no.) * from table 

select top 3 * 
from customers

/*retrive top 3 customers with highest scores*/

select top 3 *
from customers 
order by score desc

/*last 2 */

select top 2 *
from customers 
order by score ASC


/*get the 2 most recent orders*/

select top 2* 
from orders
ORDER BY order_date DESC



/*Multi Queries */


SELECT * 
FROM customers;

SELECT * 
FROM orders;

/*Static (fixed) values*/

select 123 as static_number

select 'hello' as static_number

select 
	id,
	first_name
from customers

select 
	id,
	first_name,
	'New Customer' as customer_type
from customers


/*highlight & Execute*/
