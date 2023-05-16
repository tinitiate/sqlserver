![Tinitiate SQLSERVER Training](images/sqlserver.png)
# SQL SERVER TRIGGERS
In SQL Server, a trigger is a special type of stored procedure that is automatically executed in response to certain events occurring in the database. Triggers can be used to enforce business rules, validate data, and perform other actions when data is inserted, updated, or deleted from a table.

There are two types of triggers in SQL Server:

* **DML triggers**

DML triggers fire in response to changes to data in a table, such as an insert, update, or delete operation. They can be defined to execute either before or after the data modification operation.

* **DDL triggers**

DDL triggers fire in response to changes to the database schema, such as creating or altering tables, views, or stored procedur

* * *
* Tables for Trigger demonstration
```sql
-- Test Table for Trigger Demonstration
-- ----------------------------
create table trigger_test (
     test_id       int
    ,test_date     date
    ,test_string   varchar(1000)
    ,test_decimal  decimal(10,2)
);

create table trigger_test_mirror (
     test_id       int
    ,test_date     date
    ,test_string   varchar(1000)
    ,test_decimal  decimal(10,2)
    ,action_type   varchar(100)
);

drop table trigger_test_log;
create table trigger_test_log (
     log_id        int
    ,log_date      date
    ,log_message   varchar(1000)
    ,eventval      xml
);
```

## DML FOR Triggers
A "FOR" trigger is executed before the data modification operation (INSERT, UPDATE, DELETE) takes place. It can be used to modify the data to be inserted, updated, or deleted before the operation is carried out. "FOR" triggers are commonly used with views, where the underlying table may not be directly modifiable.

Here is an example of a "FOR" trigger that modifies data before an INSERT operation is carried out:

```sql
drop trigger trg_trigger_test;

create trigger trg_for_trigger_test
on trigger_test
for insert,update,delete -- DML
as
begin
--
  if (update (test_date) or update (test_string) or update (test_decimal))
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'UPDATE' action_type
    from   inserted; -- USE DATA FROM INSERTED
  end 
  else if (select count (*) from inserted) != 0
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'INSERT' action_type
    from   inserted;
  end
  else if (select count (*) from DELETED) != 0
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'DELETE' action_type
    from   deleted;
  end

--
end;

-- INSERT TEST
-- --------------------------------------------------------
insert into trigger_test (test_id,test_date,test_string,test_decimal)
values (1,getdate(),'TEST',100.2)

select * from trigger_test;
select * from trigger_test_mirror;

-- UPDATE TEST
-- --------------------------------------------------------
update trigger_test 
set    test_date    = getdate()+10
where  test_id = 1;

update trigger_test 
set    test_decimal = 88.88
where  test_id = 1;

update trigger_test 
set    test_string = 'TEST1'
where  test_id = 1;

-- Test Query
select * from trigger_test;
select * from trigger_test_mirror;


-- DELETE TEST
-- --------------------------------------------------------
delete from trigger_test where test_id = 1;

-- Test Query
select * from trigger_test;
select * from trigger_test_mirror;
```
* Trigger to change values
```sql
-- Create TRIGGER with ONLY INSERT handler 
-- ---------------------------------------------------------
create or alter trigger trg_for_trigger_test_upper
on trigger_test
for insert
as
begin
  if (select count (*) from inserted) != 0)
  begin
    update trigger_test
    set    test_string = (select upper(test_string) from inserted)
    where  test_id     = (select test_id from inserted);
  end
end

-- TEST --
insert into trigger_test (test_id,test_date,test_string,test_decimal)
values (2,getdate(),'lower',100.2)

update trigger_test
set    test_string = 'abc'
where  test_id = 2
-- See lower case 'abc' (as trigger doesnt handle updates)
select * from trigger_test;


-- Add UPDATE handler to TRIGGER
-- ---------------------------------------------------------
create or alter trigger trg_for_trigger_test_upper
on trigger_test
for insert,update
as
begin
  if ((select count (*) from inserted) != 0) or update(test_string)
  begin
    update trigger_test
    set    test_string = (select upper(test_string) from inserted)
    where  test_id     = (select test_id from inserted);
  end
end

-- TEST --
update trigger_test
set    test_string = 'abc'
where  test_id = 2
-- See upper case 'abc'
select * from trigger_test;

```




### DML AFTER Triggers
An "AFTER" trigger, as the name suggests, is executed after the data modification operation is carried out. It can be used to perform additional actions based on the changes made to the table.

FOR | AFTER AFTER specifies that the DML trigger is fired only when all operations specified in the triggering SQL statement have executed successfully. All referential cascade actions and constraint checks also must succeed before this trigger fires. AFTER is the default when FOR is the only keyword specified. AFTER triggers cannot be defined on views.

