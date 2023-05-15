![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL SERVER Temp Tables

## @ Tables variable
* Table Variables in SQL Server are variables that can hold a result set of data in memory, similar to a temporary table. They are declared and used within a single batch or stored procedure, and their scope is limited to that batch or procedure.

* Table Variables have some advantages over temporary tables, including being faster to create and not being logged to the transaction log. Additionally, they can be used in User-Defined Functions and can have constraints and indexes added to them.

* However, Table Variables have some limitations, such as being stored in memory rather than on disk, so they may not be suitable for large result sets or long-running operations. Additionally, they may not always have the same query plan as a temporary table, which can lead to performance differences. It's important to evaluate the specific use case and data size to determine whether Table Variables are the best choice.
```sql
begin
  declare @emp_var table
  (empid int,ename varchar(10));

  insert into @emp_var values ( 1, 'AA'), ( 2, 'BB');
  select * from @emp_var;
end
```

## Local Temp Tables
* Temporary Tables in SQL Server are tables that are created and used for a specific session or connection, and are automatically dropped when the session or connection ends. They are created in the tempdb system database and can be used to store and manipulate data just like regular tables.

* Temporary Tables are useful for storing intermediate results or performing complex data manipulations, and can also be used to improve performance by reducing the need for multiple queries or subqueries. They can have indexes and constraints added to them, and can be referenced in stored procedures or functions.

* However, Temporary Tables do have some drawbacks. They can take up resources in the tempdb database and can be slower to create and drop than Table Variables. Additionally, they can cause issues with concurrency and locking, so it's important to use them judiciously and with consideration for the specific use case.
```sql
begin
  begin try
    exec('drop table #emp')
  end try
  begin catch
  end catch
  -- Create Table
  create table #emp(empid int,ename varchar(102));
  insert into #emp values ( 1, 'AA'), ( 2, 'BB');
  select * from #emp;
end
```

## Global Temp Tables
* Global Temporary Tables in SQL Server are similar to Temporary Tables, but they are visible to all sessions and connections. They are created in the tempdb system database, just like Temporary Tables, but their name is preceded by a double hash (##).

* Global Temporary Tables are useful when data needs to be shared across multiple sessions or connections, but the data only needs to be available for a limited period of time. They can be referenced in stored procedures or functions just like regular tables, and can have indexes and constraints added to them.

* However, Global Temporary Tables also have some drawbacks. They can cause contention and locking issues in the tempdb database, and they can be slower to create and drop than regular tables or Temporary Tables. Additionally, because they are visible to all sessions and connections, it's important to use them with care and ensure that they are not being accessed or modified by multiple processes simultaneously.
```sql
-- Create Global temp table
create table ##emp_gtt (empid int,ename varchar(102));

begin
  insert into ##emp_gtt values ( 1, 'AA'), ( 2, 'BB');
  select * from ##emp_gtt;
end
```
