select * from walmartsalesdata;
-- renaming the column
alter table walmartsalesdata rename column `Invoice ID` to Invoice_id;
alter table walmartsalesdata rename column `Customer type` to Customer_type;
alter table walmartsalesdata rename column `Product line` to Product_line;
alter table walmartsalesdata rename column `Unit price` to Unit_price;
alter table walmartsalesdata rename column `Tax 5%` to Tax;
alter table walmartsalesdata rename column `gross margin percentage` to Gross_margin_percentage;
alter table walmartsalesdata rename column `gross income` to Gross_income;

-- changing the date format
SET SQL_SAFE_UPDATES = 0;
update walmartsalesdata set date= replace(date,'-','/');
alter table walmartsalesdata modify column date date;

-- Generic Question
-- 1. How many unique cities does the data have?
select  count(distinct city) as count from walmartsalesdata; 

-- 2. In which city is each branch?
select branch,city from walmartsalesdata group by branch,city order by 1;

-- Product
-- 1. How many unique product lines does the data have?
select * from walmartsalesdata;
select count(distinct product_line) as count from walmartsalesdata;

-- 2. What is the most common payment method?
select payment, count(payment)as count from walmartsalesdata group by payment order by count desc limit 1;

-- 3. What is the most selling product line?
select product_line, sum(Quantity) as sum from walmartsalesdata group by Product_line order by sum desc limit 1;

-- 4.What is the total revenue by month?
select monthname(date)as monthname,round(sum(total),2) as total from walmartsalesdata group by monthname order by 2 desc;

-- 5. What month had the largest COGS?
select monthname(date) as monthname, round(sum(cogs),2) as cogs from walmartsalesdata group by 1 order by 2 desc limit 1;

-- 6. What product line had the largest revenue?
select product_line, round(sum(total),2) as sum from walmartsalesdata group by 1 order by 2 desc limit 1;

-- 7. What is the city with the largest revenue?
select * from walmartsalesdata;
select city,round(sum(total),2)as sum from walmartsalesdata group by 1 order by 2 desc limit 1;

-- 8. What product line had the largest VAT?
select product_line,round(sum(tax),2) as sum from walmartsalesdata group by 1 order by 2 desc limit 1;

-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its total greater than average sales
select product_line, round(avg(cogs),2) as avg_sales, case when avg(cogs) > 307.59 then "Good" else "Bad" end as class 
from walmartsalesdata group by Product_line;

-- 10. Which branch sold more products than average product sold?
select round(avg(quantity),2) from walmartsalesdata;
select Branch, round(avg(Quantity),2) as Average_Quantity from walmartsalesdata
group by Branch having Average_Quantity > 5.51;

-- 11. What is the most common product line by gender?
select gender,Product_line, count(product_line) as counting from walmartsalesdata group by gender,Product_line order by 3 desc limit 1;

-- 12.What is the average rating of each product line?
select Product_line,round(avg(rating),2) as avg from walmartsalesdata group by Product_line;
select * from walmartsalesdata;
-- Sales
-- 1. Number of sales made in each time of the day per weekday
select case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day,
count(Quantity) as no_sales from walmartsalesdata where weekday != 'Saturday' and weekday != 'Sunday' group by time_of_day order by 2 desc;

-- add column weekday
SET SQL_SAFE_UPDATES = 0;
alter table walmartsalesdata add column weekday varchar(50);
select date,dayname(date) from walmartsalesdata;
update walmartsalesdata set weekday = dayname(date);

-- 2. Which of the customer types brings the most revenue?
select customer_type,round(sum(total),2) as sum from walmartsalesdata group by Customer_type order by 2 desc limit 1;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?
select city,round(sum(tax),2) as sum from walmartsalesdata group by 1 order by 2 desc limit 1;

-- 4. Which customer type pays the most in VAT?
select customer_type,round(sum(tax),2) as sum from walmartsalesdata group by 1 order by 2 desc limit 1;

-- Customer
-- 1. How many unique customer types does the data have?
select * from walmartsalesdata;
select count(distinct customer_type) as unique_customer_number from walmartsalesdata;

-- 2. How many unique payment methods does the data have?
select count(distinct payment) as count from walmartsalesdata;

-- 3.	What is the most common customer type?
select customer_type, count(customer_type) as count from walmartsalesdata group by Customer_type order by 2 desc limit 1;

-- 4. Which customer type buys the most?
select customer_type,round(sum(quantity),2) as sum from walmartsalesdata group by Customer_type order by 2 desc limit 1;

-- 5. What is the gender of most of the customers?
select gender, count(gender) as count from walmartsalesdata group by gender order by 2 desc limit 1;

-- 6. What is the gender distribution per branch?
select * from walmartsalesdata;
select branch,gender,count(gender) as count from walmartsalesdata group by Branch,Gender order by 1;

-- 7. Which time of the day do customers give most ratings?
select case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day, 
count(Rating) as rate_no from walmartsalesdata group by time_of_day order by rate_no;

-- 8. Which time of the day do customers give most ratings per branch?
select Branch,  case when hour(Time) between 0 and 11 then 'Morning' when hour(Time) between 12 and 16 then 'Afternoon' else 'Evening' end as time_of_day, 
round(avg(rating),1) as rate_no from walmartsalesdata group by Branch, time_of_day order by Branch, time_of_day desc;

-- 9. Which day of the week has the best avg ratings?
select dayname(date) as days,round(avg(rating),2) as avg from walmartsalesdata group by days order by 2 desc limit 1;

-- 10.Which day of the week has the best average ratings per branch?
select dayname(date) as day,round(avg(rating),2) as avg,Branch from walmartsalesdata group by day,Branch order by 2 desc limit 1;
