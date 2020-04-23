/* Jaeger, Becca 
Assignment 02  */
use books;
/* Q1  */
select concat (firstname, ' ', lastname) as 'NJ Customers'
from customers
where state='NJ';
/* Q2  */
select *
from orders
where orderdate>'2003-04-01';
/* Q3  */
select *
from books
where category !='FITNESS';
/* Q4  */
select concat (lastname, ', ', firstname) as 'Full Name'
from customers
where state in('GA', 'NJ')
order by lastname;
/* Q5  */
select ordernum, orderdate, shipdate, to_days(shipdate)-to_days(orderdate) as 'Time to Ship'
from orders;
/* Q6  */
select lname, fname
from author
where lname like '%in%'
order by lname desc, fname;
/* Q7  */
select concat (firstname, ' ', lastname) as 'Referred Customers'
from customers
where referred is not null;
/* Q8  */
select title, category
from books
where category like 'C%I%N%';
/* Q9  */
select title
from books
where title like '_A_N%';
/* Q10  */
select title, pubdate, category
from books
where category='COMPUTER' and pubdate between '2001-01-01' and '2001-12-31';