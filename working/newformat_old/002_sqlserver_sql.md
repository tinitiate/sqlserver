# SQLServer SQL Training
> (c) Tinitiate.com / Venkata Bhattaram


## Database, Schema and User
* Sql server software is called the instance
* In an **instance** we can create multiple **databases**
* Each **database** has logical grouping of database objects called **schema**
* The schema within a database can be accessed by **users**, which  are the individual user logins.

### Create Database
* Login with ADMIN username and password and run the follow commands
```sql
create database tinitiate;
alter database [tinitiate] set containment = partial;
```
### Create Database User
* Create User in a Database
```sql
-- Use the Database where you want to create the USER
--
-- STEP 1.
use tinitiate;

-- STEP 2.
exec sp_configure 'contained database authentication', 1

-- STEP 3.
reconfigure

-- STEP 4.
alter database [tinitiate] set containment = partial;

-- STEP 5.
create user tiuser with password = 'Tinitiate!23';
create user developer with password = 'Tinitiate!23';
```

### Create Database Schema and Add user
* Create User in a Database
```sql
-- Use the Database where you want to create the SCHEMA
--
use tinitiate;
go

create schema employees authorization dbo;
alter authorization on schema::employees to tiuser;
```


## DDL
* Data definition language

```sql
-- Schema DDL
CREATE SCHEMA emp;
ALTER SCHEMA emp OWNER TO tinitiate;

-- Set the schema where you want to create the DB objects
set search_path='emp'

-- DDL
-- Table DEPT
create table dept (
    deptid  integer
   ,dname   varchar(100)
);
-- Add Primary Key 
alter table dept add constraint pk_dept primary key (deptid);


-- Table EMP
create table emp (
    empid    integer
   ,ename    varchar(100)
   ,sal      decimal(7,2)
   ,deptid   integer
);

-- Add Primary Key 
alter table emp add constraint pk_emp primary key (empid);

-- Add Foreign Key
alter table emp add constraint fk_emp_deptid foreign key (deptid) references dept(deptid);


create table projects (
    ProjectID      integer
    ,ProjectName    varchar(100)
    ,ProjectBudget   decimal(12,2)
);
-- Add Primary Key 
alter table projects add constraint pk_projects PRIMARY key (ProjectID);


create table EmpProjects (
 EP_ID       integer
,EmpID       integer
,ProjectID   integer
,StartDate   date 
,EndDate     date
);

-- Add Primary Key 
alter table EmpProjects add constraint pk_EmpProjects PRIMARY key (EP_ID);

-- Add Foreign Key
ALTER TABLE EmpProjects ADD CONSTRAINT FK_ep_emp FOREIGN KEY (EmpID) REFERENCES emp(EmpID);
ALTER TABLE EmpProjects ADD CONSTRAINT FK_ep_projects FOREIGN KEY (ProjectID) REFERENCES projects(ProjectID);   

```

## DDL Scenarios Table
* Here we demonstrate various DDL Scenarios on the table below
```sql
create table emp_ddl_tester_tab (
     empid           int
    ,ename           varchar(100)
    ,salary          decimal(12,2)
    ,bonus           decimal(12,2)
    ,publicid        int
    ,project_opt_out varchar(100)
);
```
* On the above test table do the following:
    * Rename Table 
        * Write alter to rename `emp_ddl_tester_tab` to `emp_ddl_tester`
    * Add column `project_opt_out int`
    * Change datatype of `project_opt_out` to `varchar(100)`
    * Add constraint
        * Write alter to add check constraint to make sure bonus is always <= 50% of bouns, show test case with insert and update.
        * Write alter to add check constraint to add list of values for `project_opt_out` to **THREE** values ('YES','NO','N/A')
    * Remove constraint
        * Alter table to remove check constraint on bonus and write test for insert and update
    * Remove column
        * Write alter to remove `publicid` column
    * Add column to Primary Key
        * Write alter to add `ename` column to Primary Key

## DML
* Data manipulation language

```sql
-- DML
-- Insert DEPT rows
-- ---------------------------------------------------------
insert into dept values(1,'SALES');
insert into dept values(2,'MKTG');
insert into dept values(3,'IT');
insert into dept values(4,'Admin');
insert into dept values(5,'Finance');

-- Incorrect Row data
-- PK Violation
insert into dept values(1,'AAAA');

-- Data Violation
insert into dept values(6,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

-- Insert EMP rows
-- ---------------------------------------------------------
insert into emp values(1,'B1',2000.00,2);
insert into emp values(2,'B',2000.00,2);
insert into emp values(3,'C',1000.00,3);
insert into emp values(4,'D',2000.00,4);
insert into emp values(5,'A',1000.00,1);
insert into emp values(6,'BB1',2000.00,2);
insert into emp values(7,'BQ',2000.00,2);
insert into emp values(8,'CW',1000.00,3);
insert into emp values(9,'DE',2000.00,4);
insert into emp values(0,'AR',1000.00,1);
insert into emp values(12,'1B',12000.00,2);
insert into emp values(13,'2C',21000.00,3);
insert into emp values(14,'3D',32000.00,4);
insert into emp values(15,'4A',11000.00,1);

-- Incorrect Row data
-- FK violation
insert into emp values(16,'4A',11000.00,6);

-- Insert PROJECTS rows
-- ---------------------------------------------------------
insert into projects values (1,'INTERNAL1','1200000.00');
insert into projects values (2,'EXTERNAL1','5000000.00');
insert into projects values (3,'EXTERNAL2','5000000.00');

-- Insert for EmpProjects
-- ---------------------------------------------------------
insert into EmpProjects values (1,1,1,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (2,1,2,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (3,2,1,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (4,3,1,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (5,4,3,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (6,1,3,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (7,1,3,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
insert into EmpProjects values (8,3,2,to_date('1,5,2019','%d,%m,%Y'),to_date('31,10,2020','%d,%m,%Y'));
```