Here is an example of an "AFTER" trigger that logs changes to a table:
```sql
drop trigger trg_after_trigger_test;
--
create trigger trg_after_trigger_test
on trigger_test
after insert,update,delete
as
begin
--
  if (select count (*) from deleted) = 0
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'INSERT' action_type
    from   inserted;
  end
  else if (select count (*) from inserted) = 0
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'DELETE' action_type
    from   deleted;
  end
  else if (update (test_date) or update (test_string) or update (test_decimal))
  begin
    insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
    select test_id,test_date,test_string,test_decimal,'UPDATE' action_type
    from   inserted; -- USE DATA FROM INSERTED
  end 
--
end;


-- INSERT TEST
-- --------------------------------------------------------
insert into trigger_test (test_id,test_date,test_string,test_decimal)
values (1,getdate(),'TEST',100.2)

select * from trigger_test;
select * from trigger_test_mirror;

-- UPDATE TEST
-- --------------------------------------------------------
update trigger_test 
set    test_date    = getdate()+10
where  test_id = 1;

update trigger_test 
set    test_decimal = 88.88
where  test_id = 1;

update trigger_test 
set    test_string = 'TEST1'
where  test_id = 1;

-- Test Query
select * from trigger_test;
select * from trigger_test_mirror;

-- DELETE TEST
-- --------------------------------------------------------
delete from trigger_test where test_id = 1;

-- Test Query
select * from trigger_test;
select * from trigger_test_mirror;
```

### DML INSTEAD OF Triggers
"INSTEAD OF" trigger is a type of trigger that can be used to override the default behavior of an insert, update, or delete operation on a view or a table that has an associated INSTEAD OF trigger. An INSTEAD OF trigger is executed instead of the original insert, update, or delete operation and can be used to modify the data being inserted, updated, or deleted, or to perform additional actions.
```sql
create view vw_trigger_test
as
select test_id,test_date,test_string,test_decimal
from   trigger_test;

drop trigger trg_instead_trigger_test;
create trigger trg_instead_trigger_test
on vw_trigger_test instead of insert
as
begin
  insert into trigger_test_mirror (test_id,test_date,test_string,test_decimal,action_type)
  select test_id,test_date,upper(test_string),test_decimal,'INSERT' action_type
  from   inserted;
end;

-- INSERT TEST
-- --------------------------------------------------------
insert into vw_trigger_test (test_id,test_date,test_string,test_decimal)
values (3,getdate(),'new line',100.2)

select * from trigger_test;
select * from trigger_test_mirror;
```
* Instead Of on table
```sql
create or alter trigger trg_instead_trigger_test_upper
on trigger_test
instead of insert
as
begin
  if (select count (*) from inserted) != 0)
  begin
    insert into trigger_test
    select test_id,test_date,upper(test_string),test_decimal
    from   inserted;
  end
end

-- TEST --
insert into trigger_test (test_id,test_date,test_string,test_decimal)
values (2,getdate(),'lower',100.2)

update trigger_test
set    test_string = 'abc'
where  test_id = 2
-- See lower case 'abc' (as trigger doesnt handle updates)
select * from trigger_test;

```


### Multiple Triggers
sp_settriggerorder

## DDL Triggers
DDL (Data Definition Language) trigger is a type of trigger that fires in response to a variety of DDL events that occur in the database. DDL events include events like creating or altering tables, indexes, views, stored procedures, and user-defined functions.

DDL triggers can be useful for enforcing business rules or data integrity constraints, for auditing database changes, or for implementing custom security policies.
```sql
drop trigger trg_tinitiate_ddl;

create trigger trg_tinitiate_ddl
on database
for create_table,alter_table,drop_table
as
begin
  set nocount on;
  insert into trigger_test_log (log_id,log_date,log_message,eventval)
  values (1,getdate(),'DDL EVENT',EVENTDATA());
end;

-- Test DDL Trigger
-- -------------------------------
create table test1 (id int);
drop table test1;
select * from trigger_test_log
```

## Enable / Disable Trigger
To enable a disabled trigger, you can use the ENABLE TRIGGER statement with the same syntax as above. Once a trigger is enabled, it becomes active again and will fire when the corresponding event occurs.

It's important to note that disabling a trigger affects all users who access the table, not just the user who issued the DISABLE TRIGGER statement. Also, if a trigger is disabled, any pending trigger actions will not be executed, even after the trigger is re-enabled. So, it's important to ensure that you re-enable the trigger as soon as possible after you've finished the maintenance operation.
```sql
enable trigger dbo.trg_instead_trigger_test on dbo.vw_trigger_test;
disable trigger dbo.trg_instead_trigger_test on dbo.vw_trigger_test;

enable trigger all on dbo.trigger_test;
disable trigger all on dbo.trigger_test;

-- Drop DB triggers
DROP TRIGGER trg_tinitiate_ddl ON database;  
```