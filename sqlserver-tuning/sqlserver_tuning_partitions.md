## SQLSERVER FILEGROUPS and DATAFILES
SQL Server, a filegroup is a logical container that holds one or more data files. Filegroups provide a way to organize and manage the physical storage of database objects. Each database in SQL Server consists of at least one filegroup called the primary filegroup, and you can create additional filegroups to suit your requirements.

* Storage Organization: Filegroups allow you to group related database objects together and control their physical storage. You can assign different filegroups to different database tables, indexes, or other objects.
* Data Files: A data file is a physical file on the disk that belongs to a specific filegroup. Each filegroup can contain one or more data files. The data files within a filegroup store the actual data and index pages for the objects assigned to that filegroup.
* Placement and Allocation: By distributing data files across different filegroups, you can control the placement of database objects on different disks or storage devices. This enables you to optimize I/O performance, separate user data from system data, or manage storage capacity effectively.
* Backup and Restore: You can perform backup and restore operations at the filegroup level. This allows for more granular control over backup and recovery processes. For example, you can back up specific filegroups separately, enabling faster recovery for critical data.
* Recovery and Availability: Filegroups play a role in database recovery and availability. During a restore operation, you can recover individual filegroups or make them available for use independently. This allows you to prioritize the recovery of critical data and minimize downtime.
* Read-Only Filegroups: SQL Server also supports read-only filegroups, which contain read-only database objects. Read-only filegroups are useful for scenarios where you have static or historical data that doesn't require modification. They can improve performance and simplify backup and maintenance tasks.

## Horizontal Partition Range partition
Horizontal partitioning, also known as range partitioning, is a database design technique used to divide a large table into multiple smaller tables, each containing a specific range of data. In the context of SQL Server, range partitioning involves distributing rows of a table across multiple filegroups or physical files based on a defined partition key.
To implement range partitioning in SQL Server, you need to follow these general steps:

* Determine the partition key: Choose a column or set of columns that will be used to define the partition ranges. This column should typically have a logical ordering, such as a date or numeric value.
* Create a partition function: A partition function defines how the data will be partitioned based on the partition key. In the case of range partitioning, you'll specify the ranges or boundaries that define each partition.

### Multiple partitions on a single filegroup in SQL Server can offer some advantages and disadvantages
* **Advantages**
    * Simplified management: With multiple partitions on a single filegroup, you have fewer filegroups to manage. This can simplify tasks such as backup and restore operations, filegroup-level configuration settings, and overall database administration.
    * Improved performance: Partitioning allows for parallelism and partition elimination, which can improve query performance. Having multiple partitions on a single filegroup can further enhance performance by reducing disk I/O contention and allowing for better distribution of data across files within the filegroup.
    * Cost-effective storage: When you have limited storage resources, using multiple partitions on a single filegroup can be a cost-effective solution. It allows you to leverage a single filegroup and allocate storage efficiently without the need for additional filegroups or files.
* **Disadvantages**
    * Limited scalability: While multiple partitions on a single filegroup can improve performance and simplify management, it may limit scalability in terms of storage capacity. If the filegroup reaches its maximum storage limit, you would need to consider adding more filegroups or redistributing data across multiple filegroups.
    * Increased risk of data loss: Storing multiple partitions on a single filegroup means that a failure or corruption of the filegroup could potentially affect all the partitions within it. If the filegroup becomes unavailable or inaccessible, you may lose access to data across multiple partitions.
    * Limited control over placement: When all partitions reside on a single filegroup, you have limited control over the physical placement of data on disk. You cannot explicitly specify which partition should be placed on which disk or utilize specific storage characteristics for individual partitions.


### Multiple partitions on multiple filegroups in SQL Server can provide several advantages and disadvantages
* **Advantages**
    * Improved scalability: By distributing partitions across multiple filegroups, you can scale your database storage more effectively. Each filegroup can reside on a separate disk or storage device, allowing for better I/O performance and increased storage capacity.
    * Enhanced performance: With multiple filegroups, you can leverage parallelism and take advantage of concurrent read and write operations across different disks. This can result in improved query performance and reduced contention for disk I/O.
    * Increased fault tolerance: If a filegroup becomes unavailable or experiences a failure, having partitions spread across multiple filegroups provides better fault tolerance. You can recover data from unaffected filegroups while addressing issues in the problematic filegroup.
    * Flexibility in storage management: Having multiple filegroups allows for more granular control over storage configuration. You can allocate different types of storage (e.g., SSD, HDD) to specific filegroups based on the performance requirements of individual partitions. Additionally, you can perform maintenance tasks, such as backup and restore operations, on a per-filegroup basis.
