SELECT table_name FROM user_tables;

DESC departments;

SELECT * FROM departments;

DESC user_catalog;
DESC user_constraints;
DESC user_cons_columns;
DESC user_indexes;
DESC user_ind_columns;
DESC user_synonyms;
DESC user_tab_columns;
DESC user_col_comments;
DESC user_views;

SELECT table_name, table_type FROM user_catalog;

SELECT owner, constraint_name, constraint_type, table_name FROM user_constraints;

SELECT owner, constraint_name, table_name, column_name FROM user_cons_columns;

SELECT index_name, index_type, table_owner, table_name FROM user_indexes;

SELECT index_name, table_name, column_name, column_position FROM user_ind_columns;

SELECT synonym_name, table_owner, table_name, db_link FROM user_synonyms;

SELECT table_name, column_name, data_type, data_type_mod FROM user_tabs_columns;

SELECT table_name, column_name, comments FROM user_col_comments;

SELECT view_name, text_length, text, type_text_length FROM user_views;

SELECT sysdate, user FROM dual;
SELECT 21-5 FROM dual;
SELECT 21-5+6 FROM dual;


