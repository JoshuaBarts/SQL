-/*********************************************************************************
Assignment - Lab 5  Aggregating Data and Subqueries
By <give your name>
Lab Section: ??
**********************************************************************************/

set pagesize 40
set linesize 200



/***********************************************/
/***                                         ***/
/*** Part 1 Using Group function in SQL      ***/
/***                                         ***/
/***********************************************/
 
/*********************************************************************************
 Question 1
 Write a query to display the number of people with the same job. Use JOB_ID 
 in your query and list the jobs by JOB_ID along with the number of people having
 that job.
**********************************************************************************/ 

SELECT job_id,
       COUNT(*)
FROM employees
GROUP BY job_id;



/*********************************************************************************
 Question 2
 Display the highest, lowest, sum, and average salary of all employees. Label 
 the columns Maximum, Minimum, Sum, and Average, respectively (note the use of 
 upper and lower case in the lables). Round your results to the nearest whole number.
**********************************************************************************/ 

SELECT ROUND(MAX(salary), 0) AS "Maximum",
       ROUND(MIN(salary), 0) AS "Minimum",
       ROUND(SUM(salary), 0) AS "Sum",
       ROUND(AVG(salary), 0) AS "Average"
FROM employees;


 
/*********************************************************************************
 Question 3
 Modify the above (#2) to display the maximum, minimum, sum, and average 
 salary for each job type  (assume each job_id represents a job type). Be 
 sure to give the job type in your output.
**********************************************************************************/ 

SELECT job_id AS "Job Type",
       ROUND(MAX(salary), 0) AS "Maximum",
       ROUND(MIN(salary), 0) AS "Minimum",
       ROUND(SUM(salary), 0) AS "Sum",
       ROUND(AVG(salary), 0) AS "Average"
FROM employees
GROUP BY job_id;



/*********************************************************************************
 Question 4
 Display the manager number and the salary of the lowest paid employee for 
 that manager. Exclude anyone whose manager is not known - in other words, 
 exclude anyone who has a NULL manager_id. Sort by manager id.
**********************************************************************************/ 

SELECT manager_id,
       MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id ASC;



/*********************************************************************************
 Question 5
 Modify your query from above (#4) to exclude any groups where the minimum 
 salary is less than or equal to $6,000. Sort the output in descending order of 
 salary. 
**********************************************************************************/ 

SELECT manager_id,
       MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) < 6000
ORDER BY MIN(salary) DESC;




/***********************************************/
/***                                         ***/
/*** Part 2 Using Subqueries                 ***/
/***                                         ***/
/***********************************************/
 
/*********************************************************************************
 Question 6
 Create a query to display the employee numbers, last names and salaries of all 
 employees who earn more than the average salary and whose last_name begins with
 a 'G' or 'P' (be sure to handle case). Sort the results in descending order of salary. 
 Hint Ensure you use brackets around or AND and OR clauses in the WHERE clause.
**********************************************************************************/ 

SELECT employee_id,
       last_name,
       salary
FROM employees
WHERE salary >
      (SELECT AVG(salary)
       FROM employees)
AND (UPPER(last_name) LIKE 'G%'
OR UPPER(last_name) LIKE 'P%')
ORDER BY salary DESC;



/*********************************************************************************
 Question 7
 Write a query that will display the last name and salary of every employee who 
 reports to Gerald Cambrault. (There is more than one Cambrault in the database 
 so you must be careful to check the first name too.) Be sure to handle case. 
**********************************************************************************/ 

SELECT last_name,
       salary
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE UPPER(first_name) = 'GERALD' 
                    AND UPPER(last_name) = 'CAMBRAULT');



/*********************************************************************************
 Question 8
 How many people work in the same department as Gerald Cambrault?  Write a query 
 to count the number employees in Gerald's department.  Exclude Gerald from your 
 count. (Remember, there is more than one Cambrault in the database so be sure to
 check the first name too.) 
**********************************************************************************/


SELECT COUNT(e.employee_id) AS "Number of employees",
       d.department_name
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id)
WHERE e.department_id = 
      (SELECT department_id
       FROM employees
       WHERE UPPER(first_name) = 'GERALD'
       AND UPPER(last_name) = 'CAMBRAULT')
AND NOT (UPPER(first_name) = 'GERALD' AND UPPER(last_name) = 'CAMBRAULT')
GROUP BY department_name;

/*********************************************************************************
 Question 9
 Write a query to display the department IDs, employee IDs, last names, and salaries
 of all employees who earn more than twice (2 times) the average salary for the company,
 and who work in a department with any employee with a "u" anywhere in their last name. 
 Order your output by employee IDs. 
**********************************************************************************/ 

SELECT department_id,
       employee_id,
       last_name,
       salary
FROM employees
WHERE department_id IN (SELECT department_id
                        From employees
                        WHERE last_name LIKE '%u%')
AND salary > (SELECT AVG(salary)*2
              FROM employees)
ORDER BY employee_id ASC;



--SPOOL OFF

/***********************************************/
/***                                         ***/
/***          End of SQL script              ***/
/***                                         ***/
/***********************************************/