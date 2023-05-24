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