* **Disadvantages**
    * Complexity in administration: Managing multiple filegroups requires more administrative effort compared to a single filegroup. You need to handle tasks like capacity planning, filegroup configuration, and monitoring multiple filegroups to ensure optimal performance and data integrity.
    * Increased maintenance overhead: Maintaining multiple filegroups involves additional tasks, such as monitoring disk space utilization, managing filegroup-specific backup and restore operations, and ensuring consistent filegroup-level configuration settings. This can lead to increased maintenance complexity and overhead.
    * Potential for data imbalance: Uneven distribution of data across filegroups can occur if partitions are not evenly distributed or if the workload patterns are skewed. This can result in suboptimal performance, with some filegroups being underutilized while others are overloaded.


```sql
-- STEP 1
-- -----------------------------------------------------
-- Create Data Files
-- -----------------------------------------------------
select * from sys.database_files;

-- Create File Group
-- -------------------
alter database tinitiate add filegroup invd_2023;

-- Create DataFiles for each Partition
-- ------------------------------------
alter database tinitiate add file (name = invd_012023,filename = '/var/opt/mssql/data/invd_012023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_022023,filename = '/var/opt/mssql/data/invd_022023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_032023,filename = '/var/opt/mssql/data/invd_032023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_042023,filename = '/var/opt/mssql/data/invd_042023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_052023,filename = '/var/opt/mssql/data/invd_052023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_062023,filename = '/var/opt/mssql/data/invd_062023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_072023,filename = '/var/opt/mssql/data/invd_072023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_082023,filename = '/var/opt/mssql/data/invd_082023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_092023,filename = '/var/opt/mssql/data/invd_092023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_102023,filename = '/var/opt/mssql/data/invd_102023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_112023,filename = '/var/opt/mssql/data/invd_112023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;
alter database tinitiate add file (name = invd_122023,filename = '/var/opt/mssql/data/invd_122023.ndf',
size = 10 mb, maxsize = unlimited, filegrowth = 1024 kb) to filegroup invd_2023;


-- STEP 2
-- -----------------------------------------------------
-- Create a New Partition Table
-- -----------------------------------------------------
create partition function y2023_mon_part_fn(date)
as range right for values (
'2023-01-01','2023-02-01','2023-03-01','2023-04-01','2023-05-01','2023-06-01',
'2023-07-01','2023-08-01','2023-09-01','2023-10-01','2023-11-01','2023-12-01'
);

-- Check the function
-- ------------------
select * from sys.partition_functions;


-- STEP 2.
-- -----------------------------------------------------
-- Create a New Partition Table
-- -----------------------------------------------------
create partition scheme monthlypartitionscheme
as partition y2023_mon_part_fn
to (
    [invd_012023], [invd_february], [invd_march],
    [invd_april], [invd_may], [invd_june],
    [invd_july], [invd_august], [invd_september],
    [invd_october], [invd_november], [invd_december]
);


create table sqltuning.invoice_part_tab
(
     customer_id      int
    ,customer_name    varchar(100)
    ,invoice_date     date
    ,invoice_id       int
    ,discount_percent decimal(10,2)
    ,primary key (customer_id, invoice_id,invoice_date)
) on monthlypartitionscheme (invoice_date);

insert into sqltuning.invoice_part_tab
select  customer_id
       ,customer_name
       ,invoice_date
       ,invoice_id
       ,discount_percent
from   sqltuning.stg_invoice;

-- Check Partitions
-- ------------------------------------------------------
select distinct ps.Name AS PartitionScheme, 
    pf.name AS PartitionFunction,fg.name AS FileGroupName, 
    rv.value AS PartitionFunctionValue,
    PF.type_desc as PartitionType
,(case when PF.boundary_value_on_right=0 then 'LEFT' else 'Right' end) as LeftORRightHere
    from sys.indexes i  
    join sys.partitions p ON i.object_id=p.object_id AND i.index_id=p.index_id  
    join sys.partition_schemes ps on ps.data_space_id = i.data_space_id  
    join sys.partition_functions pf on pf.function_id = ps.function_id  
    left join sys.partition_range_values rv on rv.function_id = pf.function_id AND rv.boundary_id = p.partition_number
    join sys.allocation_units au  ON au.container_id = p.hobt_id   
    join sys.filegroups fg  ON fg.data_space_id = au.data_space_id;

```


## Horizontal Partition Hash partition
SQL Server, horizontal partitioning can also be achieved using hash partitioning. Hash partitioning involves distributing the rows of a table across multiple partitions based on a hash function applied to a chosen column. The goal is to evenly distribute the data across the partitions.
To implement hash partitioning in SQL Server, you can follow these general steps:

* Determine the partitioning column: Choose a column that will be used as the input for the hash function. This column should have a good distribution of values to ensure even distribution across partitions.
* Create a partition function: The partition function defines the number of partitions and the logic for distributing rows across those partitions using a hash function.

```sql

```
