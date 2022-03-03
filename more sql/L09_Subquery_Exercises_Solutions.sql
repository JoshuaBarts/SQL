/************************************************************************ 
Lecture 09 Exercise
Subqueries


Note - Write these queries using subqueries when ever ppossible instead 
       of doing joins

************************************************************************/
--SPOOL M:\ICS120\Exercise\L08_Date_Exercises.txt

SET PAGESIZE 50
SET LINESIZE 120
SET ECHO ON


/************************************************************************
 Exercise 1
 Using a subquery, find out the number of employees who make less than 
 the average salary
************************************************************************/

SELECT COUNT(*)
FROM employees
WHERE salary < 
	(SELECT AVG(salary)
	 FROM employees);


SELECT last_name, salary
FROM employees
WHERE salary < 
	(SELECT AVG(salary)
	 FROM employees);


/************************************************************************
 Exercise 2
 Multi-row Subquery
 Find any employee whoes name starts with a T and is in a department where 
 the average salary in the  department is < 5000.  Print out their name, 
 department and salary. Order the report by employee last name.
 HINT: Have the subquery return a list of departments that have an average
       salary of < 5000.
************************************************************************/

SELECT last_name, department_id, salary
FROM employees
WHERE UPPER(last_name) LIKE 'T%' AND
      department_id IN (SELECT department_id
                        FROM employees
                        GROUP BY department_id
                        HAVING AVG(salary) < 5000)  
ORDER BY last_name ;


/************************************************************************
 Exercise 3
 Print a report for all employee whose last names starts with B, showing 
 the employee's last names, their salary, their manager's last name and the 
 average  salary for all the employees under their manager. Order the
 report by employee last name asending.
 HINT: Have a subquery that returns a table containing each manager's id,
       their last name and the average salary of all their employees.
************************************************************************/

SELECT e.last_name Employee, 
       salary, 
       "Manager Name", 
       TO_CHAR(avg_emp_salary, 'FM$999,999.00') AS "MGR Average"
FROM employees e, 
      (SELECT e2.manager_id, 
              e3.last_name AS "Manager Name", 
              AVG(e2.salary) avg_emp_salary
        FROM employees e2, 
             employees e3
        WHERE e2.manager_id=e3.employee_id
        GROUP BY e2.manager_id, e3.last_name) m
WHERE e.manager_id = m.manager_id AND 
      e.last_name LIKE 'B%'
ORDER by e.last_name asc;


/************************************************************************
 Exercise 4
 Print out all employees that are in a department, where there are multiple
 departments in the same location.
************************************************************************/

--- Find out which locations have multiple departments at that location ---
select location_id
from  departments 
group by location_id
having count(*) > 1;

--- Find out what departments are at that location, use IN in case there are multiple locations ---
select department_id
from departments
where location_id IN (select location_id
	from  departments 
	group by location_id
	having count(*) > 1);


--- How find the employees that are in those departments ---
select first_name, last_name, department_id
from employees
where department_id IN (select department_id
	from departments
	where location_id IN (select location_id
		from  departments 
		group by location_id
		having count(*) > 1));


/************************************************************************
 Exercise 5
 Take the previous question, add the location id for each employee and sort
 the results by location id, department id and employee last name all in ascending 
 order.
************************************************************************/
select e.first_name, e.last_name, department_id, d.location_id
from employees e inner join departments d using(department_id)
where department_id IN (select department_id
	from departments
	where location_id IN (select location_id
		from  departments 
		group by location_id
		having count(*) > 1))
order by d.location_id asc, department_id asc, e.last_name asc;



/************************************************************************
 Exercise 6
 List the names of all current employees that have had at least 2 previous 
 positions.
************************************************************************/

--- get those employees that have had more than 2 previous positions ---
select employee_id
from job_history
group by employee_id
having count(*) >= 2;

--- select the current employees who are in the previous list ---
select employee_id,last_name, first_name
from employees
where employee_id IN (select employee_id
	from job_history
	group by employee_id
	having count(*) >= 2);



/************************************************************************
 Exercise 7
 List the names of the current employee(s) that have held the most 
 number of positions.
************************************************************************/

--- Get the max number of positions that any employee has had ---
select max(count(*))
from job_history
group by employee_id;

--- Get those employees that have had that maximum ---
select employee_id
from job_history
group by employee_id
having count(*) = (select max(count(*))
	from job_history
	group by employee_id);

--- See if the current employees are in that list ---
select employee_id, last_name, first_name
from employees
where employee_id IN (select employee_id
from job_history
group by employee_id
having count(*) = (select max(count(*))
	from job_history
	group by employee_id));


SPOOL OFF