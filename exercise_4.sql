show databases;
use exercise;
show tables;
select * from j;
select * from p;
select * from s;
select * from spj;

#-------- 1. Display the minimum Status in the Supplier table.

select min(status) from s;

#--------- 2. Display the maximum Weight in the Parts table. 

select max(weight) from p;


#---------- 3. Display the average Weight of the Parts.   

select avg(weight) from p;

#---------- 4. Display the total Quantity sold for part ‘P1’.  

select sum(qty) from spj where `p#`='p1';

#--------- 5. Display the total Quantity sold for each part.  

#    	insert into spj values ('s4', 'p1', 'j2', '10');

select `p#`, sum(qty)  from spj group by `P#`;

#--------- 6. Display the average Quantity sold for each part.   

select `p#`, avg(qty) from spj group by  `p#`; 

#--------- 7. Display the maximum Quantity sold for each part, provided the maximum Quantity is greater than 800.  
# in my table( provided the maximum Quantity is greater than 8.)

select `p#`, max(qty) from spj where qty > 8 group by `p#`;

#--------- 8. Display the Status and the count of Suppliers with that Status. 

select status, count(`s#`) from s  group by status;

#--------- 9. Display the count of Projects going on in different cities.

#	insert into j values ('j6', 'tab', 'mumbai');

select city, count(`j#`) 'count of projects' from j group by city;

#--------- 10. What is the difference between COUNT(Status) and COUNT(*) ?  

#--->> COUNT(Status) evaluates the expression for each row in a set and returns the number of rows having a non-null values.;
	
#--->> 	COUNT(*) counts the number of items in a set. It includes NULL and duplicate values.;
#	It returns total number of rows in the table.;

#------- 11. Display the Status and the Count of Suppliers 
#	with that Status in the following format as shown below:-      
#	  Status   Count     Ten   1     Twenty   2     Thirty   3   

select case when status=10 then 'Ten'
 when status=20 then 'Twenty'
 when status=30 then 'Thirty'
 when status=40 then 'Forty'
 when status=50 then 'Fifty'
 end as 'statuss', count(sname) 'count'
 from s group by status
 order by status;
