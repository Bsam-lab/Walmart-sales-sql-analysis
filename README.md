# Walmart Sales Analysis

![waqd3u88](https://github.com/user-attachments/assets/2f5c8830-27f7-4c21-947d-4c06554fcf99)

## Table of Contents
- [Introduction](#Introduction)
- [Dataset Overview](#Dataset-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning)
- [Data Exploration and Insight](#Data-Exploration-and-Insight)
-  [Recommendation](#Recommendation)
-   [Conclusion](#Conclusion)


### Introduction
The Walmart Sales business relies on data to gain deeper understanding of the business and identify opportunities to optimize strategies, improve customer satisfaction, and increase revenue of the business. SQL was used to query and analyze the data, as well as answer specific questions about the dataset to uncover valuable insights that can inform business decisions and drive growth. 

### Dataset Overview
The dataset used in the analysis consisits of 1000 rows and 17 columns and 1 created column, here is a sample of the dataset.

![Screenshot 2025-04-24 141245](https://github.com/user-attachments/assets/de15cf32-1ab5-4951-a09d-d56266563ffc)

### Project Objective
You are tasked with analyzing this Walmart Sales dataset using SQL. Here are the business questions for which you will write SQL queries to gain insights.

Generic Question
1.	How many unique cities does the data have?
2.	In which city is each branch?
   
Product
1.	How many unique product lines does the data have?
2.	What is the most common payment method?
3.	What is the most selling product line?
4.	What is the total revenue by month?
5.	What month had the largest COGS?
6.	What product line had the largest revenue?
7.	What is the city with the largest revenue?
8.	What product line had the largest VAT?
9.	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10.	Which branch sold more products than average product sold?
11.	What is the most common product line by gender?
12.	What is the average rating of each product line?

Sales
1.	Number of sales made in each time of the day per weekday
2.	Which of the customer types brings the most revenue?
3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
4.	Which customer type pays the most in VAT?
   
Customer
1.	How many unique customer types does the data have?
2.	How many unique payment methods does the data have?
3.	What is the most common customer type?
4.	Which customer type buys the most?
5.	What is the gender of most of the customers?
6.	What is the gender distribution per branch?
7.	Which time of the day do customers give most ratings?
8.	Which time of the day do customers give most ratings per branch?
9.	Which day of the week has the best avg ratings?
10.	Which day of the week has the best average ratings per branch?



### Data Cleaning ![data cleaning icon](https://github.com/user-attachments/assets/79b92730-5b5c-490f-9c24-df5a28fafd01)
1. Renaming of Columns
I started by renaming my column header name from Invoice ID to Invoice_id,Customer type to Customer_type,Product line to Product_line,Unit price to Unit_price,Tax 5% to Tax,gross margin percentage to Gross_margin_percentage,gross income to Gross_income.
```sql
alter table walmartsalesdata rename column `Invoice ID` to Invoice_id;
alter table walmartsalesdata rename column `Customer type` to Customer_type;
alter table walmartsalesdata rename column `Product line` to Product_line;
alter table walmartsalesdata rename column `Unit price` to Unit_price;
alter table walmartsalesdata rename column `Tax 5%` to Tax;
alter table walmartsalesdata rename column `gross margin percentage` to Gross_margin_percentage;
alter table walmartsalesdata rename column `gross income` to Gross_income;
```
2. Change date format
```sql
SET SQL_SAFE_UPDATES = 0;
update walmartsalesdata set date= replace(date,'-','/');
alter table walmartsalesdata modify column date date;
```
3. add column weekday
```sql
SET SQL_SAFE_UPDATES = 0;
alter table walmartsalesdata add column weekday varchar(50);
select date,dayname(date) from walmartsalesdata;
update walmartsalesdata set weekday = dayname(date);
```
### Data Exploration and Insight
City  
1. There are 3 unique cities, each assigned a branch (A, B, C).
2. City B (and its corresponding branch) generated the highest revenue.

Product performance
1. The dataset contains 6 unique product lines.
2. "Food and Beverages" was the top-selling product line by quantity.
3. The product line that contributed the most VAT was "Health and Beauty".

Custormer Insight
1. Customers were categorized as Members or Normal.
2. Member customers generated the most revenue.
3. Male customers were slightly more frequent across all branches.
4. The highest number of ratings was given during the Evening.

Ratings & Feedback
1. Friday was the day with the highest average ratings.
2. The "Electronic Accessories" product line received the highest average rating.   
3. Ratings were more frequently given in the Evening, across all branches.
### Recommendation
1. Cities like City B with the highest revenue should receive targeted campaigns and customer retention programs.
2. Ensure optimal stock levels for Food and Beverages and Electronic Accessories across branches.
3. Since Ewallet is the most used payment method, consider offering promotions or discounts for digital wallet users.
4. Consider staff shifts or promotions in the Morning and Afternoon slots where ratings are lower.
5. Since Members bring in more revenue, incentivizing normal customers to join loyalty programs could boost sales.
### Conclusion
This project successfully demonstrates the power of SQL in analyzing real-world retail data. Through structured querying and data transformation, we uncovered insights into customer behavior, product popularity, and sales performance. These insights can guide data-backed strategies to boost revenue, enhance customer satisfaction, and streamline business operations
