![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL Server DML Insert

## Insert statement
* Insert DML Data Manipulation Language
```sql
-- Insert with column created order
insert into employees.dept (deptid,dname) values (1000,'PRODUCTION');

-- Insert with column names, use positional values
INSERT into employees.DEPT values (2000,'FOUNDRY');

-- Insert with column names, different order
INSERT into employees.DEPT (dname, deptid) values ('STORES',3000);
```
* Incorrect data
```sql
-- PK violation, will fail
INSERT into employees.DEPT (deptid,dname) values (1,'MARKETNNG');

-- DataType Size violation, will fail
INSERT into employees.DEPT (deptid,dname) values (-1,'SUPER AWESOME SALES');

-- Data issue (same dept name) 
-- Check Data when doing analysis or 
-- working with manageable data sets
INSERT into employees.DEPT (deptid,dname) values (-2,'SALES');
INSERT into employees.DEPT (deptid,dname) values (-1,1); -- Data Issue
```
* Insert all, Insert more data in single insert
```sql
INSERT into employees.DEPT (deptid, dname)
values  (111,'TECHNOLOGY')
       ,(211,'FACTORY')
       ,(311,'RETAIL')
;
```
* Insert with select statement
```sql
create table employees.dept1 (deptid int, dname varchar(100));

insert into employees.dept1
select *
from   employees.dept;
```
