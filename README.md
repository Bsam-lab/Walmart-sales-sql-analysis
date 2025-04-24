# Walmart Sales Analysis

![waqd3u88](https://github.com/user-attachments/assets/2f5c8830-27f7-4c21-947d-4c06554fcf99)

## Table of Contents
- [Introduction](#Introduction)
- [Dataset Overview](#Dataset-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning)


### Introduction
The Walmart Sales business relies on data to gain deeper understanding of the business and identify opportunities to optimize strategies, improve customer satisfaction, and increase revenue of the business. SQL was used to query and analyze the data, as well as answer specific questions about the dataset to uncover valuable insights that can inform business decisions and drive growth. 

### Dataset Overview
The dataset used in the analysis consisits of 1200 rows and 13 columns. 
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

### Data Cleaning
1. Renaming of Columns
I started by renaming my column header name from Invoice ID to Invoice_id 
```sql
alter table walmartsalesdata rename column `Invoice ID` to Invoice_id;
```



