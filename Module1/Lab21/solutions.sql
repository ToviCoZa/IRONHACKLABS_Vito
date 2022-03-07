use publications ;

SELECT auths.au_id AS Author_ID, CONCAT(auths.au_lname, ' ', auths.au_fname) AS Author, withtitle.title AS Title, pubs.pub_name AS Publisher
FROM titleauthor titleauth
LEFT JOIN authors auths
ON titleauth.au_id = auths.au_id
LEFT JOIN titles withtitle
ON titleauth.title_id = withtitle.title_id
LEFT JOIN publishers pubs
ON withtitle.pub_id = pubs.pub_id
ORDER BY Author_ID;	


SELECT 
auths.au_id AS Author_ID,
auths.au_lname AS LastName, 
auths.au_fname AS FirstName, 
pubs.pub_name AS Publisher, 
COUNT(withtitle.title) as Title_count
FROM titleauthor titleauth 
LEFT JOIN authors auths ON titleauth.au_id = auths.au_id
LEFT JOIN titles withtitle ON titleauth.title_id = withtitle.title_id
LEFT JOIN publishers pubs ON withtitle.pub_id = pubs.pub_id
GROUP BY Author_ID, Publisher
ORDER BY Title_count DESC, Author_ID DESC;


SELECT 
auths.au_id AS Author_ID,
auths.au_lname AS LastName,
auths.au_fname AS FirstName,
SUM(sales.qty) AS TOTAL
FROM titleauthor titleauth
LEFT JOIN authors auths ON titleauth.au_id = auths.au_id
LEFT JOIN sales ON titleauth.title_id = sales.title_id
GROUP BY Author_ID
ORDER BY TOTAL DESC
LIMIT 3;


SELECT auths.au_id AS Author_ID,
auths.au_lname AS LastName, 
auths.au_fname AS FirstName, 
SUM(sales.qty) AS TOTAL
FROM titleauthor titleauth
LEFT JOIN authors auths ON titleauth.au_id = auths.au_id
LEFT OUTER JOIN sales ON titleauth.title_id = sales.title_id
GROUP BY Author_ID
ORDER BY TOTAL DESC


