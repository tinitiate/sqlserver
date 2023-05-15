# Invoice System Master Data

* Product Master Data
```sql

-- Check the products table for data
-- ----------------------------------------------------------------------------------
select * from invoicing.products;

-- If data exists delete that data
-- ----------------------------------------------------------------------------------
delete from  invoicing.products;

-- Adding Products Master Data
-- ----------------------------------------------------------------------------------
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
```

* Customers Master Data
```sql
-- STEP 1
-- Insert 100 Customers with ID starting from 1000
-- ------------------------------
begin
  declare @cust_id int = 1000

  while @cust_id <= 1101
  begin
    insert into invoicing.customers values 
    (@cust_id
     ,'a'
     ,case
      when @cust_id%5=0  then 'platinum'
      when @cust_id%2=0  then 'basic'
      when @cust_id%2!=0 then 'gold'
      else 'basic'
      end);
     --
     set @cust_id = @cust_id + 1
  end;
end;

-- Check data
select * from invoicing.customers

-- STEP 2.
-- ---------------------------------
-- load random names in a table
create table invoicing.customer_names (customer_name varchar(100));

select * from invoicing.customer_names;

insert into invoicing.customer_names (customer_name) values('Dale Carter');
insert into invoicing.customer_names (customer_name) values('Michael Sullivan');
insert into invoicing.customer_names (customer_name) values('Monique Cordova');
insert into invoicing.customer_names (customer_name) values('Jasmine Lloyd');
insert into invoicing.customer_names (customer_name) values('Sarah Sanchez');
insert into invoicing.customer_names (customer_name) values('David Nguyen');
insert into invoicing.customer_names (customer_name) values('Brenda Rush');
insert into invoicing.customer_names (customer_name) values('Leslie Scott');
insert into invoicing.customer_names (customer_name) values('Christina Wilson');
insert into invoicing.customer_names (customer_name) values('Jessica Roth');
insert into invoicing.customer_names (customer_name) values('Pamela Davis');
insert into invoicing.customer_names (customer_name) values('Aaron Gomez');
insert into invoicing.customer_names (customer_name) values('James Singh');
insert into invoicing.customer_names (customer_name) values('Charles Moore');
insert into invoicing.customer_names (customer_name) values('Dustin Rodriguez');
insert into invoicing.customer_names (customer_name) values('Angela Brown');
insert into invoicing.customer_names (customer_name) values('Patricia Baxter');
insert into invoicing.customer_names (customer_name) values('John Arellano');
insert into invoicing.customer_names (customer_name) values('Terrence Baldwin');
insert into invoicing.customer_names (customer_name) values('Brian Jackson');
insert into invoicing.customer_names (customer_name) values('Brian Rivera');
insert into invoicing.customer_names (customer_name) values('Amy Contreras');
insert into invoicing.customer_names (customer_name) values('Joshua Peterson');
insert into invoicing.customer_names (customer_name) values('Robert Anderson');
insert into invoicing.customer_names (customer_name) values('Jennifer Martinez');
insert into invoicing.customer_names (customer_name) values('Jessica Martinez');
insert into invoicing.customer_names (customer_name) values('Annette Warner');
insert into invoicing.customer_names (customer_name) values('Roberto Morrison');
insert into invoicing.customer_names (customer_name) values('Mr. Don Reeves MD');
insert into invoicing.customer_names (customer_name) values('Ronald Stephens');
insert into invoicing.customer_names (customer_name) values('Gregory Sanchez');
insert into invoicing.customer_names (customer_name) values('Tara Petersen');
insert into invoicing.customer_names (customer_name) values('Catherine Harris');
insert into invoicing.customer_names (customer_name) values('Tiffany Ferguson');
insert into invoicing.customer_names (customer_name) values('Taylor Edwards');
insert into invoicing.customer_names (customer_name) values('Monica Stephens');
insert into invoicing.customer_names (customer_name) values('Robert Smith');
insert into invoicing.customer_names (customer_name) values('Philip Palmer');
insert into invoicing.customer_names (customer_name) values('James Reed');
insert into invoicing.customer_names (customer_name) values('Christopher Decker');
insert into invoicing.customer_names (customer_name) values('Victoria Navarro');
insert into invoicing.customer_names (customer_name) values('Steven Hernandez');
insert into invoicing.customer_names (customer_name) values('Daniel Harper');
insert into invoicing.customer_names (customer_name) values('Greg Smith');
insert into invoicing.customer_names (customer_name) values('Tammy Bailey');
insert into invoicing.customer_names (customer_name) values('Jonathan Peterson');
insert into invoicing.customer_names (customer_name) values('Robert Jackson');
insert into invoicing.customer_names (customer_name) values('Jared Thomas');
insert into invoicing.customer_names (customer_name) values('Emily Mayer');
insert into invoicing.customer_names (customer_name) values('Anne Thompson');
insert into invoicing.customer_names (customer_name) values('Tracey Cline');
insert into invoicing.customer_names (customer_name) values('Vickie Williams');
insert into invoicing.customer_names (customer_name) values('Mr. Nathaniel Villanueva');
insert into invoicing.customer_names (customer_name) values('Jessica Best');
insert into invoicing.customer_names (customer_name) values('Melissa Bruce');
insert into invoicing.customer_names (customer_name) values('Cindy Green');
insert into invoicing.customer_names (customer_name) values('Linda Dominguez');
insert into invoicing.customer_names (customer_name) values('Christopher Vasquez');
insert into invoicing.customer_names (customer_name) values('James Franklin');
insert into invoicing.customer_names (customer_name) values('Katie Bartlett');
insert into invoicing.customer_names (customer_name) values('Christian Burch');
insert into invoicing.customer_names (customer_name) values('Christina Rivera');
insert into invoicing.customer_names (customer_name) values('William Ramos');
insert into invoicing.customer_names (customer_name) values('Nicole Ruiz');
insert into invoicing.customer_names (customer_name) values('Catherine Martin');
insert into invoicing.customer_names (customer_name) values('Amanda Stevens');
insert into invoicing.customer_names (customer_name) values('Tyler Ross');
insert into invoicing.customer_names (customer_name) values('Martha Smith');
insert into invoicing.customer_names (customer_name) values('William Daugherty');
insert into invoicing.customer_names (customer_name) values('Ashley Conrad');
insert into invoicing.customer_names (customer_name) values('Lisa Rodgers');
insert into invoicing.customer_names (customer_name) values('Jennifer Holmes');
insert into invoicing.customer_names (customer_name) values('Peter Johnson');
insert into invoicing.customer_names (customer_name) values('David Jordan');
insert into invoicing.customer_names (customer_name) values('Andrea Holland');
insert into invoicing.customer_names (customer_name) values('Kenneth Malone');
insert into invoicing.customer_names (customer_name) values('Lori Valdez');
insert into invoicing.customer_names (customer_name) values('Morgan Mills');
insert into invoicing.customer_names (customer_name) values('Tammy Brown');
insert into invoicing.customer_names (customer_name) values('Natasha Munoz');
insert into invoicing.customer_names (customer_name) values('Christian Saunders');
insert into invoicing.customer_names (customer_name) values('Katrina Jenkins');
insert into invoicing.customer_names (customer_name) values('Tara Thornton');
insert into invoicing.customer_names (customer_name) values('Kelly Hunt');
insert into invoicing.customer_names (customer_name) values('Taylor Cox');
insert into invoicing.customer_names (customer_name) values('Sean Howe');
insert into invoicing.customer_names (customer_name) values('Anita Villegas');
insert into invoicing.customer_names (customer_name) values('Mrs. Sarah Walton DDS');
insert into invoicing.customer_names (customer_name) values('Mandy Morgan');
insert into invoicing.customer_names (customer_name) values('Frederick Kim');
insert into invoicing.customer_names (customer_name) values('Christopher Brown');
insert into invoicing.customer_names (customer_name) values('Abigail Buchanan');
insert into invoicing.customer_names (customer_name) values('Bradley Murphy');
insert into invoicing.customer_names (customer_name) values('Matthew Nguyen');
insert into invoicing.customer_names (customer_name) values('Jacqueline Hanson');
insert into invoicing.customer_names (customer_name) values('Randy Foley');
insert into invoicing.customer_names (customer_name) values('Donna Snyder');
insert into invoicing.customer_names (customer_name) values('Mrs. Betty Ellis MD');
insert into invoicing.customer_names (customer_name) values('Jasmine Mccoy');
insert into invoicing.customer_names (customer_name) values('Ebony Bray');
insert into invoicing.customer_names (customer_name) values('Lisa Sanchez');
insert into invoicing.customer_names (customer_name) values('Jonathan Lloyd');
insert into invoicing.customer_names (customer_name) values('Rhonda Johnson');
insert into invoicing.customer_names (customer_name) values('Craig Shepard');
insert into invoicing.customer_names (customer_name) values('Anthony Hardin');
insert into invoicing.customer_names (customer_name) values('Dr. Emma Peck');
insert into invoicing.customer_names (customer_name) values('Kimberly Sweeney');
insert into invoicing.customer_names (customer_name) values('Brian Santos');
insert into invoicing.customer_names (customer_name) values('Christopher Jones');
insert into invoicing.customer_names (customer_name) values('Melissa Hall');
insert into invoicing.customer_names (customer_name) values('Jennifer Johnson');
insert into invoicing.customer_names (customer_name) values('Taylor Yoder');
insert into invoicing.customer_names (customer_name) values('William Cruz');
insert into invoicing.customer_names (customer_name) values('Karen Campbell');
insert into invoicing.customer_names (customer_name) values('Cole Rodriguez');
insert into invoicing.customer_names (customer_name) values('Jonathan Anderson');
insert into invoicing.customer_names (customer_name) values('Victor Meza');
insert into invoicing.customer_names (customer_name) values('Bailey Cline');
insert into invoicing.customer_names (customer_name) values('Jessica Taylor');
insert into invoicing.customer_names (customer_name) values('Matthew Griffith');
insert into invoicing.customer_names (customer_name) values('Norma Cannon');
insert into invoicing.customer_names (customer_name) values('George Burnett');
insert into invoicing.customer_names (customer_name) values('Elizabeth Mendez');
insert into invoicing.customer_names (customer_name) values('Kristopher Cox');
insert into invoicing.customer_names (customer_name) values('Mary Elliott');
insert into invoicing.customer_names (customer_name) values('Dennis Wise');
insert into invoicing.customer_names (customer_name) values('Tony Hudson');
insert into invoicing.customer_names (customer_name) values('Emily Munoz');
insert into invoicing.customer_names (customer_name) values('Martha Norman');
insert into invoicing.customer_names (customer_name) values('Andrew Callahan');
insert into invoicing.customer_names (customer_name) values('Tonya Mitchell');
insert into invoicing.customer_names (customer_name) values('Jessica Roberts');
insert into invoicing.customer_names (customer_name) values('James Conway');
insert into invoicing.customer_names (customer_name) values('Sarah Robinson');
insert into invoicing.customer_names (customer_name) values('Mary Abbott');
insert into invoicing.customer_names (customer_name) values('Sandra Sparks');
insert into invoicing.customer_names (customer_name) values('Joseph Nelson');
insert into invoicing.customer_names (customer_name) values('Valerie Graves');
insert into invoicing.customer_names (customer_name) values('Mike Gentry');
insert into invoicing.customer_names (customer_name) values('Tammy May');
insert into invoicing.customer_names (customer_name) values('Ryan Hernandez');
insert into invoicing.customer_names (customer_name) values('Donald Mcintyre');
insert into invoicing.customer_names (customer_name) values('Kaitlyn Valencia');
insert into invoicing.customer_names (customer_name) values('Frances Graham');
insert into invoicing.customer_names (customer_name) values('Chase Maxwell');
insert into invoicing.customer_names (customer_name) values('Collin Walker');
insert into invoicing.customer_names (customer_name) values('Brooke Hays');
insert into invoicing.customer_names (customer_name) values('Shannon Hall');
insert into invoicing.customer_names (customer_name) values('Donald Aguirre');
insert into invoicing.customer_names (customer_name) values('Stephanie Carr');


-- STEP 3.
-- Use the names and randomly update  invoicing.customers.cust_name with the data in
-- invoicing.customer_names.customer_name
-- ---------------------------------------------------------

-- TRIAL - 1.
-- select customer_name from invoicing.customer_names;
-- select value from generate_series(1000, 1101);
-- select value cust_id,customer_name from invoicing.customer_names,generate_series(1000, 1101);

-- TRIAL - 2.
-- Analytical Functions
select  row_number() over (order by customer_name)+(select min(cust_id)-1 from invoicing.customers)
       ,customer_name 
from   invoicing.customer_names;

select * from invoicing.customers;

-- TRIAL - 2 - Single Update
-- -----------------------
update invoicing.customers
set    invoicing.customers.cust_name = src.customer_name
--
from  (select  row_number() over (order by customer_name)+(select min(cust_id)-1 from invoicing.customers) cust_id
               ,customer_name 
       from    invoicing.customer_names) src
--
where  src.cust_id = invoicing.customers.cust_id;
   
-- TRIAL - 2 - Cursor
-- -----------------------
--cursor SQL:
--select  row_number() over (order by customer_name)+(select min(cust_id)-1 from invoicing.customers) cust_id
--               ,customer_name 
--from    invoicing.customer_names;

```
