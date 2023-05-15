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
```
