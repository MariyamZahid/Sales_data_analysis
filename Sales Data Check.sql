-- 1) Null check

select
sum(case when order_id is null then 1 else 0 end) as nullcnt_ord_id,
sum(case when Customer_ID is null then 1 else 0 end) as nullcnt_cst_id,
sum(case when Order_Date is null then 1 else 0 end) as nullcnt_ord_date,
sum(case when Region is null then 1 else 0 end) as nullcnt_region,
sum(case when Product_Category is null then 1 else 0 end) as nullcnt_pro_cat,
sum(case when Customer_Segment is null then 1 else 0 end) as nullcnt_cust_seg,
sum(case when Quantity is null then 1 else 0 end) as nullcnt_qnt,
sum(case when Unit_Price is null then 1 else 0 end) as nullcnt_up,
sum(case when Discount_Rate is null then 1 else 0 end) as nullcnt_dr,
sum(case when Revenue is null then 1 else 0 end) as nullcnt_rev,
sum(case when Cost is null then 1 else 0 end) as nullcnt_cst,
sum(case when Profit is null then 1 else 0 end) as nullcnt_profit,
sum(case when Payment_Method is null then 1 else 0 end) as nullcnt_pay_method
from sales;

-- 2) Checking Distinct region, product_category, customer_segment, paymnet_method

select distinct region
from sales
order by 1;

select distinct product_category
from sales
order by 1;

select distinct customer_segment
from sales
order by 1;

select distinct payment_method
from sales
order by 1;

-- 3) prince range

select min(unit_price),
max(unit_price)
from sales;