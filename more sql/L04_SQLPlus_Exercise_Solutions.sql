/************************************************************************ 
Lecture 04 Exercise
SQL*Plus

************************************************************************/
--SPOOL M:\ICS120\Exercise\L04_SQLPlus_Exercise.txt

SET PAGESIZE 50
SET LINESIZE 120
SET ECHO ON

/************************************************************************ 
 Exercise 1
 Use the tables in your schema.
 Find all employees with last name starting with F. 
 Set the header to be 'Corporate Planning', left justified.
 Set the footer to be 'Confidential'.
*************************************************************************/
TTITLE LEFT 'Corporate Planning'
BTITLE 'Confidential'

SELECT first_name, 
       last_name 
FROM employees
WHERE last_name like 'F%';

TTITLE OFF
BTITLE OFF


/************************************************************************ 
 Exercise 2
 Use the tables in your schema.
 Find employees with a salary between 5000 and 7000.
 Customize the salary and emp columns. Format the salary column with 
 dollar sign and commas and the heading Salary. Concatenate first name 
 and last name with a space in between, a column name of "Employee Name", 
 and a maximum column width of 16 characters
 Sort by descending salary.
*************************************************************************/
COLUMN salary HEADING Salary FORMAT $999,999,999.99
COLUMN ename HEADING 'Employee Name' FORMAT A16

SELECT first_name || ' ' || last_name as ename, 
       salary
FROM employees 
WHERE salary BETWEEN 5000 AND 7000
ORDER BY salary DESC;

CLEAR COLUMNS



/************************************************************************ 
 Exercise 3
 Use the tables in the storedb schema.
 Create a report showing:
   product_id, name, and price of all of the products
Header:
   left-justified: 'Run date: ' use _DATE command
   centered: Show the user who ran the query as 'Run by: ' SQL.USER
   right-justified: Put Page number on the right as 'Page: ' SQL.PNO
Footer:
   centered: 'End of Report'
*************************************************************************/
TTITLE LEFT 'Run date: ' _DATE CENTER 'Run by: ' SQL.USER RIGHT 'Page: ' SQL.PNO 
BTITLE CENTER 'End of Report'

SELECT product_id, 
       name, 
       price
FROM storedb.products;

TTITLE OFF
BTITLE OFF



/************************************************************************ 
 Exercise 4
 Use the tables in the storedb schema.
 Show all the employees who make above a certain salary amount - make this 
 value a temporary variable called salaryBar, so that you get prompted 
 for its value every time the script is run.
 Display first name, last name, job title, and salary.
 First name and last name must be concatenated (with a space between) and 
 be under the heading "Full Name". Salary must be formatted in currency.
 Test with a salary of 550000.
*************************************************************************/
COLUMN ename HEADING 'Full Name'
COLUMN salary FORMAT $999,999,999.99

SELECT first_name || ' ' || last_name as ename, 
       title, 
       salary
FROM storedb.employees
WHERE salary > &salaryBar;


/************************************************************************ 
 Exercise 5
 Use the tables in your schema.
 Use the BREAK command to add up salary by department. 
 Display department_id, last_name, and salary.
 Sort by department_id.
 HINT: Bottom of page 83 in your textbook.
*************************************************************************/
BREAK ON department_id
COMPUTE SUM OF salary ON department_id

SELECT department_id, 
       last_name, salary
FROM employees
ORDER BY department_id;








SPOOL OFF