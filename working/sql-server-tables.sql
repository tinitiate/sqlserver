use sales
go

-- Products Table
drop table products
go

create table products
(
prod_id   integer not null,
Prod_name varchar(100),
prod_type varchar(100),
price     decimal(6,2)
) 
go

-- Alter Column to not null
ALTER TABLE test ALTER COLUMN ID INT NOT NULL;
go

alter table products add constraint products_pk primary key(prod_id)
go



-- products CSV
1, 'Iphone 10', 'electronics',899
2, 'Dell 10', 'electronics',1200
3, 'samsung', 'electronics',800
4, 'Apples', 'fruit',1
5, 'Mangoes', 'fruit'2
6, 'Bananas', 'fruit',1
7, 'Dish Wash Cleaner', 'cleaning',3
8, 'Laundry Cleaner', 'cleaning',3
9, 'Floor Cleaner', 'cleaning',2
10, 'Milk', 'dairy',4
11, 'Butter', 'dairy',4
12, 'Cheese', 'dairy',4
13, 'Printer ink', 'Office Supplies',10
14, 'Paper Rolls', 'Office Supplies',10
15, 'Pens', 'Office Supplies',3
16, 'Printer', 'electronics',50
17, 'HDTV', 'electronics',300
18, 'UHDTV', 'electronics',400
19, 'Cereal', 'food',4
20, 'Chips', 'food',3
21, 'pop corn', 'food',3
22, 'Batter', 'food',5
23, 'cake', 'food',5
24, 'dry fruits', 'food',8
25, 'ice cream', 'frozen food',8
26, 'frozen pizza', 'frozen food',5
27, 'frozen peas', 'frozen food',3
28, 'veg breakfast', 'food',5
29, 'egg breakfast', 'food',6
30, 'chicken breakfast', 'food',7
------

drop table stores;
create table stores 
(
store_id integer,
store_address varchar(256),
city varchar(128),
region varchar(128),
state varchar(128),
country varchar(128)
);

alter table stores add constraint stores_pk primary key(store_id);

-- stores CSV
1, '100 A Street,','City A', 'A', 'NJ', 'United States'
2, '1000 B Street','City B', 'B', 'AS', 'United States'
3, '1000 C Street','City C', 'C', 'TX', 'United States'
4, '1000 D Street','City D', 'D', 'AR', 'United States'
5, '1000 E Street','City E', 'A', 'NE', 'United States'
6, '1000 F Street','City F', 'B', 'MN', 'United States'
7, '1000 G Street','City G', 'C', 'ME', 'United States'
8, '1000 H Street','City H', 'D', 'NY', 'United States'
----

drop table sales;

create table sales
(
sale_id        integer not null,
sale_type      varchar(100),
sale_datetime  date,
store_id       integer,
eid            integer,
prod_id 	   integer,
price 		   decimal(6,2),
quantity 	   integer
);

alter table sales add constraint sales_pk primary key(sale_id);
alter table sales add constraint FK_sales foreign key(prod_id) references products(prod_id);
alter table sales add constraint FK_empid foreign key(eid) references employee(eid);
alter table sales add constraint FK_storeid foreign key(store_id) references stores(store_id);








