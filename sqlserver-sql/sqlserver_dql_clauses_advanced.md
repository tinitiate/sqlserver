![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQLSERVER SQL DQL - Data Query Language
> (c) Venkata Bhattaram / Tinitiate.com
* In Clause
* Not In Clause
* Exists Clause
* Not Exists Clause
* With Clause

## IN Clause
```sql
select *
from   employees.emp
where  empno in (7566,7654,7698,7782);

select *
from   employees.emp
where  ename in ('smith','allen','ward');

```

## NOT IN Clause
```sql
select *
from   employees.emp
where  empno not in (7566,7654,7698,7782);

select *
from   employees.emp
where  ename not in ('smith','allen','ward');
```
## EXISTS and NOT EXISTS
* Data Prep
```sql
-- "DATASET-1"
-- Get data for all EMPs making sal < (highest sal - 2000)
-- -------------------------------------------------------
-- STEP 1.
select max(sal) - 2000
from   employees.emp

-- STEP 2.
select *
from   employees.emp
where  sal < (select max(sal) - 2000
              from   employees.emp);
```

* Exists Clause

```sql
-- Get EMP data where EMPs not in above dataset (DATASET-1)             
-- --------------------------------------------------------
select *
from   employees.emp e
where  e.empno in (select s.empno
                       from   employees.emp s
                       where  sal < (select max(sal) - 2000
                                     from   employees.emp a)
                       );

-- EXISTS = Streaming Data (apply IN or NOT IN)
-- --------------------------------------------------------
-- NOT EXISTS
select *
from   employees.emp e
where  exists (select 'aaaaa' -- 1 --empno
                   from   employees.emp s
                   where  s.sal < (select max(a.sal) - 2000
                                   from   employees.emp a)
                   and    e.empno = s.empno
                   );
```

* Not Exists Clause
```sql
-- Get EMP data where EMPs not in above dataset (DATASET-1)             
-- --------------------------------------------------------
select *
from   employees.emp e
where  e.empno not in (select s.empno
                       from   employees.emp s
                       where  sal < (select max(sal) - 2000
                                     from   employees.emp a)
                       );

-- EXISTS = Streaming Data (apply IN or NOT IN)
-- --------------------------------------------------------
-- NOT EXISTS
select *
from   employees.emp e
where  not exists (select 'aaaaa' -- 1 --empno
                   from   employees.emp s
                   where  s.sal < (select max(a.sal) - 2000
                                   from   employees.emp a)
                   and    e.empno = s.empno
                   );
```

## With Clause
```sql
-- With Clause (CTE = Common Table Expressions)
-- --------------------------------------------
with s as 
(select empno
 from   employees.emp
 where  sal < (select max(a.sal) - 2000
               from   employees.emp a)),
a as (select 7876 empno)
select *
from   employees.emp e
       ,s
       ,a
where  e.empno = s.empno
and    e.empno = a.empno;

-- Without with Clause
-- ------------------------------------ 
select *
from    employees.emp e
       ,(select empno
         from   employees.emp
         where  sal < (select max(a.sal) - 2000
                       from   employees.emp a)) s
where  e.empno = s.empno;
```