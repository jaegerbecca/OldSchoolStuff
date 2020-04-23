/* Jaeger, Becca 
Assignment 03  */

/* Q1  */
use books;
select title, contact, phone
from publisher p, books b
where p.pubid=b.pubid;
/* Q2  */
select shipdate, orderdate, firstname, lastname
from orders o, customers c
where o.customernum=c.customernum AND shipdate IS NULL
order by orderdate;
/* Q3  */
use VBAuto;
select CONCAT(fname, ' ', lname) as 'Customer Name', manufacturer, modelname
from vehicle, customer
where inventoryid=inventoryidnumber AND NOT manufacturer='Chevrolet'
order by manufacturer, modelname;
/* Q4  */
use books;
select DISTINCT CONCAT(firstname, ' ', lastname) as 'Customer Name', title
from customers c, orders o, orderitems oi, books b
where c.customernum=o.customernum
AND o.ordernum=oi.ordernum
AND oi.isbn=b.isbn
AND firstname='Jake' AND lastname='Lucas';
/* Q5  */
use VBVideo;
select title, length, studioname
from studio, video
where studio.studioid=video.studioid
order by length DESC;
/* Q6  */
use books;
select b.isbn, title, CONCAT(lname, ', ', fname) as Author
from books b, bookauthor ba, author a
where b.isbn=ba.isbn
AND ba.authorid=a.authorid
AND lname='Adams';
/* Q7  */
use employee;
select first_name, birth_date, tool_name, purchase_date, ((to_days(purchase_date)-to_days(birth_date)) DIV 365) as Age
from employee, tools
where payroll_number=fk_payroll_number
AND purchase_date BETWEEN '1966-01-01' AND '1990-12-31';
/* Q8  */
use books;
select CONCAT(firstname, ' ', lastname) as 'Customer Name', CONCAT(fname, ' ',lname) as 'Author Name', title
from customers c, orders o, orderitems oi, books b, bookauthor ba, author a
where c.customernum=o.customernum
AND o.ordernum=oi.ordernum
AND oi.isbn=b.isbn
AND b.isbn=ba.isbn
AND ba.authorid=a.authorid
AND firstname='Becca' AND lastname='Nelson';
/* Q9  */
select CONCAT(lastname, ', ', firstname) as 'Customer Name', ordernum, orderdate
from customers left join orders
on customers.customernum=orders.customernum;
/* Q10  */
select ordernum, title, quantity
from books b left join orderitems oi
on b.isbn=oi.isbn
where title LIKE '%A%A%'
order by ordernum;