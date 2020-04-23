/* Jaeger, Becca 
Assignment 01  */
use books;
/* Q1  */
select * from books;
/* Q2  */
select title from books;
/* Q3  */
select title, pubdate as 'Publication Date'
from books;
/* Q4  */
select customernum, city, state
from customers;
/* Q5  */
select name, contact as 'Contact Person', phone
from publisher;
/* Q6  */
select distinct category
from books;
/* Q7  */
select distinct customernum
from orders;
/* Q8  */
select category, title
from books;
/* Q9  */
select fname, lname
from author;
/* Q10  */
select title, retail-cost as Profit
from books;