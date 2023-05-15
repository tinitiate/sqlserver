-- Date Functions

-- String to Date
-- ------------------------------------------
https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/
SELECT CONVERT(DATETIME, '2019-08-15', 102) result;
2019-08-15 00:00:00.000

select DATEPART(year,a_date)
from   (select convert(DATETIME,'2006-04-30 00:38:54.840',120) a_date ) a

-- Add 5 Years to a given datetime
-- Add 5 Months to a given datetime
-- Add 5 Days to a given datetime
-- Add 5 Hours to a given datetime
-- Add 5 Minutes to a given datetime
-- Add 5 Minutes to a given datetime
select  DATEADD(year, 5,a_date)
        ,DATEADD(month, 5,a_date)
--
from   (select convert(DATETIME,'2006-12-30 00:38:54.840',120) a_date ) a


-- Convert DateTime to String in given formats with milliseconds
-- -------------------------------------------------------------




-- Find Difference in various denominations between TWO DateTime fields
-- 

select  -- Diff in Years
        -- Diff in Months
        -- Diff in days
        -- Diff in Hours
        -- Diff in Minutes                 
        -- Diff in Minutes
from   (select convert(DATETIME,'2006-03-30 00:38:54.840',120) d1,
                convert(DATETIME,'2007-14-30 16:21:25.666',120) d2) a 


-- Time Zone
select  CURRENT_TIMESTAMP
        ,GETDATE()
        ,SYSDATETIME()
        ,GETUTCDATE()
        ,SYSUTCDATETIME()
        ,SYSDATETIMEOFFSET()
        
        
-- List all TimeZone Names
select name, current_utc_offset, is_currently_dst
from   sys.time_zone_info;

SELECT GETDATE() at TIME ZONE 'Central European Standard Time';

SELECT  GETDATE() at TIME ZONE 'Pacific Standard Time'
        ,GETDATE() at TIME ZONE 'Eastern Standard Time'
;