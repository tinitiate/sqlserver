![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL Server Indexes

Types of Indexes: SQL Server supports different types of indexes, including clustered indexes, non-clustered indexes, and unique indexes.
* Clustered Index: A clustered index determines the physical order of data in a table. Each table can have only one clustered index. When a clustered index is created, the data is physically rearranged based on the index key.
* Non-Clustered Index: A non-clustered index is a separate structure from the data and contains a copy of the indexed columns along with a pointer to the actual data. A table can have multiple non-clustered indexes. Non-clustered indexes are useful for improving the performance of search operations.
* Unique Index: A unique index ensures that the indexed columns have unique values, similar to a primary key. It can be created as either clustered or non-clustered.

## Table Setup for Indexes
```sql
-- --------------------------------------------
-- Prepare OLTP Tables without indexes
-- --------------------------------------------

create table sqltuning.products_no_index
(
    product_id       int
   ,product_category varchar(100)
   ,product_name     varchar(100)
   ,unit_price       decimal(10,2)
);

create table sqltuning.invoice_no_index
(
     customer_id      int
    ,customer_name    varchar(100)
    ,invoice_date     date
    ,invoice_id       int
    ,discount_percent decimal(10,2)
);

create table sqltuning.invoice_details_no_index
(
     invoice_item_id  int
    ,invoice_id       int
    ,product_id       int
    ,quantity         int
);

insert into sqltuning.products_no_index
select * from sqltuning.stg_products;

insert into sqltuning.invoice_no_index
select * from sqltuning.stg_invoice;

insert into sqltuning.invoice_details_no_index
select * from sqltuning.stg_invoice_details;


-- --------------------------------------------
-- Prepare OLTP Tables with indexes
-- --------------------------------------------
drop table sqltuning.products_index;
create table sqltuning.products_index
(
    product_id       int   not null
   ,product_category varchar(100)
   ,product_name     varchar(100)
   ,unit_price       decimal(10,2)
);

alter table sqltuning.products_index add constraint pk_products_index primary key(product_id);

drop table sqltuning.invoice_index;
create table sqltuning.invoice_index
(
     customer_id      int not null
    ,customer_name    varchar(100)
    ,invoice_date     date
    ,invoice_id       int not null
    ,discount_percent decimal(10,2)
);

alter table sqltuning.invoice_index add constraint pk_invoice_index primary key(invoice_id);

drop table sqltuning.invoice_details_index
create table sqltuning.invoice_details_index
(
     invoice_item_id  int
    ,invoice_id       int
    ,product_id       int
    ,quantity         int
);

insert into sqltuning.products_index
select * from sqltuning.stg_products;

insert into sqltuning.invoice_index
select * from sqltuning.stg_invoice;

insert into sqltuning.invoice_details_index
select * from sqltuning.stg_invoice_details;

```

## Create Indexes
```sql
-- Clustered Index
-- ---------------
create clustered index ix_invoice_details_invoiceid
on sqltuning.invoice_details_index (invoice_id asc);

-- Non-clustered index
-- ---------------
create nonclustered index ix_nvoice_details_productid 
on sqltuning.invoice_details_index (product_id asc);
```

## Get Explain Plan
```sql
-- With Index
-- ---------------------------------------------------------
SET SHOWPLAN_ALL ON
select * --count(1)
from   sqltuning.invoice_index i
where not exists (select 1
                  from   sqltuning.invoice_details_index id
                  where  id.invoice_id = i.invoice_id);

-- Without Index
-- ---------------------------------------------------------
SET SHOWPLAN_ALL ON
select * --count(1)
from   sqltuning.invoice_no_index i
where not exists (select 1
                  from   sqltuning.invoice_details_no_index id
                  where  id.invoice_id = i.invoice_id);

```