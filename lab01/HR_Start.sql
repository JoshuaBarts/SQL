rem
rem Header: hr_main.sql 09-jan-01
rem
rem Copyright (c) 2001, Oracle Corporation.  All rights reserved.  
rem
rem Owner  : ahunold
rem
rem NAME
rem   hr_main.sql - Main script for HR schema
rem
rem DESCRIPTON
rem   HR (Human Resources) is the smallest and most simple one 
rem   of the Sample Schemas
rem   
rem NOTES
rem   Run as SYS or SYSTEM
rem
rem MODIFIED   (MM/DD/YY)
rem   mweston   09/19/03 - modified for use in Comp 258
rem   ahunold   08/28/01 - roles
rem   ahunold   07/13/01 - NLS Territory
rem   ahunold   04/13/01 - parameter 5, notes, spool
rem   ahunold   03/29/01 - spool
rem   ahunold   03/12/01 - prompts
rem   ahunold   03/07/01 - hr_analz.sql
rem   ahunold   03/03/01 - HR simplification, REGIONS table
rem   ngreenbe  06/01/00 - created


SET ECHO ON
--
-- create tables, sequences and constraint
--

@"C:\Users\remuw\Desktop\ICS\ICS 120\Labs\Lab01\hr_cre.sql"

-- 
-- populate tables
--

@"C:\Users\remuw\Desktop\ICS\ICS 120\Labs\Lab01\hr_popul.sql"

--
-- create indexes
--

@"C:\Users\remuw\Desktop\ICS\ICS 120\Labs\Lab01\hr_idx.sql"

--
-- create procedural objects
--

@"C:\Users\remuw\Desktop\ICS\ICS 120\Labs\Lab01\hr_code.sql"

--
-- add comments to tables and columns
--

@"C:\Users\remuw\Desktop\ICS\ICS 120\Labs\Lab01\hr_comnt.sql"



