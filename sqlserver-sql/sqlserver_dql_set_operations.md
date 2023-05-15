![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQLSERVER SQL DQL - Data Query Language
> (c) Venkata Bhattaram / Tinitiate.com

## Data Query Language (DQL) Set Operations
* UNION
* UNION ALL
* INTERSECT
* EXCEPT
```sql
-- UNION / UNION ALL
select 1 id,'A' name
union all
select 2 id,'B' name
union all
select 3 id,'C' name
union all
select 4 id,'D' name
union all
select 4 id,'D' name


select 1 id,'A' name
union
select 2 id,'B' name
union
select 3 id,'C' name
union
select 4 id,'D' name 
union
select 4 id,'D' name


select * from (
    select 1 id,'A' name
    union all
    select 2 id,'B' name
    union all
    select 3 id,'C' name
    union all
    select 4 id,'D' name
    union all
    select 4 id,'D' name
) a

-- INTERSECT
select 4 id,'D' name 
intersect
select 4 id,'D' name


select 4 id,'D' name 
except
select 4 id,'D' name

```
