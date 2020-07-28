show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#-------- 1) Create the Orders table so that all onum values as well as all combinations of cnum and 
-- 			snum are different from one another, and so that NULL values are excluded from the date field.  


create table order1 (
onum int(4), cnum int(4), snum int(4), odate date not null, 
constraint pk_o primary key (onum, cnum, snum )
);

show tables;

#------ 2) Create the Salespeople table so that the default commission is 10% with no NULLS permitted, 
-- 			snum is the primary key, and all names fall alphabetically between A and M, 
-- 			inclusive (assume all names will be uppercase). 


create table salespeople1 (
snum int(4) primary key, comm float (4) default 0.10 not null, sname varchar(20) check(substr(upper(sname),1,1) between 'A' and 'M')
);

desc salespeople1;

insert into salespeople1 (snum,sname) values (10,'A');
   select * from salespeople1;


#---------- 3) Create the Orders table, making sure that the onum is greater than the cnum, and the cnum is greater that the snum. 
-- 				Allow no NULLS in any of these three fields.   

create table order2 (
onum int(4) not null, cnum int(4) not null, snum int(4) not null, constraint on_cn_sn check(onum > cnum and cnum > snum)
);

show tables;



