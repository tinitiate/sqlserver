# Invoicing System TSQL Code

## Stored Procedures
```sql
-- INVOICING SYSTEM
-- ---------------------------------------------------------------------------------------

-- Invoicing Master Data Setup
-- ---------------------------
select * from invoicing.products 
delete from  invoicing.products
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (1,'FROZEN','Ice Cream',2.5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (2,'FROZEN','Green Peas',2);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (3,'FROZEN','Corn',2);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (4,'FROZEN','Meat',5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (5,'FROZEN','Pizza',4);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (6,'OFFICE SUPPLIES','Paper',5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (7,'OFFICE SUPPLIES','Pens',4);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (8,'OFFICE SUPPLIES','Ink',5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (9,'OFFICE SUPPLIES','Chair',100);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (10,'OFFICE SUPPLIES','Folder',2);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (11,'Kitchen','Plates',3);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (12,'Kitchen','Bowls',3);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (13,'Kitchen','Spoon',1);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (14,'Kitchen','Fork',1);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (15,'Kitchen','Napkins',4);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (16,'FRUITS','Apple',2);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (17,'FRUITS','Banana',1);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (18,'FRUITS','Pear',2);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (19,'FRUITS','Grapes',3);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (20,'FRUITS','Watermelon',5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (21,'Home Goods','Bulbs',3);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (22,'Home Goods','Cleaning Liquid',4);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (23,'Home Goods','Wipes',3);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (24,'Home Goods','Air Freshner',3.5);
insert into invoicing.products (product_id,product_category,product_name,product_unit_price) values (25,'Home Goods','Batteries',1.5);


-- Tranactional Data
-- ---------------------------------------------------------------------------------------
-- Data Invoice
insert into invoicing.invoice
(invoice_id,invoice_date,invoice_total,discount,invoice_price)
values (1,getdate(),null,null,null);
--
insert into invoicing.invoice (invoice_id,invoice_date) values (2,getdate());
--
select * from invoicing.invoice;

-- Data Invoice Details
select * from invoicing.invoice_items;
insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(1,1,1,5);
insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(2,1,11,1);
insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(3,1,21,2);

insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(4,2,5,5);
insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(5,2,10,2);
insert into invoicing.invoice_items 
(invoice_item_id,invoice_id,product_id,quantity) 
values(6,2,15,3);



-- Create Procedures
-- ------------------------------------------------
1. CreateInvoice
2. AddItemToCart
3. RemoveItemfromCart
    3.1 remove All = invoice_item_id=N,qty=qty, delete row from invoice_items
    3.2 remove few = invoice_item_id=N,qty=y (y>0 and y<=qty) -- update row / delete row
    3.3 ERROR scenario remove incorrect qty = invoice_item_id=N,qty=y (y<0 or y>qty)
    -- no change print error message

-- 4. CalculateLineItemTotal
-- 5. CalcluateInvoiceTotal


-- SP: CreateInvoice
-- 
drop procedure invoicing.sp_create_invoice;

create procedure invoicing.sp_create_invoice
(  @p_invoice_id    int  -- parameters / arguments
  ,@p_invoice_date  date
  ,@p_discount      decimal(12,2)
  )
as
begin
    declare @l_error_number int;
    declare @l_error_message varchar(1000);
    declare @l_error_line int;  

    -- CODE --
    begin try
        insert into invoicing.invoice
        (invoice_id,invoice_date,discount)
        values (@p_invoice_id,@p_invoice_date,@p_discount);
        --
        -- print 'Successfully Added Invoice ID: '+ cast(@p_invoice_id as varchar)
    end try
    begin catch
        print 'Error Inserting Details'
        SELECT  @l_error_number = ERROR_NUMBER()  
                ,@l_error_line = ERROR_LINE()  
                ,@l_error_message = ERROR_MESSAGE();
            
        print    'Err#: ' + cast(@l_error_number as varchar) 
               + ' ErrorMsg: ' +  @l_error_message             
               + ' Line#: ' +  cast(@l_error_line as varchar);
    end catch 
end;

-- Call The Stored PROC
-- -------------------
begin
declare @var date = GETDATE()
exec invoicing.sp_create_invoice @p_invoice_id=4,@p_invoice_date=@var,@p_discount=null
end
```
