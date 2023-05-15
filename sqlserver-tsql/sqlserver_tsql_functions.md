![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQLSERVER User Defined Functions

```sql
-- Functions
-- Creating a Function
-- --------------------------------------------------------------------
drop FUNCTION invoicing.fn_add2nums;
CREATE FUNCTION invoicing.fn_add2nums(@n1 int,@n2 int)
RETURNS int      -- RETURN CLAUSE 
AS
BEGIN
    
    declare @res int;

    set @res = @n1 + @n2;
    
    RETURN @res;  -- Return gives out a value
    -- set @res = 1;
    -- RETURN 1;
END;

-- Executing / Calling a Stored Procedure
-- ---------------------------------------
exec invoicing.add2nums 1,23

-- ---------
-- V/S
-- ---------

-- Executing / Calling a Function
-- ---------------------------------------
-- Calling the Function
-- In SQL
select invoicing.fn_add2nums(12,2)

-- Calling the Function
-- In a Block
begin
    declare @data int=invoicing.fn_add2nums(12,2);
    print @data;
end;



select invoicing.fn_add2nums( invoicing.fn_add2nums(100,200)
                              ,invoicing.fn_add2nums(101,201)
                              )


-- Functions with Multiple Returns in conditional statement
CREATE FUNCTION invoicing.fn_even_odd(@n1 int)
RETURNS varchar(100)      -- RETURN CLAUSE 
AS
BEGIN
    
    declare @res varchar(100);

    if @n1%2=0
    --begin
        return cast(@n1 as varchar) + ' is EVEN';
    --end
    else
    --begin
        set @res = cast(@n1 as varchar) + ' is EVEN';
        return @res;
    --end
END;

-- Positional param call
select invoicing.fn_even_odd(12)
       ,invoicing.fn_even_odd(15)
       --,invoicing.fn_even_odd(@n1=12)

-- Calling Function with named parameter 
declare @data varchar(100)
exec @data = invoicing.fn_even_odd @n1=12
print @data
```
