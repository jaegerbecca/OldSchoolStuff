/* Jaeger, Becca 
Assignment 07  */

/* Q1  */
use books;
delete from orders
where ordernum=1025;
delete from customers
where customernum=1050;
delete from author
where authorID='D100';
delete from books
where ISBN='1013901204';
delete from publisher
where pubID=6;

/* Q2  */
use lyric;
update salespeople
set base=200.00
where salesid=3;

/* Q3  */
use lyric;
update salespeople
set base= base + 50.00
where lastname='Bentley' AND firstname='Bob';

/* Q4  */
use lyric;
update members
set workphone=homephone
where lastname='Payne' AND firstname='Frank';

/* Q5  */
use lyric;
update titles
set UPC=1828344222,
	genre='pop'
where title='Time Flies';

/* Q6  */
use lyric;
update members
set salesid=4
where region='VA' AND salesid=3;

/* Q7  */
use crashcourse;
update customers
set cust_name=UPPER(cust_name);

/* Q8  */
use crashcourse;
update vendors
set vend_city='Aiken',
	vend_state='SC'
where vend_city IS NULL OR vend_state IS NULL;

/* Q9  */
use crashcourse;
update products
set prod_price=prod_price*1.15;


