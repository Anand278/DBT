show databases;
use cdac; 
show tables;
select * from orders;
#------Q 1 --------------------
select * from orders where odate ='1990-10-3' ;
select * from orders where odate ='1990-10-4' ;

select * from orders where odate='1990-10-3' or odate='1990-10-4';

select * from customers;
select * from salespeople;
#-----------Q 2 ----------------------
select * from customers where snum='1001' or snum='1004';

#-----------Q 3------------------------
select * from customers where cname >= 'A%' and cname <= 'G%';

#----------Q 4 ---------------------
select * from customers where cname like 'c%';

#----------Q 5 ---------------------
select * from orders where amt is not NULL;

