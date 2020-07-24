show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;


#-------------- 1) Write a query that selects all customers whose ratings are equal to or greater than ANY of Serres’.  

select * from customers 
	where rating >= any(select rating from customers
			where snum in (select snum from salespeople where sname = 'serres'));


#-------- 2) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.  

select snum from salespeople where (snum, city) not in(select snum, city from customers);

#-------- 3) Write a query that selects all orders for amounts greater than any for the customers in London.

select * from orders 
	where amt >any ( select amt from orders
		where cnum in ( select cnum from customers where city = 'london'));
        
#------ 4) Write the above query using MIN or MAX.  

select max(amt) from orders where cnum in (select cnum from customers where city = 'london');

select min(amt) from orders where cnum in (select cnum from customers where city = 'london');







