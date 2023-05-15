![Tinitiate SQLSERVER Training](images/sqlserver.png)
# SQL SERVER VIEWS

In SQL SERVER, a **view** is a virtual table that is based on the result of a SQL SELECT statement. Views do not store data themselves, but rather provide a way to organize and present data stored in one or more tables or other views.

A database **view** is essentially a saved SQL query, which allows you to retrieve a specific set of data from one or more tables in the database. When a user queries the **view**, the database engine retrieves the data from the underlying tables that make up the view and presents it as if it were a table itself.

**Query the View like a table with a select statement**

**Views** can be used to simplify database design by hiding complex queries or data relationships, provide a layer of abstraction to protect sensitive data, or to create customized access to data for different users or groups.
Views can also be used to improve performance by precomputing the results of a complex query and caching them for future use.

* Simple View (On One Table)
```SQL
-- Simple View (On One Table)
-- Show All employees from SALES dept
-- -----------------------------------
create or alter view sales_employees_sv
as
select  e.empno,e.ename,e.job,e.mgr,e.hiredate
       ,e.sal,e.commission
from   employees.emp e
where  e.deptno  = 1;
```

* Complex View (With Joins)
```sql
-- Complex View (With Joins)
-- Show All employees from SALES dept
-- -----------------------------------
create or alter view sales_employees_cv
as
select  e.empno,e.ename,e.job,e.mgr,e.hiredate
       ,e.sal,e.commission,d.deptid,d.dname
from   employees.dept d
       ,employees.emp e
where  d.deptid  = e.deptno 
and    d.dname = 'SALES';
```

* Select from the view
```sql
select * 
from   employees.sales_employees_cv se
where  se.sal < 2000
```

* Built-in PROC **sp_helptext** can be used to retrieve VIEW definition.
```sql
sp_helptext sales_employees_sv;
sp_helptext sales_employees_cv;
```