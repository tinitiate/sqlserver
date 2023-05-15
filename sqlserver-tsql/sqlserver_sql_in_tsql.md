![Tinitiate SQLSERVER Training](../images/sqlserver.png)
## Embedding SQL in TSQL
* SQL in TSQL, here we demonstrate the following
  * DQL in TSQL
  * DML in TSQL
```sql
-- SQL in TSQL
begin

    -- Data Input Variables
    -- -------------------------------------------------
    declare @l_in_product_id int = 2;
    declare @l_in_product_category varchar(100) = 'kitchen';
    declare @l_in_product_name varchar(25) = 'sugar';
    declare @l_in_product_unit_price decimal = 4.15;

    -- Code Variables
    -- -------------------------------------------------
    declare @l_product_id int
    declare @product_count int

    -- -------------------------------------------------
    -- DQL
    -- -------------------------------------------------
    -- 1. SQL Select: Get product count and print it
    -- -------------------------------------------------
    select @product_count = count(*) 
    from  tinitiate.invoicing.products;

    print concat('Number of Products: ',@product_count)

    -- -------------------------------------------------
    -- DML
    -- -------------------------------------------------
    -- 1. Insert product data if that product is missing
    -- 2. Update the Column values if supplied input PK exists
    -- -------------------------------------------------
    
    select @l_product_id = product_id
    from   tinitiate.invoicing.products
    where   product_id = @l_in_product_id;

    select @product_count = count('sdfdasfasccf')
    from   tinitiate.invoicing.products
    where   product_id = @l_in_product_id;


    if @@rowcount = 0 --@l_product_id = @l_in_product_id
    begin
        --
        print concat('Product: ',@l_in_product_id,' doesnt exists, Adding it NOW!')
        --
        insert into tinitiate.invoicing.products
        values ( @l_in_product_id
                ,@l_in_product_category
                ,@l_in_product_name
                ,@l_in_product_unit_price);
         --   
         print concat('Rows Inserted ',@@rowcount)        
                
    end
    else
    begin
        print concat('Product: ',@l_in_product_id,' exists!, Updating the new values')
        --
        update tinitiate.invoicing.products
        set    product_category   = @l_in_product_category
              ,product_name       = @l_in_product_name
              ,product_unit_price = @l_in_product_unit_price
        --      
        where  product_id = @l_in_product_id;
    --
    end
end
```

```sql
-- Check Data
select 1,10.2,'ABCD',product_name 
from   tinitiate.invoicing.products
where  product_id = 2
```