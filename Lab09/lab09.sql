/*** Q1 ***/
CREATE TABLE mytextbook (
    text_id NUMBER(5),
    text_name VARCHAR2(25),
    text_author VARCHAR2(50),
    text_publisher VARCHAR2(25),
    faculty_ref NUMBER(5)
);

/*** Q2 ***/
INSERT INTO mytextbook(text_name, text_author, text_publisher, faculty_ref)
    VALUES('All computers', 'Know It All', 'Self', 3);

INSERT INTO mytextbook(text_name, text_author, text_publisher, faculty_ref)
    VALUES('No homework!', 'Tired Student', 'Publish', 1);
    
/*** Q3 ***/
CREATE SEQUENCE textbook_seq
    INCREMENT BY 1
    START WITH 22
    MAXVALUE 100
    NOCYCLE
    NOCACHE;

/*** Q4 ***/
UPDATE mytextbook
SET text_id = textbook_seq.NEXTVAL;


/*** Q5 ***/
DESC user_sequences;

SELECT sequence_name,
       max_value,
       increment_by,
       last_number
FROM user_sequences
WHERE sequence_name = 'TEXTBOOK_SEQ';

/*** Q6 ***/
ALTER TABLE mytextbook
    ADD CONSTRAINT text_id_pk PRIMARY KEY (text_id);

/*** Q7 ***/
INSERT INTO mytextbook(text_id, text_name, text_author, text_publisher, faculty_ref)
    VALUES(TEXTBOOK_SEQ.nextval, 'Relational Databases', 'Ted Codd', 'IT', 2);

INSERT INTO mytextbook(text_id, text_name, text_author, text_publisher, faculty_ref)
    VALUES(TEXTBOOK_SEQ.nextval, 'The greatest book ever', 'Joshua Bartolome', 'Publish', 1);

/*** Q8 ***/
SELECT text_id,
       text_author
FROM mytextbook;

/*** Q9 ***/
CREATE INDEX textname_idx ON mytextbook(text_name);

/*** Q10 ***/
DESC user_indexes;

SELECT index_name,
       index_type,
       uniqueness
FROM user_indexes
WHERE table_name = 'MYTEXTBOOK';


/*** Q11 ***/
CREATE SYNONYM text FOR mytextbook;

/*** Q12 ***/
SELECT text_id,
       text_author
FROM text;

/*** Q13 ***/
DESC user_synonyms;

SELECT synonym_name
FROM user_synonyms;

/*** Q14 ***/
DROP TABLE mytextbook PURGE;
DROP SEQUENCE textbook_seq;
DROP SYNONYM text;