show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#----------- 1) Create a view that shows all of the customers who have the highest ratings. 

create view vc as select * from customers where rating = (select max(rating) from customers);

show full tables;
select * from vc;

#-------- 2) Create a view that shows the number of salespeople in each city. 

create view vs as select city, count(city) from salespeople group by city;

select * from vs;

#------ 3) Create a view that shows the average and total orders for each salesperson after his or her name. 
-- 			Assume all names are unique. 

create view vavg as select distinct sname, avg(amt), count(onum) from salespeople natural join orders group by sname;

select * from vavg;

#------- 4) Create a view that shows each salesperson with multiple customers. 

create view vmc as select sname, cname from salespeople natural join customers order by sname;

select * from vmc;


