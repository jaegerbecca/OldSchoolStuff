/* Becca Jaeger 
Assignment 6 - Inserts */

use books;
/* Publisher */
insert into publisher (PubID, Name, Contact, Phone)
values (6, 'Aldmeri Dominion', 'Ayrenn Aldmeri', '123-456-7890');
/* Books */
insert into books (ISBN, Title, PubDate, PubID, Cost, Retail, Category)
values ('1013901204', 'Eyes of the Queen', '2014-04-04', 6, 29.99, 49.99, 'COMPUTER');
/* Author */
insert into author (AuthorID, Lname, Fname)
values ('D100', 'Dar', 'Razum');
/* Customers */
insert into customers (Customernum, LastName, FirstName, Address, City, State, Zip)
values (1050, 'Khan', 'Shere', '15 Khenarthis Roost', 'North Augusta', 'SC', 29841);
/* Orders */
insert into orders (Ordernum, Customernum, OrderDate, ShipDate, ShipStreet, ShipCity, ShipState, ShipZip)
values (1025, 1050, '2018-11-05', '2018-11-08', '15 Khenarthis Roost', 'North Augusta', 'SC', 29841);