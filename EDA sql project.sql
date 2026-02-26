--- EDA project 

--- tables 

select * from Property_Table 
select * from Client_Table
select * from Expense_Table 
select * from  Sales_Table

--- remove null row from client table 
  -- the null record

select * from Client_Table
where ClientID is null

  -- remove it 

delete 
from Client_Table
where ClientID is null


--- identifing the unique values in each dim 

 -- country dim 
select distinct Country
from Property_Table

 -- payment_status dim 
select distinct Payment_Status
from Sales_Table
  
 -- means of sales  dim 
select distinct Means_of_Sales
from Sales_Table

 --Expense type dim 
select distinct ExpenseType
from Expense_Table

 --client job dim 
select distinct Occupation
from Client_Table

 -- property type  dim 
select distinct Type
from Property_Table

 -- property status dim ( the meaning of payment_status ) 
select distinct Status
from Property_Table


----data Exlepration 

select min(saledate) as frist_sale 
    ,  max(saledate) as last_sale 
    ,  datediff(YEAR,min(saledate),max(saledate)) as period_in_years 
	,  datediff(MONTH,min(saledate),max(saledate)) as period_in_month
from Sales_Table


--- measure Exploration  (KPIs)

 --- number of clients 
select count(*) as num_of_clients 
from Client_Table 

 ---- Propertys sold
select count(*) num_of_sold_property
from Property_Table
where Status = 'sold'

 --- total revune    
select sum ( price ) as total_revune 
from Property_Table
where Status = 'sold'
	
 --- total Expense
select sum ( Amount )  as total_Expense 
from Expense_Table

 --- revenue and expense and net_income
WITH income AS (
    SELECT 
        SUM(Amount) AS total_expense,
        SUM(price)  AS total_revenue
    FROM Property_Table p 
    JOIN Expense_Table e 
	ON p.PropertyID = e.PropertyID
)
SELECT 
    total_expense,
    total_revenue,
    total_revenue - total_expense AS net_income 
FROM income


 --- profit_margin and expense ratio
 
 WITH income AS (
    SELECT 
        SUM(Amount) AS total_expense,
        SUM(price)  AS total_revenue ,
	    SUM(price) - SUM(Amount) AS net_income 
    FROM Property_Table p 
    JOIN Expense_Table e 
	ON p.PropertyID = e.PropertyID
)

select ROUND(total_expense * 100.0 / total_revenue, 2)  AS expense_ratio ,
       ROUND( net_income * 100.0 / total_revenue, 2) AS profit_margin   

from income 


 --- Running total revenue per year 
  
  WITH yearly AS (
    SELECT 
        YEAR(s.saledate)  AS sale_year,
        SUM(p.price)      AS yearly_revenue
    FROM Property_Table p 
    JOIN Sales_Table s ON s.PropertyID = p.PropertyID
    GROUP BY YEAR(s.saledate)
)
SELECT 
    sale_year,
    yearly_revenue,
    SUM(yearly_revenue) OVER (ORDER BY sale_year) AS running_total
FROM yearly 

--- magnitude analysis 

 --- total clients by job titel 
select count(*) as num_of_clients , Occupation as client_job  
from Client_Table
group by Occupation
order by num_of_clients desc

 
 --- total properties sold by country 
select count(*) num_of_sold_property , country 
from Property_Table
where Status = 'sold' 
group by Country
order by num_of_sold_property desc


 --- total Expense by Expense type 
select ExpenseType   , sum ( Amount )  as total_Expense 
from Expense_Table
group by ExpenseType
order by total_Expense desc


 --- total revune by pyment status 
select sum ( price ) as total_revune , s.Payment_Status
from Property_Table p join Sales_Table s
on p.PropertyID =s.PropertyID
where Status = 'sold'
group by s.Payment_Status
order by total_revune desc 


 --- expense_ratio and profit_margin and total_expense and total_revenue and net_income  by property type 
WITH income AS (
    SELECT 
        p.Type as property_type ,
        SUM(e.Amount)                    AS total_expense,
        SUM(p.price)                     AS total_revenue,
        SUM(p.price) - SUM(e.Amount)     AS net_income
    FROM Property_Table p 
    JOIN Expense_Table e ON p.PropertyID = e.PropertyID
    GROUP BY p.Type
)
SELECT 
    property_type ,
    total_expense,
    total_revenue,
    net_income,
    ROUND(total_expense * 100.0 / total_revenue, 2) AS expense_ratio,
    ROUND(net_income   * 100.0 / total_revenue, 2)  AS profit_margin 
FROM income
ORDER BY profit_margin DESC 


 --- total revune by mean of sales 
select  s.Means_of_Sales  , sum ( price ) as total_revune 
from Property_Table p join Sales_Table s
on p.PropertyID = s.PropertyID 
where Status = 'sold' 
group by s.Means_of_Sales
order by total_revune desc


--- change over time analysis 

 --- total revenue and num of property sold in 2022

select  month(saledate) as month 
,sum ( price ) as total_revune
,count(*) num_of_sold_property
from Sales_Table s join Property_Table p
on s.PropertyID = p.PropertyID
where Status = 'sold' and year(saledate) ='2022'
group by year(saledate), month(saledate)
order by total_revune , num_of_sold_property



 --- total revenue and num of property sold in 2023

select  month(saledate) as month 
,sum ( price ) as total_revune
,count(*) num_of_sold_property
from Sales_Table s join Property_Table p
on s.PropertyID = p.PropertyID
where Status = 'sold' and year(saledate) ='2023'
group by year(saledate), month(saledate)
order by total_revune , num_of_sold_property




 --- total revenue and num of property sold in 2024

select  month(saledate) as month 
,sum ( price ) as total_revune
,count(*) num_of_sold_property
from Sales_Table s join Property_Table p
on s.PropertyID = p.PropertyID
where Status = 'sold' and year(saledate) ='2024'
group by year(saledate), month(saledate)
order by total_revune , num_of_sold_property






