
-- TSQL Training DDL

-- Invoice Schema
create schema invoicing

-- Products
-- -------------------------------------
create table products (
    product_id
    product_category
    product_name
    product_unit_price
);

alter table invoicing.products add constraint priamry key(product_id);

-- Invoice
-- -------------------------------------
create table invoice (
    invoice_id
    invoice_date
    invoice_total
    discount
    invoice_price
);

alter table invoicing.invoice add constraint priamry key(invoice_id);


-- Invoice Details
-- -------------------------------------
create table invoice_items (
    invoice_item_id
    invoice_id
    product_id
    quantity
    invoice_item_price
);

alter table invoicing.invoice_items add constraint priamry key(invoice_item_id);