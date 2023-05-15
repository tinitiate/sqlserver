![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL SERVER DDL
> Venkata B / Tinitiate.com

## DDL
* Data Definition Language (DDL) is a set of SQL statements that are used to define the structure of a database. DDL statements are used to create, alter, and drop database objects such as tables, views, stored procedures, and functions.
* Some of the most common DDL statements in SQL Server include:
  * CREATE TABLE: This statement is used to create a new table in a database.
  * ALTER TABLE: This statement is used to modify the structure of an existing table.
  * DROP TABLE: This statement is used to delete a table from a database.
* DDL statements are used to create the schema of a database, which is the blueprint for the database. The schema defines the structure of the data that will be stored in the database, as well as the relationships between the different data elements.

## Employee Schema
```sql
use employees;
```
### Drop and ReCreate Tables
* **Drop tables if exists (if needed).**
```sql
--drop table will drop the table from schema
--
drop table employees.emp;
drop table employees.dept;
drop table employees.salgrade
drop table employees.projects;
drop table employess.emp_projects;
```

* **Create Employee Schema Tables**
* * *
* DDL for employees.dept
```sql
-- employees.dept
create table employees.dept
( 
  deptno int not null
 ,dname  varchar(14)
 ,loc    varchar(13)
);

-- Primary Key constraint for employees.dept on deptno
alter table employees.dept add constraint pk_dept primary key(deptno);

```

* DDL for employees.emp
```sql
create table employees.emp
( empno      int not null
 ,ename      varchar(10)
 ,job        varchar(9)
 ,mgr        numeric(4)
 ,hiredate   date
 ,sal        numeric(7,2)
 ,commission numeric(7,2)
 ,deptno     int not null
);

-- Primary Key constraint for employees.emp on empno
alter table employees.emp add constraint pk_empno primary key(empno);

-- Foreign key constraint for employees.emp.deptno referring employees.dept.deptno
alter table employees.emp add constraint fk_deptno foreign key(deptno) references employees.dept(deptno);

```

* DDL for employees.salgrade
```sql
create table employees.salgrade
( grade int not null
 ,losal int
 ,hisal int
);

-- Primary Key constraint for employees.salgrade on grade
alter table employees.salgrade add constraint pk_grade primary key(grade);
```

* DDL for employees.projects
```sql
create table employees.projects
( projectno           int not null
 ,budget              numeric(7,2)
 ,monthly_commission  numeric(7,2)
);

-- Primary Key constraint for employees.projects on projectno
alter table employees.projects add constraint pk_projectno primary key(projectno);
```

* DDL for employees.emp_projects
```sql
--create fifth table emp_projects in employees schema
create table employees.emp_projects
( emp_projectno  int not null
 ,empno          int not null
 ,projectno      int not null
 ,start_date     date
 ,end_date       date
);

-- Primary Key constraint for employees.emp_projects on emp_projectno
alter table employees.emp_projects add constraint pk_emp_projectno primary key(emp_projectno);

-- Foreign key constraint for employees.emp_projects.empno referring employees.emp.empno
alter table employees.emp_projects add constraint fk_empno foreign key(empno) references employees.emp(empno);

-- Foreign key constraint for employees.emp_projects.projectno referring employees.projects.projectno
alter table employees.emp_projects add constraint fk_projectno foreign key(projectno) references employees.projects(projectno);
```
