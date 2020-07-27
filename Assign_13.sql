show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#------- 1) Create a union of two queries that shows the names, cities, and ratings of all customers.
		 -- Those with rating of 200 or greater will also have the words “High Rating”,
		  -- while the others will have the words “Low Rating”. 
          
select cname, city, 'high rating' rating from customers where rating > 200
union
select cname, city, 'low rating' rating  from customers where rating <= 200;
          
#------- 2) Write a command that produces the name and number of each salesperson and 
		 -- each customer with more than one current order. Put the results in alphabetical order. 
          

select sname, snum,cname from salespeople join customers using (snum) 
where snum in (select snum from customers group by snum having count(snum) > 1) 
		order by sname , cname;

#-------- 3) Form a union of three queries.Have the first select the snums of all salespeople in San Jose; 
        -- the second, the cnums of all customers in San Jose; and the third the onums of all orders on October 
        -- 3. Retain duplicates between the last two queries  but eliminate any redundancies between either of them and the first.
        -- (Note: in the sample tables as given, there would be no such redundancy. This is besides the point.) 

select snum from salespeople where city='san jose' 
UNION select distinct cnum from customers where city='san jose' 
UNION select onum from orders where odate='1990-10-03';







