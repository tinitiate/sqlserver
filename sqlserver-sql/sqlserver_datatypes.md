![Tinitiate SQLSERVER Training](../images/sqlserver.png)
# SQL Server Data Types
SQL Server supports a variety of data types, each with its own strengths and weaknesses. The following is a brief overview of the most common data types in SQL Server:

## Commonly used datatypes in SQL Server
* **Numeric** data types are used to store numbers. There are several different numeric data types available, each with its own range and precision. The most common numeric data types are:
    * **INT** - Stores whole numbers from -2147483648 to 2147483647.
    * **BIGINT** - Stores whole numbers from -9223372036854775808 to 9223372036854775807.
    * **DECIMAL** - Stores numbers with a fixed number of decimal places. For example, DECIMAL(5,2) can store numbers from -9999.99 to 9999.99.
    * **FLOAT** - Stores numbers with a variable number of decimal places.
* **Date and Time** data types are used to store dates and times. The most common date and time data types are:
    * **DATE** - Stores a date in the format YYYY-MM-DD.
    * **DATETIME** - Stores a date and time in the format YYYY-MM-DD HH:MM:SS.
    * **SMALLDATETIME** - Stores a date and time in the format YYYY-MM-DD HH:MM.
* **String** data types are used to store text. The most common string data types are:
    * **CHAR** - Stores a fixed-length string. For example, CHAR(5) can store a string of up to 5 characters.
    * **VARCHAR** - Stores a variable-length string.
* **Binary DataTypes** are used to store binary data, such as images or files. The most common binary data types are:
    * **BINARY** - Stores a fixed-length binary string.
    * **VARBINARY** - Stores a variable-length binary string.
* **Additional Data types**
    * **XML** data type - Stores XML data.
    * **UNIQUEIDENTIFIER** - Stores a globally unique identifier (GUID).
    * **BIT** - Stores a single bit of data, either 0 or 1.
    * **MONEY** - Stores monetary values.
    * **SMALLMONEY** - Stores monetary values with less precision than MONEY.
    * **DATETIME2** - Stores a date and time with more precision than DATETIME.
    * **DATETIMEOFFSET** - Stores a date and time with a time zone offset.
    * **GEOGRAPHY** - Stores geographic data.
    * **GEOMETRY** - Stores geometric data.
    * **HIERARCHYID** - Stores a hierarchical identifier.
    * **ROWVERSION** - Stores a version identifier.
    * **CURSOR** - Stores a cursor.

* * *
| (c) TINITIATE / Venkata Bhattaram |
| :--- |