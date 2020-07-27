show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#--------- 1) Assume there is a table called Multicust, with all of the same column definitions as Salespeople. 
-- 				Write a command that inserts all salespeople with more than one customer into this table. 

-- create table Multicust as select * from salespeople
-- 	where snum in (select snum from customers group by snum having count(snum) > 1);
    
desc multicust;
select * from multicust;

#-------- 2) Write a command that deletes all customers with no current orders. 

savepoint o1;

-- delete from customers where cnum NOT IN(select tempp.cnum from (select cnum from orders ) as tempp );


#-------- 3) Write a command that increases by twenty percent the commissions of all salespeople with total orders above Rs. 3,000. 
savepoint s1;

update salespeople set comm = comm*0.20 where snum in (select snum from orders where amt > 3000);


