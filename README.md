# Sales Data Analysis

This project analyzes **transactional sales data from 2024** used to analyze the **impact of discounts on profit and customer purchasing behavior**. 

The dataset includes information about **orders, products, discounts, sales performance, and regional distribution**.

Insights and recommendations are provided on the following key areas:

- **Sales trends analysis:** Evaluation of profit pattern by discount and month
- **Discount impact:** Analysing the impact of discount on sales volume, profit and profit margin.

An interactive dashboard can be downloaded from [here.](https://github.com/MariyamZahid/Sales_data_analysis/blob/main/sales_data.pbix)

SQL queriesused for data cleaning and duplicate checks are available [here.](https://github.com/MariyamZahid/Sales_data_analysis/blob/4ad6d570e134ea25cee7634254396f706eca0b47/Sales%20Data%20Check.sql)

SQL queries used to answer business questions and generate insights are available [here.](https://github.com/MariyamZahid/Sales_data_analysis/blob/4ad6d570e134ea25cee7634254396f706eca0b47/Sales%20Data%20Analysis.sql)

# Data structure and ERD
The dataset consists of two tables:
- **Sales table:** Contains 10000 transactional records
- **Date table:** Used for time-based analysis and dashboard filtering

Entity Relationship Diagram:

![click here](https://github.com/MariyamZahid/Sales_data_analysis/blob/7619dd20b4d9efd46fb943d40430c90a110b6831/ERD.png)

# Executive Summary
## Overview
![click here](https://github.com/MariyamZahid/Sales_data_analysis/blob/47457bd00c199f854d206aa6572e13dbe9a0babe/Overview.png)
- Around **98% of orders include discounts**, indicating that promotional pricing plays a significant role in driving sales. This suggests that customers respond strongly to discounts and that promotions are an important part of the company’s pricing strategy.
- **Discounts between 11% and 20% generate the highest revenue and profit**, indicating that moderate discounts effectively increase sales while still maintaining profitability.
- Revenue is relatively balanced across regions, but the **North region generates the highest profit**, suggesting more efficient sales performance or a more profitable product mix in this region.

## Discount impact
![click here](https://github.com/MariyamZahid/Sales_data_analysis/blob/47457bd00c199f854d206aa6572e13dbe9a0babe/Discount.png)
- Orders **without discounts generate the highest profit margin (above 35%)**, but they represent **less than 2% of total sales**, indicating that very few customers purchase products without promotional pricing.
- Orders with **1%–20% discounts generate the highest sales volume**, showing that customers are highly responsive to moderate price reductions. Despite the discounts, the profit margin remains relatively stable, indicating that this pricing strategy is sustainable.
- **Profit peaks between 11% and 20% discounts**, indicating this range balances sales volume and profitability most effectively.
The **Electronics category generates the highest revenue**, indicating strong customer demand and making it a key contributor to overall sales performance.

# Recommendation
- The company should **prioritize discounts between 11% and 20%**, as this range maximizes sales while maintaining healthy profit margins.
- **Electronics sales increase in May and August**, indicating seasonal demand. The company should plan **targeted promotions and ensure sufficient inventory** during these months to capitalize on increased demand.
