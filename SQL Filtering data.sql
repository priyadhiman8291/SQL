/*filtering Data
Where operator - comparison operators -  =			: if 2 values are equal 
										 <>	!=		: if 2 values arer not eqaul
										 >			: if a value is greater than another value
										 >=			: if value is greater than or equal to another value
										 <			: if the value is less than another value
										 <=			: if value is less than or equal to another value
				- logical operator    - AND
								      - OR
								      - NOT
				- Range Operator      - BETWEEN
				- Membership operator - IN
									  - NOT IN
				- Search operator	  - LIKE

*/

/*Comparison Operator*/
/*Condition - Experssion operator expression
Col1 = col2		    : first_name = last_name
Col1= value		    : first_name = 'john'
Function = value    : UPPER(first_name) ='JOHN'
Expression = value  : price * Quantity = 1000
subqurary = value   : (select avg(sales) from orders) = 1000	: advanced
*/

/*retrive all customers from germany*/

select * 
from customers
where country = 'Germany'

/*retrive all customers not from germany*/

select * 
from customers 
where country <> 'Germany'


select * 
from customers 
where country != 'Germany'

/*retrive all customers with score greater ten 500*/

select * 
from customers
where score > 500

/*retrive all customers with score of 500 or more*/

select * 
from customers 
where score >= 500


/*retrive all customers with score less than 500*/

select *
from customers
where score < 500

/*retrive all customers with score of 500 or less*/

select * 
from customers
where score<=500


/*Logical Operator
AND OPERATOR  : all condition must be true
OR Operator   : one condition should be true
NOT operstor  : reverse operator means exclude matching values
*/


/*retrive all customers who are from usa and have a score greater then 500 */
select *
from customers
where country = 'USA' and score >500


/* retrive all  te customers who are either from USA or have a score greater than 500 */

select *
from customers 
where country ='USA' or score>500


/*retrive all customers with a score not less than 500*/

select * 
from  customers
where not score < 500

/*Range operator
Between operator - check if a value is within a range
*/

/*retrive all customers whose score falls in range between 100 and 500*/

select *
from customers
where score between 100 and 500


/*Membership operator
IN opertor : check if a value exists in a list */

/*retrive all the custoers from eiter USA and germany*/

select * 
from customers
where country in ('USA', 'Germany')

select * 
from customers
where country not in ('USA', 'Germany')


/*Like Operator : search a pattern in text*/

select *
from customers
where first_name like 'm%'

select * 
from customers
where first_name like '%n'

select * 
from customers
where first_name like '%t%'


select * 
from customers
where first_name like '__t%'


select * 
from customers
where first_name like '%__n' 