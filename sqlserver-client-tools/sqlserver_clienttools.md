![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL Server Client Tools

* BCP
* SQLCMD

## BCP
The "bcp" command in SQL Server stands for "Bulk Copy Program." It is a command-line utility provided by SQL Server that allows you to import and export large amounts of data between SQL Server databases and external files.

* Create **STAGING Tables**
```sql
create schema sqltuning authorization dbo;

-- Drop and Create table
drop table sqltuning.stg_products;
drop table sqltuning.stg_invoice;
drop table sqltuning.stg_invoice_details;

create table sqltuning.stg_products
(
    product_id       int
   ,product_category varchar(100)
   ,product_name     varchar(100)
   ,unit_price       decimal(10,2)
);

create table sqltuning.stg_invoice
(
     customer_id      int
    ,customer_name    varchar(100)
    ,invoice_date     varchar(100)
    ,invoice_id       int
    ,discount_percent decimal(10,2)
);

create table sqltuning.stg_invoice_details
(
     invoice_item_id  int
    ,invoice_id       int
    ,product_id       int
    ,quantity         int
);

```

* Load data
```sql
bcp tinitiate.sqltuning.stg_products in ./bcp_data/products.csv -S localhost -U sa -P tinitiate_01 -t"," -r\n -c
bcp tinitiate.sqltuning.stg_invoice in ./bcp_data/invoice_data.csv -S localhost -U sa -P tinitiate_01 -F 2 -t"," -r\n -c
bcp tinitiate.sqltuning.stg_invoice_details in ./bcp_data/invoice_details_data.csv -S localhost -U sa -P tinitiate_01 -t"," -r\n -c
```

* Validate and correct data
```sql
-- Validate Data
-- -------------------------------------------
-- 1. Source data validation

select count(1) from sqltuning.stg_products;
select count(1) from sqltuning.stg_invoice;
select count(1) from sqltuning.stg_invoice_details;

-- 2. Business data validation
-- --------------------------------------------
select * --count(1)
from   sqltuning.stg_invoice i
where not exists (select 1
                  from   sqltuning.stg_invoice_details id
                  where  id.invoice_id = i.invoice_id)

```


## SQLCMD
SQLCMD is a command-line utility in SQL Server that allows you to interact with SQL Server databases using Transact-SQL (T-SQL) commands. It provides a way to execute queries, scripts, and commands from the command prompt or script files.

* Execute a script
```sql
sqlcmd -S localhost -U sa -P tinitiate_01 -d tinitiate -i E:\TinitiateContent\tinitiate-sqlserver\sqlserver-client-tools\sqlcmd_source.sql -o E:\TinitiateContent\tinitiate-sqlserver\sqlserver-client-tools\productsmar30_src_file.txt
```

* Execute a query and capture output to a file.
```sql
sqlcmd -S localhost -U sa -P tinitiate_01 -d tinitiate -Q "select * from invoicing.products" -o E:\TinitiateContent\tinitiate-sqlserver\sqlserver-client-tools\productsmar30.txt
```

* Execute a stored procedure and capture output to a file.

```sql
-- Create a Proc
create procedure dbo.add2nums @num1 int, @num2 int
as
    declare @res int;
    set @res = @num1 + @num2
    print 'Result is ' + cast(@res as varchar(100))
```
```sql
sqlcmd -S localhost -U sa -P tinitiate_01 -d tinitiate -Q "exec dbo.add2nums 10,20" -o E:\TinitiateContent\tinitiate-sqlserver\sqlserver-client-tools\proc_res.txt
```




