![Tinitiate SQLSERVER Training](../images/sqlserver.png)
```sql
-- TSQL Training DDL

-- Invoice Schema
use tinitiate;

create schema invoicing authorization dbo;
alter authorization on schema::invoicing to tiuser;

-- Products
-- -------------------------------------
create table invoicing.products(
    product_id int not null,
    product_category varchar(100),
    product_name varchar(25),
    product_unit_price decimal(12,2));
    
alter table invoicing.products add constraint pk_product_id primary key(product_id);

-- Invoice
-- -------------------------------------
create table invoicing.invoice(
    invoice_id int not null,
    invoice_date date,
    invoice_total decimal(12,2),
    discount decimal(12,2),
    invoice_price decimal(12,2));
    
alter table invoicing.invoice add constraint pk_invoice_id primary key(invoice_id);


-- Invoice Details
-- -------------------------------------
create table invoicing.invoice_items (
    invoice_item_id int not null,
    invoice_id int not null,
    product_id int not null,
    quantity decimal(12,2),
    invoice_item_price decimal(12,2));

alter table invoicing.invoice_items add constraint pk_invoice_item_id primary key(invoice_item_id);
alter table invoicing.invoice_items add constraint fk_invoice_id foreign key(invoice_id) references invoicing.invoice(invoice_id);
alter table invoicing.invoice_items add constraint fk_product_id foreign key(product_id) references invoicing.products(product_id);
```
