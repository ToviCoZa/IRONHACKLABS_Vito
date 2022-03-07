DROP TEMPORARY TABLE IF EXISTS royalty_per_author_per_title;

CREATE TEMPORARY TABLE IF NOT EXISTS royalty_per_author_per_title
SELECT 
authors.au_id,
titles.title_id,
SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_id, title_id;

SELECT * FROM royalty_per_author_per_title;



DROP TEMPORARY TABLE IF EXISTS royalty_per_author;
CREATE TEMPORARY TABLE IF NOT EXISTS royalty_per_author

SELECT 
au_id,
SUM(sales_royalty) AS royalties 
FROM royalty_per_author_per_title
GROUP BY au_id;

SELECT * FROM royalty_per_author;

SELECT SUM(royalties) FROM royalty_per_author;

DROP TEMPORARY TABLE IF EXISTS advance_per_author_per_title;
CREATE TEMPORARY TABLE IF NOT EXISTS advance_per_author_per_title

SELECT 
authors.au_id,
titles.title_id, 
titles.advance * titleauthor.royaltyper / 100 AS advance
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id;

SELECT * FROM advance_per_author_per_title;


DROP TEMPORARY TABLE IF EXISTS advance_per_author;
CREATE TEMPORARY TABLE advance_per_author

SELECT 
au_id,
SUM(advance) AS advances 
FROM advance_per_author_per_title
GROUP BY au_id;

SELECT * FROM advance_per_author;
SELECT SUM(advances) FROM advance_per_author;


DROP TEMPORARY TABLE IF EXISTS sales_per_author_per_title;
CREATE TEMPORARY TABLE IF NOT EXISTS sales_per_author_per_title

SELECT 
authors.au_id, 
titles.title_id, Sum(titles.price * sales.qty * titleauthor.royaltyper / 100) AS title_sales
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_id, title_id;

SELECT * FROM sales_per_author_per_title;


DROP TEMPORARY TABLE IF EXISTS sales_per_author;
CREATE TEMPORARY TABLE sales_per_author

SELECT 
au_id, 
SUM(title_sales) as sales 
FROM sales_per_author_per_title
GROUP BY au_id;

SELECT * FROM sales_per_author;
SELECT SUM(sales) FROM sales_per_author;




SELECT 
sales_per_author.au_id, 
sales, 
advances, 
royalties, 
sales - advances - royalties AS profits
FROM sales_per_author
LEFT JOIN advance_per_author ON sales_per_author.au_id = advance_per_author.au_id
LEFT JOIN royalty_per_author ON sales_per_author.au_id = royalty_per_author.au_id
ORDER BY profits DESC
LIMIT 3;