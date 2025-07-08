/*

	CREATE

*/


/* Create anew table called persons with columns:  id,, person_name,birthe_date aand phone */

create table persons(
	id int not null,
	person_name varchar(20) not null,
	dob date,
	phone varchar(15) not null,
	CONSTRAINT pk_persons PRIMARY KEY(id)
)

select * from persons

/*

	ALTER

*/

/*add a new column in persons table*/

ALTER table persons
ADD email varchar (50) not null 


/*Remove the column phone fro the persons table*/

ALTER table persons
DROP column phone 

/*

	DROP

*/

