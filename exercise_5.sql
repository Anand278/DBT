show databases;
use exercise;
show tables;
select * from j;
select * from p;
select * from s;
select * from spj;

#------------ 1. Display the Supplier name and the Quantity sold.   

-- ---------i)

select sname, qty from s, spj where s.`S#` = spj.`S#`;

-- ---------ii)

select sname, qty from s join spj using (`s#`);


#----------- 2. Display the Part name and Quantity sold.

select pname, qty from p join spj using (`p#`) ;

select pname, qty from p, spj where p.`p#` = spj.`p#`;

#--------- 3. Display the Project name and Quantity sold.  

select jname, qty from j join spj using (`j#`) ;

select jname, qty from j, spj where j.`j#` = spj.`j#`;

#------- 4. Display the Supplier name, Part name, Project name and Quantity sold.  

select sname, pname, jname, qty from 
	spj join s using (`s#`) 
		join p using (`p#`)
		join j using (`j#`); 

#--------- 5. Display the Supplier name, Supplying Parts to a Project in the same City.  

select sname, pname from p join s using (city);

#-------- 6. Display the Part name that is ‘Red’ ('blue' in this table)is color, and the Quantity sold. 

select pname, qty from spj join p using (`p#`) where color = 'blue';

#--------- 7. Display all the Quantity sold by Suppliers with the Status = 20.   

select sname, qty from spj join s using (`s#`) where status = 20;

#--------- 8. Display all the Parts and Quantity with a Weight > 14.  

select p.*, qty from spj join p using (`p#`) where weight > 14;

#------- 9. Display all the Project names and City, which has bought more than 500 Parts.(more than 10 parts)

select  distinct j.city, jname from 
spj join j using (`j#`) 
	join p where qty > 10;

#--------- 10. Display all the Part names and Quantity sold that have a Weight less than 15.   

select pname, qty from 
spj join p using (`p#`) 
		where weight < 15;




