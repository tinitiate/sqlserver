![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQLSERVER SQL DQL - Analytical Functions
> (c) Venkata Bhattaram / Tinitiate.com

* SQL Server provides a set of analytical functions that allow you to perform advanced calculations and aggregations on your data. These functions operate on a group of rows and return a single result for each group, based on the values in one or more columns. Here are some examples of commonly used analytical functions in SQL Server:

    * ROW_NUMBER(): This function assigns a unique sequential number to each row within a result set, based on the specified order.
    * RANK(), DENSE_RANK(), and NTILE(): These functions are used to assign a ranking or percentile value to each row within a result set, based on the specified order.
    * LAG() and LEAD(): These functions allow you to access data from other rows within the same result set, either before or after the current row.
    * SUM(), AVG(), MIN(), and MAX(): These functions are used to calculate aggregations over a group of rows, based on the values in one or more columns.
    * FIRST_VALUE() and LAST_VALUE(): These functions allow you to access the first or last value in a group of rows, based on the specified order.
    * PERCENTILE_CONT() and PERCENTILE_DISC(): These functions allow you to calculate a specified percentile value over a group of rows, either using a continuous or discrete distribution.

## Analytical Functions MIN, MAX, SUM, AVG, COUNT
* Get Raw data and MIN, MAX, SUM, AVG, COUNT Aggregate functions in a single select statement
```sql
-- Analytical Functions MIN, MAX, SUM, AVG, COUNT
-- ---------------------------------------------
-- RAW Data
select *
from   employees.emp e;

-- MIN, MAX, SUM, AVG, COUNT For each Dept
select  deptno
       ,max(sal) max_dept_sal
       ,min(sal) min_dept_sal
       ,sum(sal) tot_dept_sal
       ,avg(sal)avg_dept_sal
from  employees.emp e
group by deptno;

-- Raw data and MIN, MAX, SUM, AVG, COUNT Aggregate functions WRT. every dept
SELECT  e.*
       ,max(sal) OVER () AS max_sal
       ,max(sal) OVER (PARTITION BY deptno) AS max_dept_sal
       ,min(sal) OVER (PARTITION BY deptno) AS min_dept_sal
       ,sum(sal) OVER (PARTITION BY deptno) AS tot_dept_sal
       ,avg(sal) OVER (PARTITION BY deptno) AS avg_dept_sal
       ,count(1) OVER (PARTITION BY deptno) AS emp_count_by_dept
FROM   employees.emp e;
```

## ROW_NUMBER 
* The ROW_NUMBER analytic function assigns a unique number to each row in a result set, starting with 1. The number is assigned in the order specified by the ORDER BY clause.
```sql
select  row_number() over (order by sal)      sal_rn_asc
       ,row_number() over (order by sal desc) sal_rn_desc
       ,row_number() over (order by empno)    empno_rn
       ,e.*
from   employees.emp e
order by deptno;
```
* The ROW_NUMBER() function is a window function that assigns a sequential integer to each row within the partition of a result set. The row number starts with 1 for the first row in each partition.
* The PARTITION BY clause is used to divide the result set into partitions. The ROW_NUMBER() function is then applied to each partition separately and reinitialized the row number for each partition.
```sql
select  row_number() over (partition by deptno order by sal)      sal_rn_asc
       ,row_number() over (partition by deptno order by sal desc) sal_rn_desc
       ,row_number() over (partition by deptno order by empno)    empno_rn
       ,e.*
from   employees.emp e
order by deptno;
```

## RANK
* The RANK() function is a window function that assigns a rank to each row in a result set, starting with 1 for the row with the highest value in the specified column. If two or more rows have the same value, they will be assigned the same rank.
```sql
select  e.*
       ,rank() over (order by sal desc) as rank
       ,dense_rank() over (order by sal desc) as dense_rank
       ,row_number() over (order by sal desc) as rn
from   employees.emp e;
```

* The RANK() function is a window function that assigns a rank to each row in a result set, starting with 1 for the row with the highest value in the specified column. If two or more rows have the same value, they will be assigned the same rank.
* The PARTITION BY clause is used to divide the result set into partitions. The RANK() function is then applied to each partition separately and reinitialized the rank for each partition.
```sql
select  e.*
       ,rank()       over (partition by deptno order by sal desc) as rank
       ,dense_rank() over (partition by deptno order by sal desc) as dense_rank
       ,row_number() over (partition by deptno order by sal desc) as rn
from   employees.emp e;

```

## DENSE_RANK
* The DENSE_RANK() function is a window function that assigns a rank to each row in a result set, starting with 1 for the row with the highest value in the specified column. If two or more rows have the same value, they will be assigned the same rank. However, unlike the RANK() function, DENSE_RANK() does not skip ranks for rows with the same value.
```SQL 
select  e.*
       ,rank() over (order by sal desc) as rank
       ,dense_rank() over (order by sal desc) as dense_rank
       ,row_number() over (order by sal desc) as rn
from   employees.emp e;
```

* The DENSE_RANK() function is a window function that assigns a rank to each row in a result set, starting with 1 for the row with the highest value in the specified column. If two or more rows have the same value, they will be assigned the same rank. However, unlike the RANK() function, DENSE_RANK() does not skip ranks for rows with the same value.
* The PARTITION BY clause is used to divide the result set into partitions. The DENSE_RANK() function is then applied to each partition separately and reinitialized the rank for each partition.
```SQL 
select  e.*
       ,rank()       over (partition by deptno order by sal desc) as rank
       ,dense_rank() over (partition by deptno order by sal desc) as dense_rank
       ,row_number() over (partition by deptno order by sal desc) as rn
from   employees.emp e;
```

## NTILE
* The NTILE analytic function in SQL divides an ordered result set into a specified number of groups, or buckets. The groups are numbered, starting at one. For each row, NTILE returns the number of the group to which the row belongs.
* The syntax for the NTILE function is as follows:
* Code snippet: `NTILE(n) OVER ([PARTITION BY <expression>] ORDER BY <expression>)`
    * n is a positive integer that specifies the number of groups into which the result set should be divided.
    * PARTITION BY is an optional clause that can be used to divide the result set into multiple partitions before the NTILE function is applied.
    * ORDER BY is an optional clause that specifies the order in which the rows in the result set should be sorted before the NTILE function is applied.
```sql
SELECT empno, sal, NTILE(4) OVER (ORDER BY sal) AS bucket
FROM employees.emp;
```
* The NTILE function can also be used with the PARTITION BY clause to divide a result set into groups based on the value of a column.
```sql
SELECT empno, deptno, NTILE(4) OVER (PARTITION BY deptno ORDER BY sal) AS bucket
FROM   employees.emp;
```

## LEAD
* The LEAD function in SQL is an analytic function that returns the value of an expression from a subsequent row within the partition.
```sql
select  empno, sal 
       ,lead(sal) over (order by sal) next_salary
       ,lag(sal) over (order by sal)  previous_salary
from   employees.emp;
```
* The LEAD function can also be used with the PARTITION BY clause to return the value of an expression from a subsequent row within the partition. 
```sql
SELECT employee_id, department, salary, LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
FROM employees
WHERE department = 'Sales';
```

## LAG
* The LAG function in SQL is an analytic function that returns the value of an expression from a previous row within the partition. 
```sql
SELECT employee_id, salary, LAG(salary) OVER (ORDER BY salary) AS previous_salary
FROM employees;
```

* The LAG function can also be used with the PARTITION BY clause to return the value of an expression from a previous row within the partition.
```sql
SELECT employee_id, department, salary, LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS previous_salary
FROM employees
WHERE department = 'Sales';
```

## FIRST_VALUE
* The FIRST_VALUE function in SQL is an analytic function that returns the first value of an expression in an ordered partition of a result set.
```sql
select  deptno, empno, sal
       ,first_value(sal) over (order by sal,empno) as first_salary
       ,last_value(sal)  over (order by sal,empno) as last_salary
from   employees.emp
```
* The FIRST_VALUE function can also be used with the PARTITION BY clause to return the first value of an expression in an ordered partition of a result set. 
```sql
select  deptno, empno, sal
       ,first_value(sal) over (partition by deptno order by sal,empno) as first_salary
       ,last_value(sal)  over (partition by deptno order by sal,empno) as last_salary
from   employees.emp
where  deptno = 2
```

## LAST_VALUE
* The LAST_VALUE function in SQL is an analytic function that returns the last value of an expression in an ordered partition of a result set.
```sql
select  deptno, empno, sal
       ,first_value(sal) over (partition by deptno order by sal,empno) as first_salary
       ,last_value(sal)  over (partition by deptno order by sal,empno) as last_salary
from   employees.emp
where  deptno = 2
```
* The LAST_VALUE function can also be used with the PARTITION BY clause to return the last value of an expression in an ordered partition of a result set
```sql
SELECT employee_id, department, salary, LAST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary) AS last_salary
FROM employees
WHERE department = 'Sales';
```