/* Jaeger, Becca 
Assignment 04  */

/* Q1  */
use vbvideo;
select upper(studioname) as 'Studio', right(phone, 8) as 'Phone Number'
from studio;

/* Q2  */
use books;
select concat(lastname, ', ', firstname) as 'Customer Name', ifnull(referred, 'NOT REFERRED')
from customers;

/* Q3  */
use lyric;
select concat(left(firstname, 1), '. ',left(lastname, 1), '.') as 'Member Initials'
from members;

/* Q4  */
use books;
select title, concat(round(((retail-cost)/cost)*100), '%') as 'Markup Percentage'
from books;

/* Q5  */
use employee;
select date_format((now()),'%W, %D day of %M in the year %Y at %h:%i %p')
from dual;

/* Q6  */
use vbauto;
select lname as 'Last Name', modelname as 'Model', format(costvalue, 2)
from vehicle, customer
where inventoryid=inventoryidnumber;

/* Q7  */
use books;
select distinct length(isbn) as 'ISBN length'
from books;

/* Q8  */
use books;
select orderdate as 'Order Date', ifnull(shipdate, 'NOT SHIPPED') as 'Ship Date', ifnull(datediff(shipdate, orderdate), 'NOT SHIPPED') as 'Processing', date_add(orderdate, interval 60 day) as 'Payment Due'
from orders;

/* Q9  */
use lyric;
select artistname, webaddress, substring(webaddress,5)
from artists
where webaddress is not null;

/* Q10  */
use lyric;
select email, locate('@', email)
from members
where email is not null;