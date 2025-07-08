/*
Modify (Manipulate) your data
*/

/*
	INSERT
*/
  
  -- there are two ways to insert the data

/*1.) Manual Entry (Values)*/

/* Syntex:
	
INSERT INTO table_name (col1,col2,col3,.....)
VALUES (value1,value2,value3,.....)


### Rule: no of columns and values must match
#multiple can be inserted

*/

insert into customers (id, first_name, country, score)
values 
	--(6,'Anna','USA',NULL),
	--(7,'Sam',NULL,100),
	--(8,'Pete','Germany',Null),
	(9,'john','UK',NULL),
	(10,'Alen','USA',NULL)



select * 
from customers 


/*
	2.) INSERT using Select
*/

/*Insert data from customers table into persons*/

select 
	id,
	first_name,
	null,
	'Unknown'
from customers


insert into persons (id,person_name,dob,phone)
select
	id,
	first_name,
	null,
	'Unknown'
from customers

select * from persons

/*
Update
*/

/*Syntex: 

update table_name
set col1=value1,
	col2=value2
where <condition>
*/

-- change the score of customer with ID 6 to 0
--- witout Where clause if we use set then all the targeted column will be updated

UPDATE customers
SET score = 0
where id = 6

select *
from customers

--- change the score of customer with id 10 to  0 and update the country to 'UK'

UPDATE customers
SET score=0 ,
	country ='UK'
where id=8

--- update all customers with a NULL score by setting their score to 0

UPDATE customers
SET score = 0
where score is NULL


--- if  i place = instead of is rows are not affected

/*
	DELETE
*/

/* DELETE from table_name
where condition */


---delete all customers with an ID greater then 5

DELETE from customers
where id > 5


select * from customers 
where id> 5

select * 
from customers 


--- delete all the data from person table

TRUNCATE table persons

select * 
from persons