![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | MySQL Select

## Introduction

 In this lab, we will practice selecting and projecting data. You can finish all questions with only these clauses:
- `SELECT`
- `SELECT DISTINCT`
- `COUNT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `SUM`
- `LIMIT`

The Sql script is here: https://drive.google.com/file/d/1tT1OTdIgkI5tkeeXIsnZwMC5SxI1FE9m/view
Please submit your solutions in a text file `solutions.sql`.

#### 1. From the `order_items` table, find the price of the highest priced order and lowest price order.
SELECT * FROM order_items ORDER BY price DESC LIMIT 1;
SELECT * FROM order_items ORDER BY price ASC LIMIT 1;


#### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?

SELECT MAX(shipping_limit_date) - MIN(shipping_limit_date) AS shipping_limit_date_range FROM order_items;

#### 3. From the `customers` table, find the states with the greatest number of customers.
SELECT COUNT(customer_id) customer_id , customer_state FROM customers;  


#### 4. From the `customers` table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
SELECT COUNT(customer_id) customer_id , customer_city FROM customers WHERE customer_state = 'SP'; 


#### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?
SELECT COUNT(business_segment) business_segment FROM closed_deals;


#### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
FROM closed_deals declared_monthly_revenue business_segment LIMIT 3;

#### 7. From the `order_reviews` table, find the total number of distinct review score values.
SELECT COUNT(DISTINCT review_score) review_id FROM order_reviews;


#### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.


#### 9. From the `order_reviews` table, find the review value occurring most frequently and how many times it occurs.
SELECT COUNT(DISTINCT review_score) review_id, review_score FROM order_reviews;	
