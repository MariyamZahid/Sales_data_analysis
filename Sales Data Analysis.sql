Create table sales
(
Order_ID INT,
Customer_ID	Varchar(50),
Order_Date date,
Region varchar(50),
Product_Category varchar(50),
Customer_Segment varchar(50),
Quantity int,
Unit_Price float,
Discount_Rate float,
Revenue	float,
Cost float,
Profit float,
Payment_Method varchar(50)
);

show variables like 'secure_file_priv';

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Business_Analytics_Dataset.csv"
into table sales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

# Distribution of customers by number of orders placed
with cnt_data as (select customer_id,
count(customer_id) as ord_cnt_per_customer from sales
group by 1
order by 2 desc)
select ord_cnt_per_customer,
count(ord_cnt_per_customer) as cnt
from cnt_data
group by 1
order by 1;

# total volume, revenue, profit aggregated by region
select region,
count(*) as  num_rows,
sum(Quantity) as total_vol,
round(sum(revenue),2) as total_rev,
round(sum(Revenue)/(select sum(revenue) from sales)*100,2) as pct_rev,
round(sum(profit),2) as total_profit
from sales
group by 1
order by total_rev desc;
# Although revenue and sales are relatively balanced throughout the regions, however Northern region contribute highest in revenue, sales and profit.

# order summary by months
create view monthly_summary as
select extract(month from order_date) as month,
sum(Quantity) as total_vol
from sales
group by 1
order by 2 desc;
# adding discount_rate bin

Alter table sales
Add Column dis_bin varchar(20);

Update sales
set dis_bin =
case when discount_rate = 0 then "None"
when discount_rate >0 and discount_rate <= 0.1 then "0.01 - 0.1"
when discount_rate > 0.1 and discount_rate <= 0.2 then "0.11 - 0.2"
when discount_rate > 0.2 and discount_rate <= 0.4 then "0.21 - 0.4"
end;

# total volume, revenue, profit aggregated by dis_bin
with bin_sum as (
select dis_bin,
count(*) as  num_rows,
sum(Quantity) as total_vol,
round(sum(revenue),2) as total_rev,
round(sum(profit),2) as total_profit
from sales
group by 1)
select *,
round(total_rev/total_vol, 2) as rev_per_unit,
round(total_profit/total_vol, 2) as profit_per_unit
from bin_sum
order by total_rev desc;
-- Although the 0.21–0.4 discount bin generated the largest sales volume, 
-- the 0.11–0.2 discount bin outperformed in terms of revenue and profit, 
-- indicating higher margins in this range.



with pro_dis as (
select product_category, dis_bin,
count(*) as num_rows,
sum(Quantity) as total_vol,
round(sum(revenue),2) as total_rev,
round(sum(Revenue)/(select sum(revenue) from sales)*100,2) as pct_rev,
round(sum(profit),2) as total_profit
from sales 
group by 1, 2)
select *,
round(total_rev/total_vol,2) as rev_per_unit,
round(total_profit/total_vol,2) as profit_per_unit
from pro_dis
order by product_category, total_profit desc;

# Which customer_segment has the highest revenue?
select Customer_Segment,
round(sum(revenue),2) as total_rev,
round(sum(Revenue)/(select sum(revenue) from sales)*100,2) as pct_rev
from sales
group by Customer_Segment
order by 2 desc;
-- corporate has the highest revenue