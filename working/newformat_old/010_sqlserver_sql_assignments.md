# SQLSERVER SQL Assignments

## **ASSIGNMENT** DDL Scenarios on Table
* For the below table Write the SQLs for the tasks below
```sql
create table emp_ddl_tester_tab (
     empid           int
    ,ename           varchar(100)
    ,salary          decimal(12,2)
    ,bonus           decimal(12,2)
    ,publicid        int
    ,project_opt_out varchar(100)
);
```
* Tasks 
    * **Rename Table**, Write alter to rename emp_ddl_tester_tab to emp_ddl_tester
    * **Add column**, project_opt_out int
    * **Change DataType**, Change datatype of project_opt_out to varchar(100)
    * **Add Check Constraint**, Write alter to add check constraint to make sure bonus is always <= 50% of bouns, show test case with insert and update.
    * Write alter to add check constraint to add list of values for project_opt_out to THREE values ('YES','NO','N/A')
    * **Remove constraint**:
Alter table to remove check constraint on bonus and write test for insert and update
    * **Remove column**, Write alter to remove publicid column
    * **Add Column to PK**, Add column to Primary Key Write alter to add ename column to Primary Key
