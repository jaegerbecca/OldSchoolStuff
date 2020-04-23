/* Jaeger, Becca 
Assignment 05  */
use books;
/* Q1  */
select count(title) as 'Cooking Books'
from books
where category='cooking';
/* Q2  */
select count(title) as 'Books Over $30.00'
from books
where retail > 30.00;
/* Q3  */
select max(pubdate) as 'Most Recently Published'
from books;
/* Q4  */
select min(retail) as 'Cheapest Book Bought'
from orders o, orderitems oi, books b
where o.ordernum=oi.ordernum 
AND oi.isbn=b.isbn
AND customernum='1017';
/* Q5  */
select avg(retail) as 'Average Price Of Computer Books'
from books
where category='computer';
/* Q6  */
select c.customernum as 'Customer Number', count(ordernum) as 'Number of Orders Placed'
from customers c, orders o
where c.customernum=o.customernum
group by c.customernum
having count(ordernum)>0
order by count(ordernum) desc, c.customernum;
/* Q7  */
select max(retail) as 'Most Expensive Book By Lisa White'
from books b, bookauthor ba, author a
where b.isbn=ba.isbn
AND ba.authorid=a.authorid
AND lname='white' AND fname='lisa';
/* Q8  */
select sum(retail*quantity) as 'Total For All Orders By 1017'
from orders o, orderitems oi, books b
where o.ordernum=oi.ordernum
AND oi.isbn=b.isbn
AND customernum='1017';
/* Q9  */
select o.ordernum as 'Order Number', sum(retail*quantity) as 'Order Total'
from orders o, orderitems oi, books b
where o.ordernum=oi.ordernum
AND oi.isbn=b.isbn
group by o.ordernum;
/* Q10  */
select distinct concat(firstname, ' ', lastname) as 'Full Name'
from customers c, orders o, orderitems oi, books b
where c.customernum=o.customernum
AND o.ordernum=oi.ordernum
AND oi.isbn=b.isbn
AND state IN ('FL', 'GA')
group by lastname
having (sum(retail*quantity))>80.00
order by lastname;