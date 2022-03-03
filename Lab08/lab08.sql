/*** Q1 ***/
CREATE TABLE new_students (
    temp_id NUMBER(5),
    prog_id CHAR(4),
    fname VARCHAR2(25),
    lname VARCHAR2(25),
    reg_date DATE
);

/*** Q2 ***/
ALTER TABLE new_students
    ADD created_by VARCHAR2(30) NOT NULL
    ADD created_date  DATE DEFAULT SYSDATE;

/*** Q3 ***/
DESC new_students;

/*** Q4 ***/    
SELECT constraint_name,
       constraint_type,
       search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS';

/*** Q5 ***/
CREATE TABLE programmes (
    prog_id CHAR(4),
    prog_desc VARCHAR2(30)
);

/*** Q6 ***/
INSERT INTO new_students(temp_id, prog_id, fname, lname, reg_date, created_by)
VALUES (9516, 'comp', 'Ted', 'Codd', sysdate, user);

INSERT INTO programmes(prog_id, prog_desc)
VALUES ('comp', 'Computer Technology');

/*** Q7 ***/
SELECT *
FROM new_students;

SELECT *
FROM programmes;

/*** Q8 ***/
ALTER TABLE programmes
   ADD CONSTRAINT prog_id_pk PRIMARY KEY (prog_id);
   
/*** Q9 ***/
ALTER TABLE new_students
    ADD CONSTRAINT tempid_progid_pk PRIMARY KEY (temp_id, prog_id);
    
/*** Q10 ***/
ALTER TABLE new_students
    ADD CONSTRAINT prog_id_fk FOREIGN KEY (prog_id)
    REFERENCES programmes (prog_id);
    
/*** Q11 ***/
SELECT constraint_name,
       constraint_type,
       search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS'
OR table_name = 'PROGRAMMES'
ORDER BY table_name;

/*** Q12 ***/
INSERT INTO new_students(temp_id, prog_id, fname, lname, reg_date, created_by)
VALUES (9517, 'econ', 'Bill', 'Gates', sysdate, user);

/*** Q13 -- I'm inserting a child without a matching parent ***/

/*** Q14 ***/
ALTER TABLE new_students
ADD CONSTRAINT dates_ck
CHECK (reg_date > TO_DATE('1997-01-01', 'YYYY-MM-DD'));

/*** Q15 ***/
INSERT INTO new_students(temp_id, prog_id, fname, lname, reg_date, created_by)
VALUES (9519, 'comp', 'Grace', 'Hopper', TO_DATE('1948-01-02', 'YYYY-MM-DD'), user);

/*** Q16 -- I ADDED A CONSTRAINT FOR REG_DATE ***/

/*** Q17 ***/
INSERT INTO new_students(temp_id, prog_id, fname, lname, reg_date, created_by)
VALUES (9519, 'comp', 'Grace', 'Hopper', TO_DATE('2018-01-02', 'YYYY-MM-DD'), user);

/*** Q18 ***/
SELECT constraint_name,
       constraint_type,
       search_condition
FROM user_constraints
WHERE table_name = 'NEW_STUDENTS'
OR table_name = 'PROGRAMMES'
ORDER BY table_name;


/*** Q19 ***/
DROP TABLE new_students PURGE;
DROP TABLE programmes PURGE;

