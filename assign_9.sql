show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#--------- 1) Write a query that lists each order number followed by the name of the customer who made the order. 

select orders.onum, customers.cname from customers, orders where customers.cnum = orders.cnum;

#---- 2) Write a query that gives the names of both the salesperson and the customer for each order along with the order number. 

select salespeople.sname, customers.cname, orders.onum from customers, orders, salespeople 
		where customers.snum = orders.snum  and orders.snum = salespeople.snum;

#---- 3) Write a query that produces all customers serviced by salespeople with a commission above 12%. 
#	Output the customer’s name, the salesperson’s name, and the salesperson’s rate of commission. 

select cname , sname, comm*100 'comm' from customers, salespeople 
		where comm > 0.12 and customers.snum = salespeople.snum;

#---- 4) Write a query that calculates the amount of the salesperson’s commission
#		 on each order by a customer with a rating above 100. 

select amt, comm from customers, orders, salespeople 
		where  rating > 100 and customers.snum = orders.snum  and orders.snum = salespeople.snum;

