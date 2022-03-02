use appledatabase;
	

SELECT prime_genre FROM applestore ;

SELECT prime_genre, user_rating FROM applestore ORDER BY user_rating DESC LIMIT 1;

SELECT prime_genre, COUNT(ï»¿id) FROM applestore GROUP BY prime_genre ORDER BY COUNT(ï»¿id) DESC LIMIT 1;

SELECT prime_genre, COUNT(ï»¿id) FROM applestore GROUP BY prime_genre ORDER BY COUNT(ï»¿id) ASC LIMIT 1;

SELECT track_name, rating_count_tot FROM applestore ORDER BY rating_count_tot DESC LIMIT 10;

SELECT track_name, user_rating FROM applestore ORDER BY user_rating DESC LIMIT 10;



SELECT track_name, price, rating_count_tot FROM applestore ORDER BY price DESC