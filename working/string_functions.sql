-- ---------------------------------------------------------
-- String Functions
-- ---------------------------------------------------------

-- CONCATENATION of STRINGS
-- ---------------------------------------------------------
select 'This is a' as pre_string,' test' as post_string;

select concat('This is a',' test')
       , 'This is a' + ' test'
       ,concat_ws(',', 'empid', 'ename', 'sal');

       
select  concat(pre_string,post_string)        -- concat function 
        ,pre_string+post_string                -- PLUS (+) operator
        ,concat_ws('-',pre_string,post_string) -- concat_ws function 
from   ( select  'This is a' as pre_string
                 ,' test' as post_string) a  -- INNER QUERY
;

-- LENGTH of STRING
-- ----------------------------------------------------------
select  len('  aa   aaa  ')          -- TOTAL STRING LENGTH OF ONLY NON TRAILING 
         ,datalength('  aa   aaa  ')   -- TOTAL STRING LENGTH
        
-- TRIM, LTRIM, RTRIM
-- ----------------------------------------------------------
select  trim(user_entered_data)
        ,rtrim(user_entered_data)
        ,ltrim(user_entered_data)
        ,len(trim(user_entered_data))
        ,datalength(trim(user_entered_data))
from    ( select '  EMPID ENAME SAL  ' user_entered_data) a


-- upper, lower
-- ----------------------------------------------------------
select upper('learn SQL'), lower('learn SQL')         
         

-- CHARINDEX
-- ----------------------------------------------------------
select  charindex('@',email)     -- FIND THE POSITION OF A SUBSTRING in a STRING
        ,charindex('.com',email)
from   ( select 'abc1m23@gmail.com' email) a


-- SUBSTRING
-- ----------------------------------------------------------
select substring(a.email,9,5)  -- Start position, length from start position
from   ( select 'abc1m23@gmail.com' email) a


-- Assignment Get Email Domain Name 
-- -----------------------------------------------------------
select   emaildomain
        ,substring(emaildomain,1,charindex('.',emaildomain)-1)
from   (
        select substring(email,at_post+1,email_len-at_post) emaildomain
        from   (select  email
                        ,datalength(email) email_len
                        ,charindex('@',email) at_post
                        
                from  (
                select 'abcuuseeeuss1m23@gmail.com' email
                union all
                select 'ab.c1m_23@zip.in' email
                union all
                select 'name_name.123@microsoft.co.in' email
                ) a
        ) b
) c




