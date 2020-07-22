show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#------ 1) Write a query that counts all orders for October 3. 

select count(odate) as 'no. of orders' from orders where odate like '1990-10-03';

#------- 2) Write a query that counts the number of different non-NULL city values in the Customers table. 

select count(cname) as 'no. of cname' from customers where cname is not null;

#-------- 3) Write a query that selects each customer’s smallest order. 

select distinct(min(amt)) as 'smallest_order', cnum from orders group by cnum;

#-------- 4) Write a query that selects the first customer, in alphabetical order, whose name begins with G. 

select cname from customers where cname like 'g%';

#--------- 5) Write a query that selects the highest rating in each city. 

select max(rating) as 'highest_rating', city from customers group by city;

#--------- 6) Write a query that counts the number of salespeople registering orders for each day.
#--------- (If a salesperson has more than one order on a given day, he or she should be counted only once.). 

select count(distinct(snum)) as snum, odate from orders group by odate;









