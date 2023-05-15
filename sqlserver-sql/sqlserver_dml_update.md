![alt text](sqlserver.png "Tinitiate SQLSERVER Training")

# SQL SERVER DML UPDATE

```sql
-- Updates

select *
from   tinitiate.employees.dept

select *
from   tinitiate.employees.emp
1   2450.00
2   3000.00
3   2850.00

1   2550.00
2   3100.00
3   2950.00

-- AVG  by Dept
1   2200.000000
2   2040.000000
3   2068.750000

go tinitiate

update employees.emp       -- Table Name
set    sal   = sal + 200   -- Column whose value needs to change
where  empno = 7369;

update employees.emp  -- Table Name
set    sal        = 1500
      ,commission  = 300  -- Column whose value needs to change
where  empno in (7521,7654);

-- Decrease the highest sal value in dept 1 by 250
-- -------------------------------------------------
-- Step 1. Identify the highest sal maker in dept 1
-- 
select max(e.sal)
from   employees.emp e
where  e.deptno = 1

--
-- Step 2. Use the above query to JOIN (or get) 
--         the sal which is max(sal) in given dept
--
update employees.emp  -- Table Name
set    sal = sal - 250
where  sal = (select max(e.sal)
               from   employees.emp e
               where  e.deptno = 1);
           

-- Increase the lowest sal where above 
-- sal average by dept, by 100 across all depts
-- -------------------------------------------------

-- Demonstrate the question with DEPT 2
--
select avg(e.sal)
from   employees.emp e
where  e.deptno = 2;
-- 2040.000000

select min(e.sal)
from   employees.emp e
where  e.deptno = 2
and    e.sal > (select avg(e.sal)
                from   employees.emp e
                where  e.deptno = 2
                );
--

-- lowest sal where above 
-- sal average by dept, by 100 across all depts
select e.deptno ,min(e.sal)
from   employees.emp e
      ,(select e.deptno,avg(e.sal) avg_dept_sal
        from   employees.emp e
        group by e.deptno) av
where  e.deptno = av.deptno
and    e.sal > av.avg_dept_sal
group by e.deptno

-- Using SubQuery
-- -------------------------
update employees.emp
set    employees.emp.sal = employees.emp.sal+100
from  ( select e.deptno ,min(e.sal) sal
        from   employees.emp e
              ,(select e.deptno,avg(e.sal) avg_dept_sal
                from   employees.emp e
                group by e.deptno) av
        where  e.deptno = av.deptno
        and    e.sal > av.avg_dept_sal
        group by e.deptno ) src
where  employees.emp.deptno = src.deptno
and    employees.emp.sal = src.sal;
               

```
