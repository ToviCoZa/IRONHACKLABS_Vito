use olist;
SELECT * FROM order_items ORDER BY price DESC LIMIT 1;
SELECT * FROM order_items ORDER BY price ASC LIMIT 1;

SELECT shipping_limit_date FROM order_items ORDER BY shipping_limit_date DESC limit 1;
SELECT shipping_limit_date FROM order_items ORDER BY shipping_limit_date ASC limit 1;

SELECT COUNT(customer_id) customer_id , customer_state FROM customers;
SELECT COUNT(customer_id) customer_id , customer_city FROM customers WHERE customer_state = 'SP'; 

SELECT COUNT(business_segment) business_segment FROM closed_deals;

SELECT COUNT(DISTINCT review_score) review_id FROM order_reviews;