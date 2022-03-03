/*********************************
 Assignment - Lab 2 Questions
 By Joshua Bartolome
 Lab Section: X01A  (eg: X01A)
 **********************************/

set pagesize 40
set linesize 120
 

/*** 1 ***/
/* Select everything from the countries table */
SELECT *
FROM countries;
 
/*** 2 ***/
/* Display all the different jobs with their min and maximum salary */

SELECT job_title,
       min_salary,
       max_salary
FROM jobs;

/*** 3 ***/
/* Select the country name for the country that has a country id of IT  */

SELECT country_name
FROM countries
WHERE country_id = 'IT';

/*** 4 ***/
/* What is the row id for each country */

SELECT rowid,
       country_name
FROM countries;

/*** 5 ***/
/* What is the date 4 days after Aug 25th, 2020  */

SELECT TO_DATE('25-AUG-2020') + 4
FROM dual;

/*** 6 ***/
/* What is the difference between the minimum and maximum salary for all jobs */

SELECT max_salary,
       min_salary,
       max_salary-min_salary
FROM jobs;

/*** 7 ***/
/* With the query from number 6, label the difference as Salary Difference */

SELECT max_salary,
       min_salary,
       max_salary-min_salary AS "Salary Difference"
FROM jobs;

/***  8  ***/
/* What employees do not have a commission  */

SELECT first_name,
       last_name,
       commission_pct
FROM employees
WHERE commission_pct IS NULL;

/*** 9 ***/
/* What departments have a manager  */

SELECT manager_id,
       department_name
FROM departments
WHERE manager_id IS NOT NULL;

/*** 10 ***/
/* What are all the unique location ids that there are departments */

SELECT DISTINCT location_id
FROM departments;

/*** 11  ***/
/* What employee that have a salary greater than $10,000 */

SELECT first_name,
       last_name,
       salary
FROM   employees
WHERE salary > 10000;

/*** 12 ***/
/* What employees have a first name of Den or Nancy (use the IN key word) */

SELECT first_name,
       last_name
FROM employees
WHERE first_name IN ('Den', 'Nancy');

/*** 13 ***/
/* What departments are in location 1700 or location 2400 (use OR)  */

SELECT department_name,
       location_id
FROM departments
WHERE location_id=1700 OR location_id=2400;

/*** 14 ***/
/* What departments are in location 1700 or location 2400 and have a manager */

SELECT department_name,
       location_id,
       manager_id
FROM departments
WHERE location_id IN (1700, 2400) AND manager_id IS NOT NULL;

/*** 15 ***/
/* Display the salary of all employees from highest salary to lowest salary */

SELECT first_name,
       last_name,
       salary
FROM employees
ORDER BY salary DESC;
 
/*** 16 ***/
 /* Display all the distinct commission percentages from the employees table 
    (ensure the commission percentage is non null).  */

SELECT DISTINCT commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
 
 /*** 17 ***/
 /* Display all the employee phone numbers that start with area code 603  */

SELECT phone_number
FROM employees
WHERE phone_number LIKE '603%';
 
 /*** 18 ***/
 /* Display the first name, department id, and salary from employees
    whose name begins with A. 
    Order results by descending department id, and ascending salary;      */
 
SELECT first_name,
       department_id,
       salary
FROM employees
WHERE first_name LIKE 'A%'
ORDER BY department_id DESC, salary ASC;

 
 /*** 19 ***/
 /* Write a query to display the first name, last name, and hire date
    of the employees that have been hired on or after January 1, 2000    */

SELECT first_name,
       last_name,
       hire_date
FROM employees
WHERE hire_date >= '01-JAN-2000';

 

 /*** 20 ***/
 /* Write a query to display an employees first and last name
    (separated by a space) under a single column titled "Employee Name",
    along with their yearly salary (salary * 12) under a column titled 
    "Yearly Salary".
    Only include records with a yearly salary above $200,000.*/

SELECT first_name || ' ' || last_name AS "Employee Name",
       (salary * 12) AS "Yearly Salary"
FROM employees
WHERE (salary * 12) > 200000;

/*** 21 ***/
/* Write a query to display the last name and salary for 
   all employees whose salary falls in the range of $2,500 
   to $2,600 inclusive. Label the columns Poor Employee and 
   Monthly Salary respectively.*/

SELECT last_name AS "Poor Employee",
       salary AS "Monthly Salary"
FROM employees
WHERE salary BETWEEN 2500 AND 2600;


/*** 22 ***/
/* Write a query to display the last name and department 
   number of all employees in departments 60, 70 and 90 
   in alphabetical order by last name */

SELECT last_name,
       department_id
FROM employees
WHERE department_id IN (60, 70, 90)
ORDER BY last_name ASC;

/*** 23 ***/
/* Write a query to display the last names of all employees 
   where the third letter of their name is an e. */

SELECT last_name
FROM employees
WHERE last_name LIKE '__e%';

/*** 24 ***/
/* Write a query to display the first name, last name, salary, and 
   commission for all employees who earn commissions and have a 
   last name beginning with the letter S. Sort data in 
   descending order of salary. */
   
SELECT first_name,
       last_name,
       salary,
       commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
AND last_name LIKE 'S%'
ORDER BY salary DESC;


/*** 25 ***/
/* Find all of the information on  employees who were hired
   before the 1st of January, 1995, and who have a salary of 
   more than 9000. Order the results from highest salary to lowest.   */

SELECT first_name,
       last_name,
       hire_date,
       salary
FROM employees
WHERE hire_date < '01-JAN-1995'
AND salary > 9000
ORDER BY salary DESC;


