show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

# ------ 1) Assume each salesperson has a 12% commission.
#  Write a query on the orders table that will produce the order number,
#  the salesperson number, and the amount of the salesperson’s commission for that order. 

select onum, snum, (amt*0.12) as comm from orders;

# ------- 2) Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:  
#           For the city (city), the highest rating is : (rating). 

select concat("For the city " , city), concat("the highest rating is : ",  max(rating)) from customers group by city;

#---------- 3) Write a query that lists customers in descending order of rating. 
#  		Output the rating field first, followed by the customer’s name and number. 

select rating, cname, cnum from customers order by rating desc;

#--------- 4) Write a query that totals the orders for each day and places the results in descending order. 

select count(odate) as 'total_order' , odate from orders group by odate order by total_order desc;

#----select sum(amt), odate from orders group by odate;
#----- 12511.78  4723.00 1788.46  8963.28