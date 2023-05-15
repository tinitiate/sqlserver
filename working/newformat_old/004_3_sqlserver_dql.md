# SQLSERVER SQL DQL - Data Query Language
> (c) Venkata Bhattaram / Tinitiate.com

* Data Query Language (DQL) is a set of SQL statements that are used to retrieve data from a database. DQL statements are used to select, filter, and sort data from tables, views, and other database objects.

* DQL statement Select Clause components
     * SELECT: This statement is used to select data **from** a table or view.
    * WHERE: This clause is used to filter and /or **join** the rows that are returned by the SELECT statement.
    * GROUP BY: This clause is used to group the rows that are returned by the SELECT statement.
    * HAVING: This clause is used to filter the groups that are returned by the GROUP BY clause.
    * ORDER BY: This clause is used to sort the rows that are returned by the SELECT statement.
    * TOP: This clause is used to limit the number of rows that are returned by the SELECT statement.
* DQL statements are used to retrieve data from a database. They are the most commonly used type of SQL statement.

```sql
-- Check Data
-- ----------
select *
from   employees.dept;


-- Insert data to EMP table
insert into employees.emp values (7369, 'smith', 'clerk', 7902, '17-dec-1980', 800, null, 1);
insert into employees.emp values (7499, 'allen', 'salesman', 7698, '20-feb-1981', 1600, null, 2);
insert into employees.emp values (7521, 'ward', 'salesman', 7698, '22-feb-1981', 1250, null, 2);
insert into employees.emp values (7566, 'jones', 'manager', 7839, '2-apr-1981', 2975, null, 3);
insert into employees.emp values (7654, 'martin', 'salesman', 7698, '28-sep-1981', 1250, 1400, 1);
insert into employees.emp values (7698, 'blake', 'manager', 7839, '1-may-1981', 2850, null, 3);
insert into employees.emp values (7782, 'clark', 'manager', 7839, '9-jun-1981', 2450, null, 1);
insert into employees.emp values (7788, 'scott', 'analyst', 7566, '09-dec-1982', 3000, null, 2);
insert into employees.emp values (7839, 'king', 'president', null, '17-nov-1981', 5000, null, 1);
insert into employees.emp values (7844, 'turner', 'salesman', 7698, '8-sep-1981', 1500, 0, 3);
insert into employees.emp values (7876, 'adams', 'clerk', 7788, '12-jan-1983', 1100, null, 2);
insert into employees.emp values (7900, 'james', 'clerk', 7698, '3-dec-1981', 950, null, 3);
insert into employees.emp values (7902, 'ford', 'analyst', 7566, '3-dec-1981', 3000, null, 2);
insert into employees.emp values (7934, 'miller', 'clerk', 7782, '23-jan-1982', 1300, null, 1);
insert into employees.emp values (8000, 'NEWHIRE', 'clerk', 7782, '01-jan-1984', 1300, null, null);

-- FK failure scenario
insert into employees.emp values (8000, 'miller', 'clerk', 7782, '23-jan-1982', 1300, null, 10);

select * from employees.emp;


-- DQL = Data Query Language
-- ---------------------------------------------

select *
from   employees.dept;


-- JOINS
select  d.dname
from    employees.dept d
       ,employees.emp e
where  e.empno = 7521
and    d.deptid = e.deptno


-- Aggregate Functions -> will return only one row and one column
-- MIN MAX AVG SUM COUNT

-- ALL ROWS and ALL COLUMNS
select *
from   employees.emp;

-- Get Max of sal across all departments
select  max(sal) max_sal,min(sal)
       ,sum(sal),count(sal),sum(sal)/count(sal) avg, avg(sal)
from   employees.emp;

-- Get Max of sal in finance department by deptID/deptNO
select max(sal)
from   employees.emp
where  deptno=3;

-- Get Max of sal in finance department by dname
select max(sal)
from   employees.dept d
       ,employees.emp e
where  d.dname = 'FINANCE'
and    d.deptid = e.deptno

select max(sal)
from   employees.dept d
       ,employees.emp e
where  d.deptid = 3
and    d.deptid = e.deptno

select max(sal)
from   employees.dept d
       ,employees.emp e
where  e.deptno = 3
and    d.deptid = e.deptno


-- get the name of emp who makes the highest sal across all depts

-- 1. Check the emp table
--
select * from employees.emp e

-- 2. Get Max Sal from emp table
-- a. This returns A SINGLE VALUE =(One Row One Column)
select max(e.sal) from employees.emp e

-- 3. Join MAX SAL with EMP.SAL (Like to Like, Sal to another Sal )
select e.ename
from   employees.emp e
where  e.sal = (select max(e.sal) from employees.emp e);


-- The below syntax is invalid
-- ----------------------------
-- select e.ename
-- from   employees.emp e
-- where  e.sal = max(e.sal)

-- Get the Name of Dept of the lowest salary maker

-- 1. get lowest sal maker
-- 1a. Get the lowest sal 
select min(e.sal) from employees.emp e

-- 1b. Get the name and dept of teh lowest sal maker
select e.ename, e.deptno 
from   employees.emp e
where  e.sal = (select min(e.sal) from employees.emp e)

-- 2. Join DEPT to the (1b) query to get the corresponding DNAME
select e.ename, e.deptno ,d.dname 
from   employees.emp e,
       employees.dept d
where  e.sal = (select min(e.sal) from employees.emp e)
and d.deptid = e.deptno


-- GROUP BY
-- With Respect To a Column(s)
select * from employees.emp e

-- Get the Total sal for each dept
select sum(e.sal),min(e.sal),max(e.sal),count(e.sal),e.deptno 
from   employees.emp e
group by e.deptno 

-- DISTINCT
select e.deptno from employees.emp e
select DISTINCT e.deptno from employees.emp e

-- Get DNAME, in which the salary is greatest 
-- AND less than 3000, in each department
1. Get MAX SAL < 3000 in all DEPTS

select max(e.sal) max_sal, e.deptno,d.dname 
from   employees.emp e
       ,employees.dept d 
where  e.sal < 3000
and    d.deptid = e.deptno 
group by e.deptno ,d.dname 
-- group by d.deptid ,d.dname



-- IN and NOT IN Clause
-- Get Details of a given Empno
select e.* 
from   employees.emp e
where  e.empno = 7499;

-- Get Details of more than ONE Empno
select e.* 
from   employees.emp e
where  e.empno in (7369,7499,7521,7566);

select e.* 
from   employees.emp e
where  e.empno not in (7369,7499,7521,7566);


-- OUTER JOINS
-- SQL92 JOIN SYNTAX
select *
from   employees.emp e
       ,employees.dept d 
where  d.deptid = e.deptno

-- ANSI JOIN SYNTAX
select *
from   employees.emp e
inner join employees.dept d 
on d.deptid = e.deptno;


select * from employees.dept d
select * from   employees.emp e
select distinct e.deptno from   employees.emp e

-- FULL OUTER JOIN
select *
from   employees.emp e
full outer join employees.dept d 
on d.deptid = e.deptno;

-- LEFT OUTER JOIN
select *
from   employees.emp e
left outer join employees.dept d 
on d.deptid = e.deptno;

-- RIGHT OUTER JOIN
select *
from   employees.emp e
right outer join employees.dept d 
on d.deptid = e.deptno;

select *
from   employees.dept d
left join employees.emp e 
on d.deptid = e.deptno;


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


-- HAVING CLAUSE
select max(e.sal) max_sal, e.deptno,d.dname 
from   employees.emp e
       ,employees.dept d 
-- where  e.sal < 3000
where    d.deptid = e.deptno 
group by e.deptno ,d.dname 
having max(e.sal) < 3001


select * from   employees.emp e

select max(e.sal) max_sal, e.deptno,d.dname 
from   employees.emp e
       ,employees.dept d 
where  e.sal < 3000
and    d.deptid = e.deptno 
group by e.deptno ,d.dname 


-- ORDER BY
-- Get emp details by salary earnings
select * from employees.emp e
order by e.sal;

select * from employees.emp e
order by e.sal desc

select * from employees.emp e
order by e.deptno asc ,e.sal desc

select * from employees.emp e
order by e.deptno desc,e.sal;


select * from employees.emp e
order by e.deptno desc,e.sal desc;

select * from employees.emp e
where e.sal < 3000
order by e.deptno desc,e.sal desc;


-- Analytical Function
-- Exists and Not Exists
```
