-- ICS120  Lecture 11 Create Tables Examples
--         SQL Examples

set pagesize 40
set linesize 120


--
-- Setup
--

DROP TABLE dept CASCADE CONSTRAINTS PURGE;
DROP TABLE dept1 CASCADE CONSTRAINTS PURGE;
DROP TABLE dept_new CASCADE CONSTRAINTS PURGE;



--
-- Slide 14 --
--

CREATE TABLE dept
   (deptno NUMBER(2),
    dname  VARCHAR2(14),
    loc    VARCHAR2(13));

DESC dept;

--
-- Slide 18 --
--

INSERT INTO dept VALUES (1,'Dept1','Victoria');
INSERT INTO dept VALUES (2,'Dept2','Vancouver');

--
-- Slide 19 --
--

CREATE TABLE dept2
AS
  (SELECT dname,loc
   FROM dept
   WHERE deptno = 2);

DESC dept2;

SELECT * FROM dept2;

--
-- Slide 23 --
--

ALTER TABLE dept2
   ADD (job  VARCHAR2(9));

DESC dept2;

--
-- Slide 24 --
--

ALTER TABLE dept2
   MODIFY (dname  VARCHAR(20));

DESC dept2;

--
-- Slide 25 --
--

ALTER TABLE dept2
   DROP COLUMN job;

DESC dept2;

ALTER TABLE dept2
   ADD (JOB  VARCHAR2(9));

ALTER TABLE dept2
   DROP (dname, job);

DESC dept2;

--
-- Slide 26 --
--

ALTER TABLE dept2
   RENAME COLUMN loc to LOCATION;

DESC dept2;

--
-- Slide 27 --
--

DROP TABLE dept2 PURGE;

DESC dept2;


--
-- Slide 29 --
--
PURGE RECYCLEBIN;

SHOW RECYCLEBIN;

CREATE TABLE one_col (last_name 	VARCHAR2(25));

DESC one_col;


DROP TABLE one_col;

SHOW RECYCLEBIN;

PURGE TABLE one_col;

SHOW RECYCLEBIN;



--
-- Slide 30 --
--
CREATE TABLE one_col 
	(last_name VARCHAR2(25));

SHOW RECYCLEBIN;

DROP TABLE one_col;

SHOW RECYCLEBIN;

FLASHBACK TABLE one_col TO BEFORE DROP;

DESCRIBE one_col;


--
-- Slide 31 --
--
RENAME dept TO dept_new;

DESCRIBE dept_new;



--
-- Slide 32 --
--
SELECT * from dept_new;

TRUNCATE TABLE dept_new;

SELECT * from dept_new


--
-- Slide 33 --
--
COMMENT ON TABLE dept_new 
    IS 'Department Information';

SELECT * FROM USER_TAB_COMMENTS WHERE
  TABLE_NAME = ‘DEPT_NEW';


--
-- Slide 34 --
--
COMMENT ON TABLE dept_new 
    IS 'Department Information';

SELECT * FROM USER_TAB_COMMENTS WHERE
  TABLE_NAME = 'DEPT_NEW';



--
-- Slide 35 --
--
SELECT	* FROM USER_TABLES;
SELECT  * FROM USER_OBJECTS;
SELECT  * FROM USER_CATALOG;


