# SQL SERVER Built INs

## SQL Server built-in global variables
* Get Version
```sql
SELECT @@version;
```

* The name of the local SQL Server
```sql
select @@SERVERNAME;
```

* The number of rows affected by the last command.
```sql
select @@ROWCOUNT;
```
* The last value IDENTITY column by an insert or select into statement.
```sql
select @@IDENTITY;
```

* Get error status (succeeded or failed) of the most recently executed statement.
```sql
select @@ERROR;
```
