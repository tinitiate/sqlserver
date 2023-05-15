-- SQL
-- DataModeling = Entity(Tables) Relationship Diagram
-- Script to create and load sales data


-- TO DOs
-- 1. Create a clean script (well commented) with the Three tables + data (insert statements)
-- 2. Make sure the BILL_ID is added and create sales rows for some bills (10 Bills X 3-5 rows per bill in sales table)


-- Create the SALES DB
create database sales
go

-- Use the sales DB
use sales
go

-- Create Table
-------------------------------------------------------------------
create table products
(
prod_id   integer,
Prod_name varchar(100),
prod_type varchar(100),
price     decimal(6,2)
) 
go

-- Alter Column to not null
ALTER TABLE products ALTER COLUMN prod_id integer NOT NULL
go

alter table products add constraint products_pk primary key(prod_id)
go
-- -----------------------------------------------------------------

-- Load Data
BEGIN TRANSACTION
delete from products
go
insert into products values(1, 'Iphone 10', 'electronics',899)
go 
insert into products values(2, 'Dell 10', 'electronics',1200)
go 
insert into products values(3, 'samsung', 'electronics',800)
go 
insert into products values(4, 'Apples', 'fruit',1)
go 
insert into products values(5, 'Mangoes', 'fruit',2)
go 
insert into products values(6, 'Bananas', 'fruit',1)
go 
insert into products values(7, 'Dish Wash Cleaner', 'cleaning',3) 
go 
insert into products values(8, 'Laundry Cleaner', 'cleaning',3) 
go 
insert into products values(9, 'Floor Cleaner', 'cleaning',2) 
go 
insert into products values(10, 'Milk', 'dairy',4) 
go 
insert into products values(11, 'Butter', 'dairy',4)
go 
insert into products values(12, 'Cheese', 'dairy',4) 
go 
insert into products values(13, 'Printer ink', 'Office Supplies',10)
go 
insert into products values(14, 'Paper Rolls', 'Office Supplies',10) 
go 
insert into products values(15, 'Pens', 'Office Supplies',3)
go 
insert into products values(16, 'Printer', 'electronics',50)
go 
insert into products values(17, 'HDTV', 'electronics',300) 
go 
insert into products values(18, 'UHDTV', 'electronics',400)
go 
insert into products values(19, 'Cereal', 'food',4)
go 
insert into products values(20, 'Chips', 'food',3)
go 
insert into products values(21, 'pop corn', 'food',3)
go 
insert into products values(22, 'Batter', 'food',5)
go 
insert into products values(23, 'cake', 'food',5)
go 
insert into products values(24, 'dry fruits', 'food',8)
go 
insert into products values(25, 'ice cream', 'frozen food',8)
go 
insert into products values(26, 'frozen pizza', 'frozen food',5)
go 
insert into products values(27, 'frozen peas', 'frozen food',3) 
go 
insert into products values(28, 'veg breakfast', 'food',5)
go 
insert into products values(29, 'egg breakfast', 'food',6)
go 
insert into products values(30, 'chicken breakfast', 'food',7)
go 
commit tran
go
-----------------------------------------------------------------
-- Test Load
select * from products
go


drop table stores;

create table stores 
(
store_id integer  IDENTITY(1000000,1),
store_address varchar(256),
city varchar(128),
region varchar(128),
state varchar(128),
country varchar(128)
);

alter table stores add constraint stores_pk primary key(store_id);

-- stores CSV
insert into stores(store_address,city,region,state,country) values('100 A Street,','City A', 'A', 'NJ', null);
insert into stores(store_address,city,region,state,country) values('1000 B Street','City B', 'B', 'AS', 'United States');
insert into stores values('1000 B Street','City B', 'B', 'AS', 'United States');
select * from stores;

2, '1000 B Street','City B', 'B', 'AS', 'United States'
3, '1000 C Street','City C', 'C', 'TX', 'United States'
4, '1000 D Street','City D', 'D', 'AR', 'United States'
5, '1000 E Street','City E', 'A', 'NE', 'United States'
6, '1000 F Street','City F', 'B', 'MN', 'United States'
7, '1000 G Street','City G', 'C', 'ME', 'United States'
8, '1000 H Street','City H', 'D', 'NY', 'United States'
----


drop table sales;
select * from sales
create table sales
(
sale_id        integer not null,
bill_id        int,
sale_type      varchar(100),
sale_datetime  date,
store_id       integer,      -- FK
eid            integer,
prod_id 	   integer,      -- FK
price 		   decimal(6,2),  -- null
quantity 	   integer
);
insert into sales values (1,'offline', CONVERT(varchar, '2017-08-25', 101), 1, 2, 1,null,2);
insert into sales values (1,'offline', CONVERT(varchar, '2017/01/15', 101), 1, 2, 2,null,2);
select GETDATE()

alter table sales add constraint sales_pk primary key(sale_id);
alter table sales add constraint FK_sales foreign key(prod_id) references products(prod_id);
-- alter table sales add constraint FK_empid foreign key(eid) references employee(eid);
alter table sales add constraint FK_storeid foreign key(store_id) references stores(store_id);
