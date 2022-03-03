/************************************************************************ 
Lecture 10 Exercise
Changing Table Contents
************************************************************************/
--SPOOL M:\ICS120\Exercise\L08_Date_Exercises.txt

SET PAGESIZE 50
SET LINESIZE 120
SET ECHO ON

/************************************************************************
 These exercise require that you have the tables created from the 
 Lecture 10 Changing Table Contents Examples created.
************************************************************************/

/************************************************************************
 Exercise 1
 Use the dept table.
 Write a query to add a new department to the dept table with a department
 number of 2, a name of Remote Site and a location of Portland. 
************************************************************************/

INSERT INTO dept
VALUES (2,'Remote Site','Portland');


/************************************************************************
 Exercise 2
 Use the dept table.
 Write a query to prompt the user to enter a department number and then 
 add only that department number to the dept table. 
************************************************************************/

INSERT INTO dept (deptno)
VALUES (&deptno);


/************************************************************************
 Exercise 3
 Write a query to insert everything from the regions table into the 
 regions1 table.
************************************************************************/

INSERT INTO regions1
SELECT * from regions;


/************************************************************************
 Exercise 4
 Use the emp table.
 Write a query to update the department number of Smith to 3.  
 What happens and why?
************************************************************************/

UPDATE emp
SET deptno = 3
WHERE UPPER(ename) = 'SMITH';

-- department nnumber 3 does not exist in the dept table so their is
-- a primary key constraint violation and the update fails


/************************************************************************
 Exercise 5
 Use the emp table.
 Write a query to set all the deptno to 1.  
 Confirm the query worked.
 Roll back all the changes.
 What is the deptno of Smith and why is it that?
************************************************************************/

UPDATE emp
SET deptno = 1;

SELECT * from emp;

ROLLBACK;

SELECT * from emp;

-- Is set back to 10 as it also rolled back our query from #3.


/************************************************************************
 Exercise 6
 Use the regions1 table.
 Delete the row for region id 1.
************************************************************************/

DELETE FROM regions1
WHERE region_id = 1;


/************************************************************************
 Exercise 7
 Create a save point called SP1.
 Delete all the rows from the regions1 table.
 Confirm that the regions1 table is empty.
 Recovery to the SP1 savepoint.
 Confirm that the data has been restored.
************************************************************************/

SAVEPOINT SP1;

DELETE FROM regions1;

SELECT * from regions1;

ROLLBACK TO SP1;

SELECT * from regions1;



SPOOL OFF