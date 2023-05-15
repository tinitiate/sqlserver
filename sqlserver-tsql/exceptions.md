![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL SERVER EXCEPTIONS
> (c) Venkata Bhattaram

## Try Catch Block
```
BEGIN TRY
	DECLARE @num INT, @msg varchar(2000)
	---- Divide by zero to generate Error
	SET @num = 5/0
	PRINT 'This will not execute'
END TRY
BEGIN CATCH
	-- PRINT 'Error occured that is'
	-- set @msg=(SELECT ERROR_PROCEDURE()) -- + ' ' + convert(VARCHAR(50),ERROR_NUMBER()) + ' ' + convert(VARCHAR(50),ERROR_LINE()) + ' ' + ERROR_MESSAGE())
	set @msg = (select convert(VARCHAR(50),ERROR_LINE()) +' ' + ERROR_MESSAGE())
	-- OR
	-- Error Number = ERROR_NUMBER() or @@ERROR
	set @msg = (select convert(VARCHAR(50),ERROR_LINE()) +' ' + convert(VARCHAR(50),@@ERROR))
	
	print 'Error ' + @msg;
	-- print ERROR_PROCEDURE()
	--SELECT ERROR_MESSAGE()
	-- print 'Test'

-- Transaction uncommittable
    IF (XACT_STATE()) = -1
      ROLLBACK TRANSACTION
 
-- Transaction committable
    IF (XACT_STATE()) = 1
      COMMIT TRANSACTION

END CATCH
GO 
```

## USER DEFINED EXCEPTIONS


## throw

```
Declare @val1 int;  
Declare @val2 int;  
BEGIN TRY  
	Set @val1=8;  
	Set @val2=@val1%2;   
	if @val1=1  
		Print ' Error Not Occur'  
	else  
		Begin  
		Print 'Error Occur';  
		Throw 60000,'Number Is Even',5  
		End  
  
END TRY  
BEGIN CATCH  
	Print 'Error Occur that is:'  
	Print Error_Message()  
END CATCH   
```

## raiserror
```

```


## Custom Exception Creation
```
-- 
-- Sys View to Check Error Codes and Messages
--
SELECT * FROM master.dbo.sysmessages;

-- Create a custom error message and save to DB
-- Custom error Numbers start frm 50000
-- Step 1
sys.sp_addmessage
  @msgnum   = 50001
  ,@severity = 11
  ,@msgtext  = 'Data doesnt exist'

-- Test by raising the error
raiserror(50001,11,1)
go

-- Remove Custom Registered Message

sys.sp_dropmessage
  @msgnum   = 50001

-- Test by raising the error after drop
raiserror(50001,11,1)
go
```