## DQL
* Data Query language


##  Select Basics
* Selecting Wildchar * , all columns, specific
```sql
-- DSL
-- ALL columns  = *
select *
from   dept;

-- Specific columns
select deptid,dname
from   dept;

-- columns and psuedo values (values not from a table-column)
select deptid,dname,'AAA' some_string, 1 as some_int,12.3 some_decimal, 44
from   dept;

select deptid
from   emp;
```
* **DISTINCT** keyword
```sql
-- get distinct values
select distinct deptid
from   emp;
```
* **FILTER** with JOIN
```sql
select *
from   emp
where  ename = 'B1'; -- Filter by ENAME

select *
from   emp
where  ename = 'b1';  -- Remember String Data is CASE Sensitive

```
* **FILTER** with IN and NOT IN
```sql
-- IN / NOT IN
select *
from   emp
where  ename in ('B1','A');

select *
from   emp
where  ename not in ('B1','A');
```


## JOINS
* Inner Join
```sql
-- Get the Dept name of emp 'A'
select dept.dname
from   dept,emp
where  emp.ename = 'A'           -- FILTER
and    emp.deptid = dept.deptid  -- JOIN

-- Group By
-- Aggregate Functions returns a single value
select max(sal),min(sal),sum(sal)/count(1),avg(sal)
from   emp

select * from emp order by deptid

select deptid,min(sal),max(sal) 
from   emp 
group by deptid

-- Name of emp who makes the least sal
select min(sal)
from   emp

select ename,e.*
from   emp e
where  e.sal = (select min(sal) from emp)


-- get the name of the dept that makes the highest sal
select d.dname
from   dept d,emp e
where  e.sal = (select max(sal) from emp)
and    e.deptid = d.deptid;


-- Get total sal for empid = 1, for every one project 
-- the employee gets 1000 sal,along with base sal
select * from emp where empid=1;
select * from EmpProjects where empid=1;

select count(ep.empid)*1000 + e.sal
from   emp e, EmpProjects ep
where  e.empid = ep.empid
-- and    ep.empid = 1
and    e.empid = 1
group by e.sal

-- UPDATE
-- update EMP 'A's sal to 1500
update emp
set    sal   = 1500
where  ename = 'A';

select * from emp

-- decrease the highest salary makers sal by 20%
select max(sal) max_sal, max(sal)-max(sal)*.2 new_sal
from   emp    
update emp
set    sal = src.new_sal
from   (select max(sal) max_sal, max(sal)-max(sal)*.2 new_sal
         from   emp ) src
where  sal = src.max_sal;

select max(sal) from emp;
```
* With Clause
* Group BY
* Having
* Order By (desc/asc)
* Partition By
```sql


* Exists clause
* Not Exists clause


## SQL Set Operations
* Set operations

* UNION and UNION ALL

* INTERSECT

* EXCEPT

## SQL code generates a table with four rows
select 1 a,2 b
union 
select 2 a, 4 b
union all
select 1 a,2 b
union
select 1 a,2 b

## INTERSECT operator 
(select 1 a,2 b
union 
select 2 a, 4 b
)
intersect
select 1 a,2 b
```


# Join Types
## left Join
## full outer join


* INNER JOIN: Gets all the matching records from both the left and right tables based on joining
columns.
* LEFT OUTER JOIN: Gets all non-matching records from left table & AND one copy of matching
records from both the tables based on the joining columns.
* RIGHT OUTER JOIN: Gets all non-matching records from right table & AND one copy of
matching records from both the tables based on the joining columns.
* FULL OUTER JOIN: Gets all non-matching records from left table & all non-matching records
from right table & one copy of matching records from both the tables.
* CROSS JOIN: returns the Cartesian product.



# grouping sets
# insert variations ( insert multiple rows)


https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert-multiple-rows/

https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert-multiple-rows/
<https://teams.microsoft.com/l/message/19:c1leaWf862lVfqI0MDcRz4OOvk2YCVhNJorwFlt1tFc1@thread.tacv2/1677784832493?tenantId=f4f13154-6ed3-4ef3-8c50-d87f6e51be71&amp;groupId=18ed908e-b7ba-47d2-bce7-756958919e48&amp;parentMessageId=1677784033736&amp;teamName=AstirOptJan2023&amp;channelName=General&amp;createdTime=1677784832493&amp;allowXTenantAccess=false>


Begin
Commit
Rollback
Savepoint
Set Transaction