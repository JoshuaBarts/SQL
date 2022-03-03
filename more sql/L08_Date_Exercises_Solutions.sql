/************************************************************************ 
Lecture 08 Exercise
Dates
************************************************************************/
--SPOOL M:\ICS120\Exercise\L08_Date_Exercises.txt

SET PAGESIZE 50
SET LINESIZE 120
SET ECHO ON

/************************************************************************
 Exercise 1  
 Find the number of months that have elapsed since Nov 1st, 2012. Round 
 your result to the nearest month. Create a heading "Number of Months" 
 to display the result.
************************************************************************/

SELECT ROUND(MONTHS_BETWEEN(SYSDATE, '01-Nov-12')) 
	AS "Number of Months"
FROM dual;


/************************************************************************
 Exercise 2 
 Find the date of hire for employees in the 'IT' department who were hired
 before Jan 01, 1998. Display last name, department name and date of hire.
 Display the date as, for example, 'November 28th, 2017'.  Use the heading 
 "Date of Hire" to display the date.
************************************************************************/

--- SQL/86 --
COLUMN "Date of Hire" FORMAT A25
COLUMN last_name FORMAT A20
COLUMN department_name FORMAT A20

SELECT last_name, 
       department_name, 
       TO_CHAR(hire_date, 'Month ddth, YYYY') AS "Date of Hire"
FROM employees e,
     departments d
WHERE e.department_id = d.department_id AND 
      hire_date < '01-JAN-98' AND
      UPPER(department_name) = 'IT';

--- SQL/92 --
COLUMN "Date of Hire" FORMAT A25
COLUMN last_name FORMAT A20
COLUMN department_name FORMAT A20

SELECT last_name, 
       department_name, 
       TO_CHAR(hire_date, 'Month ddth, YYYY') AS "Date of Hire"
FROM employees e INNER JOIN departments d USING(department_id)
WHERE hire_date < '01-JAN-98' AND
      UPPER(department_name) = 'IT';

CLEAR COLUMNS



/************************************************************************
 Exercise 3 
 Find out how long, in years, each employee has worked. Restrict your results 
 to the Finance department. Round your result to two decimal places.
 Display as "Years Employed" and sort from oldest to newset employee.
************************************************************************/

--- SQL/86 --
SELECT last_name, 
       department_name, 
       ROUND(ABS(MONTHS_BETWEEN(hire_date, SYSDATE)/12), 2) AS "Years Employed"
FROM employees e,
     departments d
WHERE e.department_id = d.department_id AND
      UPPER(department_name) = 'FINANCE'
ORDER BY "Years Employed" DESC;

--- SQL/92 --
SELECT last_name, 
       department_name, 
       ROUND(ABS(MONTHS_BETWEEN(hire_date, SYSDATE)/12), 2) AS "Years Employed"
FROM employees e INNER JOIN departments d
     USING(department_id)
WHERE UPPER(department_name) = 'FINANCE'
ORDER BY "Years Employed" DESC;





SPOOL OFF