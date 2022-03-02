![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | My first queries

Please, download the file applestore.csv.
Install MySQL/Postgresql on your computer.
Create a database
Upload the file as a new table of your database

Use the *data* table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**
SELECT prime_genre FROM applestore

**2. Which is the genre with the most apps rated?**
SELECT prime_genre, user_rating FROM applestore ORDER BY user_rating DESC LIMIT 1;

**3. Which is the genre with most apps?**
SELECT prime_genre, COUNT(ï»¿id) FROM applestore GROUP BY prime_genre ORDER BY COUNT(ï»¿id) DESC LIMIT 1;

**4. Which is the one with least?**
SELECT prime_genre, COUNT(ï»¿id) FROM applestore GROUP BY prime_genre ORDER BY COUNT(ï»¿id) ASC LIMIT 1;

**5. Find the top 10 apps most rated.**
SELECT track_name, rating_count_tot FROM applestore ORDER BY rating_count_tot DESC LIMIT 10;

**6. Find the top 10 apps best rated by users.**
SELECT track_name, user_rating FROM applestore ORDER BY user_rating DESC LIMIT 10;

**7. Take a look at the data you retrieved in question 5. Give some insights.**
These applications seem to be relatively old and famous, hence why they have so many reviews.

**8. Take a look at the data you retrieved in question 6. Give some insights.**
The best rated apps are not necessarily the most rated, and seem not to be the most used eother.

**9. Now compare the data from questions 5 and 6. What do you see?**
We can see that none of the most rated apps are in the best rated apps.

**10. How could you take the top 3 regarding both user ratings and number of votes?**
We should create a ratio of number of votes / user rating and the SELECT track_name, FROM applestore ORDER BY new_column

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, price, rating_count_tot FROM applestore ORDER BY price DESC --> I want to compare the price of an app and the number of ratings it has
I see that most rated apps are for the most part free, and this must be because paying is a big additionnal step while figure out "do I need this product"


## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
