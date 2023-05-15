# SQL SERVER DDL
> Venkata B / Tinitiate.com

## EMPLOYEE SCHEMA TABLE INSERTs

* Inserts for employees.dept 
```sql
insert into employees.dept (deptno,dname,loc) values (10, 'accounting', 'new york');
insert into employees.dept (deptno,dname,loc) values (20, 'research', 'dallas');
insert into employees.dept (deptno,dname,loc) values (30, 'sales', 'chicago');
insert into employees.dept (deptno,dname,loc) values (40, 'operations', 'boston');
```
* Inserts for employees.emp 
```sql
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7369, 'smith', 'clerk', 7902,'17-dec-1980', 800, null, 20);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7499, 'allen', 'salesman', 7698,'20-feb-1981', 1600, null, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7521, 'ward', 'salesman', 7698,'22-feb-1981', 1250, null, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7566, 'jones', 'manager', 7839,'2-apr-1981', 2975, null, 20);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7654, 'martin', 'salesman', 7698,'28-sep-1981', 1250, 1400, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7698, 'blake', 'manager', 7839,'1-may-1981', 2850, null, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7782, 'clark', 'manager', 7839,'9-jun-1981', 2450, null, 10);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7788, 'scott', 'analyst', 7566,'09-dec-1982', 3000, null, 20);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7839, 'king', 'president', null,'17-nov-1981', 5000, null, 10);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7844, 'turner', 'salesman', 7698,'8-sep-1981', 1500, 0, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7876, 'adams', 'clerk', 7788,'12-jan-1983', 1100, null, 20);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7900, 'james', 'clerk', 7698,'3-dec-1981', 950, null, 30);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7902, 'ford', 'analyst', 7566,'3-dec-1981', 3000, null, 20);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (7934, 'miller', 'clerk', 7782,'23-jan-1982', 1300, null, 10);
insert into employees.emp (empno,ename,job,mgr,hiredate,sal,commission,deptno) values (8000, 'newhire', 'clerk', 7782,'23-jan-1982', 1300, null, null);
```
* Inserts for employees.salgrade 
```sql
insert into employees.salgrade (grade,losal,hisal) values (1, 700, 1200);
insert into employees.salgrade (grade,losal,hisal) values (2, 1201, 1400);
insert into employees.salgrade (grade,losal,hisal) values (3, 1401, 2000);
insert into employees.salgrade (grade,losal,hisal) values (4, 2001, 3000);
insert into employees.salgrade (grade,losal,hisal) values (5, 3001, 9999);
```
* Inserts for employees.projects 
```sql
insert into employees.projects (projectno,budget,monthly_commission) values (1,10000,100);
insert into employees.projects (projectno,budget,monthly_commission) values (2,20000,200);
insert into employees.projects (projectno,budget,monthly_commission) values (3,30000,300);
```
* Inserts for employees.emp_projects 
```sql
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (1, 7369, 1, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (2, 7499, 2, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (3, 7521, 3, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (4, 7566, 1, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (5, 7654, 1, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (6, 7698, 2, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (7, 7782, 2, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (8, 7788, 2, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (9, 7839, 3, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (10, 7844, 3, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (11, 7876, 3, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (12, 7900, 2, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (13, 7902, 1, '1984/01/01', '1984/12/31');
insert into employees.emp_projects (emp_projectno,empno,projectno,start_date,end_date) values (14, 7934, 1, '1984/01/01', '1984/12/31');
```
