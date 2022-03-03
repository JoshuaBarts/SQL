/*** Q1 ***/
desc hr.employees;
CREATE TABLE employees_new
AS SELECT *
FROM hr.employees;

/*** Q2 ***/
CREATE VIEW employees_vw
AS SELECT employee_id, 
          first_name || ' ' || last_name AS "empname",
          department_id
FROM employees_new;

/*** Q3 ***/
SELECT *
FROM employees_vw
WHERE department_id = 90;

/*** Q4 ***/
DESC user_views;
SELECT view_name,
       text
FROM user_views
WHERE view_name = 'EMPLOYEES_VW';

/*** Q5 ***/
GRANT SELECT ON employees_vw TO ics120;

/*** Q6 ***/
CREATE VIEW dept50_vw
AS SELECT employee_id AS "empno",
          last_name AS "employee",
          department_id AS "deptno"
FROM employees_new
WHERE department_id = 50
WITH CHECK OPTION CONSTRAINT emp_50;

/*** Q7 ***/
DESC dept50_vw;

SELECT *
FROM dept50_vw
WHERE rownum <= 10;

/*** Q8 ***/
UPDATE dept50_vw
SET deptno = 80
WHERE employee = 'Weiss';

/*** Q9 *** -- I did not allow an employee to be reassigned to another dept./

/*** Q10 ***/
GRANT SELECT ON dept50_vw TO PUBLIC;

/*** Q11 ***/
SELECT view_name,
       text
FROM user_views;

/*** Q12 ***/
SELECT *
FROM user_tab_privs_made;

/*** Q13 ***/
REVOKE SELECT ON employees_vw FROM ics120;
REVOKE ALL ON dept50_vw FROM PUBLIC;

/*** Q14 ***/
SELECT *
FROM user_tab_privs_made;

/*** Q15 ***/
DROP VIEW employees_vw;
DROP VIEW dept50_vw;

DROP TABLE employees_new;

/*****************/

/** GENERATE DDL **/
-- Generated by Oracle SQL Developer Data Modeler 18.2.0.179.0806
--   at:        2021-04-08 11:29:14 PDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE course (
    course_id     VARCHAR2(10) NOT NULL,
    course_name   VARCHAR2(25)
);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( course_id );

CREATE TABLE grade (
    grade        VARCHAR2(2),
    student_id   NUMBER(3) NOT NULL,
    course_id    VARCHAR2(10) NOT NULL
);

CREATE TABLE student (
    student_id     NUMBER(3) NOT NULL,
    student_name   VARCHAR2(25)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( student_id );

ALTER TABLE grade
    ADD CONSTRAINT grade_course_fk FOREIGN KEY ( course_id )
        REFERENCES course ( course_id );

ALTER TABLE grade
    ADD CONSTRAINT grade_student_fk FOREIGN KEY ( student_id )
        REFERENCES student ( student_id );


/*** INSERTS ***/
INSERT INTO STUDENT(student_id, student_name)
VALUES(1, 'John Smith');

INSERT INTO STUDENT(student_id, student_name)
VALUES(2, 'Jane Doe');

INSERT INTO COURSE(course_id, course_name)
VALUES('ICS112', 'Intro to Programming');

INSERT INTO COURSE(course_id, course_name)
VALUES('ICS122', 'Data Algorithms');

INSERT INTO COURSE(course_id, course_name)
VALUES('MATH170', 'Linear Algebra');

INSERT INTO COURSE(course_id, course_name)
VALUES('ENG123', 'Technical Writing');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('A-', 1, 'ICS112');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('C', 1, 'ICS122');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('C', 1, 'MATH170');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('B', 2, 'ICS112');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('B+', 2, 'MATH170');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('A+', 2, 'ENG123');

INSERT INTO GRADE(grade, student_id, course_id)
VALUES('A-', 2, 'ICS112');

DROP TABLE GRADE PURGE;
DROP TABLE COURSE PURGE;
DROP TABLE STUDENT PURGE;

