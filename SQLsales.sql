--inspecting data
select* from [dbo].[sales]--checking unique values
select distinct STATUS from [dbo].[sales]
select distinct YEAR_ID from [dbo].[sales]
select distinct PRODUCTLINE from [dbo].[sales]
select distinct COUNTRY from [dbo].[sales]
select distinct DEALSIZE from [dbo].[sales]
select distinct TERRITORY from [dbo].[sales]

--Analysis
--group sales by productline
select PRODUCTLINE,sum(sales) as total_sales 
from dbo.sales 
group by PRODUCTLINE
ORDER BY total_sales DESC
--group sales by year
select YEAR_ID,sum(sales) as total_sales 
from dbo.sales 
group by YEAR_ID
--group sales by DEALSIZE
select DEALSIZE,sum(sales) as total_sales 
from dbo.sales
group by DEALSIZE
--what was the best month for sales in specific year
--year 2003
select MONTH_ID,sum(sales) as total_sales
from [dbo].[sales]
where year_id = 2003 
group by MONTH_ID 
ORDER BY total_sales DESC
-- year 2004
select MONTH_ID,sum(sales) as total_sales 
from [dbo].[sales] 
where year_id = 2004  
group by MONTH_ID 
ORDER BY total_sales DESC
-- The month of November has the highest sales in both the years
-- lets see what product is sold most in november
select PRODUCTLINE,sum(sales) total_sales,COUNT(ORDERNUMBER) orders 
from [dbo].[sales] 
where MONTH_ID = 11 AND YEAR_ID = 2003 
group by PRODUCTLINE
select PRODUCTLINE,sum(sales) total_sales,COUNT(ORDERNUMBER) orders 
from [dbo].[sales] 
where MONTH_ID = 11 AND YEAR_ID = 2004 
group by PRODUCTLINE
--Classic cars are the most sold products in the month of november 
--Checking for which country has the highest sales
select PRODUCTLINE,country,sum(sales) total_sales,COUNT(ORDERNUMBER) orders from [dbo].[sales] group by country,PRODUCTLINE order by total_sales DESC


