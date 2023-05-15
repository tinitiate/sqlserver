![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQLSERVER Cursors
```sql

-- CURSORS

begin
    declare @n1 int = 1;
    print @n1;   -- Single Value
    select @n1;  -- One Row One Column
end;

drop table tab_math_operations
create table tab_math_operations (
     ops_id    int
    ,data1     int
    ,data2     int
    ,operation varchar(1)
    ,result   decimal(10,2)
);

insert into tab_math_operations values (1,1,2,'+',null);
insert into tab_math_operations values (2,12,22,'-',null);
insert into tab_math_operations values (3,22,33,'*',null);
insert into tab_math_operations values (4,15,2,'%',null);
insert into tab_math_operations values (5,6,5,'/',null);
update tab_math_operations  set result = null;

select * from tab_math_operations ;

-- Single Update
-- Block
begin
    -- Declare Cursor
    -- -----------------------------
    declare cur_tab_math_operations 
    cursor for
    select ops_id,data1,operation,data2
    from   tab_math_operations;
    
    -- Cursor variables
    -- ------------------------------
    declare @l_ops_id    int
    declare @l_data1     int
    declare @l_operation varchar(1) 
    declare @l_data2     int
    
    -- Output variables
    -- ------------------------------
    declare @l_result    int;
    declare @l_dml       int = 0;


    -- ------------------------------
    -- Open Cursor
    -- ------------------------------
    open cur_tab_math_operations;
     
    -- loop through a cursor
    -- Initial fetch
    fetch next from cur_tab_math_operations into @l_ops_id,@l_data1, @l_operation, @l_data2;
    
    while @@fetch_status = 0
    begin
        print @l_data1 ;
        print @l_operation;
        print @l_data2;
        
        -- Evaluate the Operation and Calculate and Update result
        if @l_operation = '+'
        begin
            set @l_result = @l_data1+@l_data2
            set @l_dml    = 1;
        end

        if @l_operation = '-'
        begin
            set @l_result = @l_data1-@l_data2
            set @l_dml    = 1;
        end

        if @l_dml = 1
        begin
            -- Update
            update tab_math_operations
            set    result = @l_result
            where  ops_id = @l_ops_id;
            -- reset the DML flag
            set @l_dml = 0
        end;
    
        -- Subsequent fetch
        fetch next from cur_tab_math_operations into @l_ops_id,@l_data1, @l_operation, @l_data2;    
    end;
     
    -- close and deallocate cursor
    close cur_tab_math_operations;
    deallocate cur_tab_math_operations;
end;
```
