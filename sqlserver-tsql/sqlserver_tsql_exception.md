![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# Exceptions
* **Exceptions = Runtime errors**
* Syntax Error
* Runtime errors, Handle runtime errors
* Exceptions Handling
```sql



-- ERROR SCENARIO
-- ------------------------------------------------
begin
    declare @num1 int = 1;  -- Variable = container
    declare @num2 int = 2;
    declare @res int;
    declare @Test int;

    set @res = @num1 + @num2;
    print 'Sum of Num1 and Num2';
    print  'Sum: ' + cast(@res as varchar);
    set @Test=1/0  

    print 'Very Important Message'    
end;

-- ERROR HANDLER
* Handle the exception gracefully
-- ------------------------------------------------
begin
    declare @num1 int = 1;  -- Variable = container
    declare @num2 int = 2;
    declare @res int;
    declare @Test int;
    
    -- Code Sub Unit
    -- ------------------------- 
    set @res = @num1 + @num2;
    print 'Sum of Num1 and Num2';
    print  'Sum: ' + cast(@res as varchar);
    
    begin try
        set @Test=1/0
    end try
    begin catch
        print 'SomeErrors'
        SELECT  ERROR_NUMBER() AS ErrorNumber  
                ,ERROR_SEVERITY() AS ErrorSeverity  
                ,ERROR_STATE() AS ErrorState  
                ,ERROR_PROCEDURE() AS ErrorProcedure  
                ,ERROR_LINE() AS ErrorLine  
                ,ERROR_MESSAGE() AS ErrorMessage;          
    end catch
    print 'Very Important Message'    
end;



begin
    declare @Test int;
    declare @l_error_number int;
    declare @l_error_message varchar(1000);
    declare @l_error_line int;  
    -- ,ERROR_SEVERITY() AS ErrorSeverity  
    -- ,ERROR_STATE() AS ErrorState  
    -- ,ERROR_PROCEDURE() AS ErrorProcedure  

    begin try
        set @Test='A'
    end try
    begin catch
        print 'Error Details'
        SELECT  @l_error_number = ERROR_NUMBER()  
                --,ERROR_SEVERITY() AS ErrorSeverity  
                --,ERROR_STATE() AS ErrorState  
                --,ERROR_PROCEDURE() AS ErrorProcedure  
                ,@l_error_line = ERROR_LINE()  
                ,@l_error_message = ERROR_MESSAGE();
        print    'Err#: ' + cast(@l_error_number as varchar) 
               + ' ErrorMsg: ' +  @l_error_message             
               + ' Line#: ' +  cast(@l_error_line as varchar)
                    
    end catch
    
    print 'Very Important Message'    
end;
```
