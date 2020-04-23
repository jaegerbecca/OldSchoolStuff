/* Jaeger, Becca 
Assignment 08- Create  */

/* Q1 create database */
create database if not exists painters;
use painters;
/* Q2 drop views */
drop view work_overview;
drop view totalpay_byemployee;
/* Q3 drop indexes */
drop index idx_customer_last_first on customer;
drop index idx_job_custphoneFK on job;
/* Q4 drop tables */
drop table if exists empjob;
drop table if exists employee;
drop table if exists job;
drop table if exists customer;
/* drop users */
drop user mickey;
drop user harry;
drop user vivec;
/* Q5 create tables */
/* create customer table */
create table customer
(
custphonePK char(12) not null unique,
	check(custphonePK like'[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
ctype char(1) check(ctype like 'C|R'),
clname varchar(35) not null,
cfname varchar(15) not null,
caddr varchar(40),
ccity varchar(20),
cstate char(2) default 'SC',
primary key (custphonePK)
)
ENGINE = INNODB;
/* create job table */
create table job
(
jobnumPK smallint unsigned not null check(jobnumPK<=6500),
custphoneFK char(12),
jobdate date,
description varchar(2000),
amobilled decimal(7,2),
primary key (jobnumPK),
foreign key (custphoneFK) references customer (custphonePK)
)
ENGINE = INNODB;
/* create employee table */
create table employee
(
essnPK char(9) not null,
elname varchar(35) not null,
efname varchar(15) not null,
ephone char(12) not null unique check(ephone like'[0-9][0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
hrrate decimal(5,2) default 15.75 check(hrrate<=100.00),
primary key (essnPK)
)
ENGINE = INNODB;
/* create empjob table */
create table empjob
(
essnFK char(9),
jobnumFK smallint unsigned not null check(jobnumPK<=6500),
hrsperjob decimal(5, 2) check(hrsperjob<=500.00),
primary key (essnFK, jobnumFK),
foreign key (essnFK) references employee (essnPK),
foreign key (jobnumFK) references job (jobnumPK)
)
ENGINE = INNODB;
/* Q6 create index for full name */
create unique index idx_customer_last_first on customer(clname, cfname);
/* Q7 create index for foreign keys(emp, job, cust) */
create unique index idx_job_custphoneFK on job(custphoneFK);
/* Q8 create user accounts */
create user mickey identified by 'mouse';
create user harry identified by 'potter';
create user vivec identified by 'almsivi';
grant all on painters.* 
to mickey identified by 'mouse';
grant select on painters.*
to harry identified by 'potter';
grant select on painters.*
to vivec;
grant all on painters.customer
to vivec;
grant all on painters.job to vivec;
/* Q9 insert records */
insert into customer 
values ('706 669-8542', 'C', 'Fett', 'Boba', '1 Bounty Hunter Way', 'Aiken', default),
		('706 420-0423', 'C', 'Fett', 'Jango', '10 Bounty Hunter Way', 'Aiken', 'SC'),
		('803 205-1013', 'R', 'Vader', 'Darth', '1 Death Star Dr', 'Augusta', 'GA');
insert into employee (essnPK, elname, efname, ephone, hrrate)
values ('123456789', 'Potter', 'Harry', '205 117-0731', 25.50),
		('247521932', 'Weasley', 'Ron', '205 177-1932', default),
		('155728910', 'Granger', 'Hermione', '205 322-1855', 30.00);
insert into job (jobnumPK, custphoneFK, jobdate, description, amobilled)
values (105, '706 669-8542', '2017-07-31', 'painted exterior, contrasting trim and shutters', 1150.00),
		(115, '706 420-0423', '2018-07-31', 'painted exterior', 950.00),
		(155, '803 205-1013', '2018-11-05', 'painted exterior, painted interior including logos, black and metallic tones throughout', 2575.00);
insert into empjob (essnFK, jobnumFK, hrsperjob)
values ('155728910', 105, 115.5),
		('247521932', 115, 102.25),
		('123456789', 155, 300);
/* Q10 update records */
update customer
set ccity='Atlanta' where clname='Vader';
update employee
set hrrate=17.50 where essnPK='247521932';
update job 
set amobilled=925.50 where jobnumPK=115;
update empjob
set hrsperjob=101.75 where jobnumFK=115;
/* Q11 delete records */
delete from empjob
where jobnumFK=105;
delete from employee
where essnPK='155728910';
delete from job
where jobnumPK=105;
delete from customer
where custphonePK='706 669-8542';
/* Q12 creates view list */
create view work_overview as
select custphoneFK, jobnumPK, jobdate, essnFK
from job, empjob
where jobnumPK=jobnumFK;
select * from work_overview;
/* Q13 creates view calculates */
create view totalpay_byemployee as
select essnPK, sum(hrsperjob) as totalhrsworked, (sum(hrsperjob))*hrrate as totalpay
from employee, empjob
where essnPK=essnFK
group by essnPK;
select * from totalpay_byemployee;