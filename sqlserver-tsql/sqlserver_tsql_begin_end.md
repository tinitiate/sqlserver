![Tinitiate SQLSERVER Training](../images/sqlserver.png)
```sql

-- T-SQL
-- -----------------------

-- Code blocks
-- -------------------------
begin
    declare @num1 int = 1;  -- Variable = container
    declare @num2 int;
    declare @res int;
    
    -- set @num1 = 10; 
    set @num2 = 20;

    set @res = @num1 + @num2;
    print 'Sum of Num1 and Num2';
    print  'Sum: ' + cast(@res as varchar);
    print  @res;
    select @res;

end;



-- Variables Code blocks
-- -------------------------
begin
    declare @data1 int = 1; -- variable declare and initialize
    declare @data2 int;     -- variable declare
    
    set @data2 = 10;  -- variable initialize
    print @data2;  -- 10

    set @data2 = 20;  -- variable re-assign
    print @data2;  -- 20

    print @data2+10; -- 30
    print @data2;    -- 20
end;

```
