![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# Stored Procedures
```sql
-- Stored Procedures
-- ---------------------------------------------------------------------------------------

-- BLOCK
-- ---------------------------
begin
    declare @num1 int = 12;  -- Variable = container
    declare @num2 int = 44;
    
    -- PROC CODE
    declare @res int;

    set @res = @num1 + @num2;
    print 'Sum of Num1 and Num2';
    print  'Sum: ' + cast(@res as varchar);
end;

-- BLOCK code in a PROCEDURE
-- ---------------------------
create procedure invoicing.add2nums
(  @num1 int  -- parameters / arguments
  ,@num2 int) -- parameters / arguments
as
begin
    declare @res int;

    set @res = @num1 + @num2;
    print 'Sum of Num1 and Num2';
    print  'Sum: ' + cast(@res as varchar);
end;

-- Call Procedure, multiple-times 
-- with different values
-- -----------------------------
exec invoicing.add2nums 12, 44
exec invoicing.add2nums 120, 944
exec invoicing.add2nums 129, -44

-- Call Procedure in a block
begin
    declare @l_num1 int = 9;
    declare @l_num2 int = 88;

    exec invoicing.add2nums @l_num1, @l_num2

end;
```
