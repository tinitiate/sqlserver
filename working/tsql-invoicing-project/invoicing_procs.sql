-- INVOICING SYSTEM STORED PROCS
-- ---------------------------------------------------------------------------------------

-- Tranactional Data
-- ---------------------------------------------------------------------------------------
-- Data Invoice
insert into invoicing.invoice
(invoice_id,store_id,cust_id,invoice_date,invoice_total,discount,invoice_price)
values (1,1,1000,getdate(),null,null,null);
--
insert into invoicing.invoice (invoice_id,store_id,cust_id,invoice_date) values (2,1,1001,getdate());
--
select * from invoicing.invoice;
select * from tinitiate.invoicing.products
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

-- -----------------------------------------------
-- Get All Data as DeNormalized output
-- USE CASES
-- 1. IDEAL Cursor Query for calculations
-- 2. Understanding of DATA MODEL
--    (ERD = Entiry Relationship Diagram)
-- -----------------------------------------------
select * from invoicing.customers
select * from invoicing.invoice
select * from invoicing.products
select * from invoicing.invoice_items;

-- IDEAL Cursor Query for calc
select  i.invoice_id,c.cust_id ,c.cust_name 
       ,i.store_id,i.invoice_date
       ,ii.invoice_item_id,p.product_id
       ,p.product_name, p.product_unit_price
       ,ii.quantity
from   invoicing.customers     c
      ,invoicing.invoice       i
      ,invoicing.invoice_items ii
      ,invoicing.products      p
where  c.cust_id = i.cust_id
and    i.invoice_id = ii.invoice_id 
and    ii.product_id = p.product_id;


-- ----------------------------------------------------------------------------------
-- Create Procedures
-- ----------------------------------------------------------------------------------
--1. CreateInvoice
--2. AddItemToCart
--3. RemoveItemfromCart
--    3.1 remove All = invoice_item_id=N,qty=qty, delete row from invoice_items
--    3.2 remove few = invoice_item_id=N,qty=y (y>0 and y<=qty) -- update row / delete row
--    3.3 ERROR scenario remove incorrect qty = invoice_item_id=N,qty=y (y<0 or y>qty)
    -- no change print error message

-- 4. CalculateLineItemTotal
-- 5. CalcluateInvoiceTotal
-- ----------------------------------------------------------------------------------

-- SP 1: CreateInvoice
-- ----------------------------------------------------------------------------------
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

-- Test CreateInvoice
-- -------------------
-- STEP 1. Run the SP
begin
declare @var date = GETDATE()
exec invoicing.sp_create_invoice @p_invoice_id=4,@p_invoice_date=@var,@p_discount=null
end;

-- STEP 2. Test SP Data output / changes to table
-- ----------------------------------------------------------------------------------


