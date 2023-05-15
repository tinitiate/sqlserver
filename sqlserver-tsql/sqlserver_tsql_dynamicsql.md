![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL Server Dynamic SQL
Dynamic SQL in SQL Server refers to constructing and executing SQL statements dynamically at runtime, rather than at compile time. This allows for greater flexibility in query construction and enables the reuse of SQL code through the use of parameters. 

**PROS:**
Using Dynamic SQL offers benefits such as increased flexibility through the utilization of parameters in query construction, and improved performance due to the generation of a more efficient execution plan.

**CONS:**
Dynamic SQL has several drawbacks, including difficulties in debugging, unreliable error management, susceptibility to SQL injection attacks, and potential security concerns. Additionally, Dynamic SQL can be slower than static SQL since the SQL Server must generate a new execution plan every time at runtime. Furthermore, it requires users to have direct access permissions on all accessed database objects, such as tables and views.

* Test Table for Dynamic SQL
```sql
drop table dynsql_test;
--
create table dynsql_test (
     test_id       int
    ,test_date     date
    ,test_string   varchar(1000)
    ,test_decimal  decimal(10,2)
);
```

* Dynamic SQL using EXEC
```sql
-- EXEC Demo Block
declare  @test_id      int
        ,@test_date    varchar(1000)
        ,@test_string  varchar(1000)
        ,@test_decimal decimal(10,2)
        ,@sql          varchar(3000)

-- assign values
set @test_id      = 1
set @test_date    = 'getdate()'
set @test_string  = 'TEST'
set @test_decimal = 10.2

-- build dynamic statement
set @sql = 'insert into dynsql_test values( ' +
           cast(@test_id as varchar) +' , '+
           cast(@test_date as varchar) +' , '+
           ''''+cast(@test_string as varchar)+''''+' , '+
           cast(@test_decimal as varchar) + ');'

print @sql

--execute dynamic statement
exec(@sql)
print 'Rows Affected ' + cast(@@rowcount as varchar)
```
* sp_executesql is a system stored procedure in SQL Server that is used to execute dynamic SQL statements or batches of code that are constructed at runtime. It can be used as an alternative to the EXECUTE statement, and offers some advantages over it.
* One of the main advantages of sp_executesql is that it allows for parameterized queries, which can help to improve performance and security by reducing the risk of SQL injection attacks. It also supports output parameters and return values, which can be useful in certain scenarios.
* To use sp_executesql, you specify the SQL statement or batch of code that you want to execute, along with any input parameters and their values. The procedure then compiles and executes the statement or batch using the specified parameters.
* Overall, sp_executesql is a powerful tool for executing dynamic SQL in SQL Server, and can be a useful alternative to the EXECUTE statement in certain situations.
```sql
-- EXEC Demo Block
declare  @test_id      int
        ,@test_date    varchar(1000)
        ,@test_string  varchar(1000)
        ,@test_decimal decimal(10,2)
        ,@sql          nvarchar(3000)

-- assign values
set @test_id      = 1
set @test_date    = 'getdate()'
set @test_string  = 'TEST'
set @test_decimal = 10.2

-- build dynamic statement
set @sql = 'insert into dynsql_test values( ' +
           cast(@test_id as varchar) +' , '+
           cast(@test_date as varchar) +' , '+
           ''''+cast(@test_string as varchar)+''''+' , '+
           cast(@test_decimal as varchar) + ');'

print @sql

--execute dynamic statement
execute sp_executesql @sql;
print 'Rows Affected ' + cast(@@rowcount as varchar)
```
* Dynamic SQL with SELECT Statement
```sql
-- Build SQL Select Statement
-- -----------------------------------
begin
  declare @sql          nvarchar(3000)  
  set @sql = 'select * from dynsql_test
  where test_id = ' + cast(1 as varchar)
  + ' and test_date >= getdate()-2';
  
  exec(@sql)
  print 'Rows Affected ' + cast(@@rowcount as varchar)
end;
```