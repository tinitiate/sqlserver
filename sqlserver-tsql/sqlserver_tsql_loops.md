![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL SERVER LOOPS

* Basic Loop 
    * LOOPS for Repeated Execution
```sql
begin
    declare @ctr int = 1;
    
    print 'Before Loop';
    while @ctr <= 10
    begin
        print @ctr;
        set @ctr = @ctr + 1;
    end
    print 'After Loop';
end;
```
* Print a Multiplication Table
```sql
-- ------------------------------
begin
    declare @num int = 17;
    declare @ctr int = 1;

    print concat(@num , ' Table:');
    while @ctr <= 10
    begin
        print concat(@num, ' X ',@ctr, ' = ', @num*@ctr);
        set @ctr = @ctr + 1;
    end
end;
```
* Print Day Name of 02, May for the last 40 Years
```sql
-- -----------------------------------------------
begin
    declare @l_year int = year(getdate());
    declare @l_end_year int = @l_year - 40;
    declare @l_mm_dd varchar(10) = '05-04';
    declare @l_date_str varchar(20);
    declare @l_date date;

    -- while @l_year >= (@l_year - 40)
    while @l_year >= @l_end_year
    begin
        -- print @l_year
        
        -- Build the Date String
        -- STRING -> DATE FORMATS
        -- https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/
        -- YYYY-MM-DD (23 format type)
        -- print concat(@l_year,'-',@l_mm_dd);
        set @l_date_str = concat(@l_year,'-',@l_mm_dd);
    
        -- Convert String (in MMDDYYYY format) to DATE
        set @l_date = convert(date, @l_date_str, 23);
        
        -- Print Date
        print @l_date;

        -- Print Name of DAY from a DATE variable    
        print datename(weekday, @l_date);
    
        -- Decrease the year by 1
        set @l_year = @l_year - 1;
    end;

end;
```
* **NESTED LOOPS** Loop inside a loop
```sql
-- ------------------------------------------------------
begin
    declare @ctrA int = 1;
    declare @ctrB int = 1;

    -- OUTER LOOP
    while @ctrA <= 5
    begin
        -- print @ctrA;
        --set @ctrA = @ctrA + 1; -- INCREMENT  (before use) 
        --print @ctrA;
    
        -- INNER LOOP
        while @ctrB <= 5
        begin
            print concat(@ctrA,' - ', @ctrB);
            set @ctrB = @ctrB + 1; -- INCREMENT (after use)
        end
        set @ctrB = 1 -- reset to 1
        -- print @ctrA;
        set @ctrA = @ctrA + 1; -- INCREMENT  (before use)         
    end
    --
end;

```
* Loop Control: BREAK, this when encountered exits the **immediate** loop (the loop in which the BREAK is mentioned.
```sql
begin
    declare @ctrA int = 1;
    declare @ctrB int = 1;

    -- LOOP with BREAK (Ends the Loop)
    while @ctrA <= 5
    begin
        print 'Step1'
        print @ctrA;
        if @ctrA = 3
        begin
            break
        end
        print 'Step2'
        set @ctrA = @ctrA + 1; -- INCREMENT  (before use)         
    end
    --
    print 'Outside the loop'
end;
```
* Loop Control: CONTINUE, This breaks the ITERATION alone, loop executes
```sql
begin
    declare @ctrA int = 0;
    -- LOOP with continue (Ends the Iteration)
    while @ctrA <= 5
    begin
        print 'Step1'
        print @ctrA;
        set @ctrA = @ctrA + 1; -- INCREMENT  (before use)
        if @ctrA = 3
        begin
            continue
        end
        print 'Step2'
                 
    end
    --
    print 'Outside the loop'
end;
```
* Loop Control: BREAK with Nested Loop
```sql
begin
    declare @ctrA int = 1;
    declare @ctrB int = 1;
    print '====='
    -- OUTER LOOP
    while @ctrA <= 5
    begin
        -- print @ctrA;
        --set @ctrA = @ctrA + 1; -- INCREMENT  (before use) 
        --print @ctrA;
    
        -- INNER LOOP
        while @ctrB <= 5
        begin
            print concat(@ctrA,' - ', @ctrB);
            -- if @ctrB=3
            -- begin
            --     break
            -- end
            
            set @ctrB = @ctrB + 1; -- INCREMENT (after use)
        end
        set @ctrB = 1 -- reset to 1
        -- print @ctrA;
        set @ctrA = @ctrA + 1; -- INCREMENT  (before use)         
    end
    --
end;
```
