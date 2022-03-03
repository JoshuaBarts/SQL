/************************************************************************ 
Lecture 03 Exercise
Select 

************************************************************************/
--SPOOL M:\ICS120\Exercise\L03_Select_Exercise.txt

SET PAGESIZE 50
SET LINESIZE 120
SET ECHO ON

 
/************************************************************************ 
 Exercise 1
 Use the STOREDB schema.
 Write a query to display the first name and the last
 name from the customers table. 
*************************************************************************/
-- insert code here
select first_name, 
       last_name 
from storedb.customers;

 
/************************************************************************ 
 Exercise 2
 Use the STOREDB schema.
 Write a query to display the product_id, product_type_id, name,
 and price from the products table where the product type id is 1 
*************************************************************************/
-- insert code here
select product_id,
	product_type_id,
	name,
	price
from storedb.products
where product_type_id = 1;


/************************************************************************ 
  Exercise 3
  Use the STOREDB schema.
  Write a query to display the first name and last names of all 
  employees who have the first name 'Ron'.
 ************************************************************************/
-- insert code here
select first_name,
	last_name
from storedb.employees
where first_name = 'Ron';

/*** Question 4 ************************************************************
  Use the STOREDB schema.
  Write a query to display all of the last names of employee who have a 
  title beginning with Sales.
***************************************************************************/
-- insert code here; //beginning with is hint
select last_name,
	title
from storedb.employees
where title like 'Sales%';

/************************************************************************ 
  Exercise 5
  Use the STOREDB schema.
  Write a query to display all of the products that have a price
  that is more than $15.00 but less than $19.95 (inclusive). 
  Display only the product name and the price.
  Change the heading for name to "Product Name" and price to "Product Price"
  Do this first using >= , <= operators and then using BETWEEN
***************************************************************************/
-- insert code here
SELECT name as "Product Name",
	price AS "Product Price"
FROM storedb.products
WHERE price >= 15.00 AND
	price <= 19.95;

-- and
SELECT name AS "Product Namee",
	price AS "Product Price"
FROM storedb.products
WHERE price BETWEEN 15.00 AND 19.95;

-- insert code here



/************************************************************************ 
 Exercise 6
 Use the tables in your schema.
 Write a query to display all the unique employees that are in the job history 
 table and that worked in departments 20 or 50.  Sort the rows by employee_id.
 Write 2 separate queries one using IN and the other OR.
****************************************************************************/
-- insert code here
SELECT distinct employee_id
FROM job_history
WHERE department_id IN(20,50)
ORDER BY employee_id;

SELECT distinct employee_id
FROM job_history
WHERE department_id = 20 OR
	department_id = 50
ORDER BY employee_id;


/************************************************************************ 
 Exercise 7
 Use the tables in your schema.
 Write a query to display all departments that have a manager.    
 Sort the results by department name.
******************************************************************************/
-- insert code here
SELECT department_name,
	manager_id
FROM departments
WHERE manager_id IS NOT NULL
ORDER BY department_name;
   

