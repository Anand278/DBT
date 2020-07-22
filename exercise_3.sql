show databases;
use exercise;
show tables;
select * from j;
select * from p;
select * from s;
select * from spj;

# --------1. Display all the Supplier names with the initial letter capital.   

#sselect initcap(sname) from s; 
select concat(upper(substr(sname, 1, 1)),lower(substr(sname, 2)))from s;

#---------2. Display all the Supplier names in upper case.   

select upper(sname) as SNAME from s;

#--------3. Display all the Supplier names in lower case.   

select lower(sname) as sname from s;

#-------4. Display all the Supplier names padded to 25 characters, with spaces on the left.   

select lpad(sname, 25, ' ') as sname from s;

#--------5. Display all the Supplier names (with ‘la’ replaced by ‘ro’).        HINT: REPLACE.   

select replace(sname, 'la', 'ro') as sname from s;

#--------6. Implement the above command such that ‘l’ is replaced with ‘r’ and ‘a’ is replaced with ‘o’.

#sselect translate(sname, 'la', 'ro') from s;
select replace(replace(sname, 'l', 'r'), 'a', 'o') as sname from s;

#--------7. Display the Supplier names and the lengths of the names.

select sname, length(sname) as length from s;

#-------8. Use the soundex function to search for a supplier by the name of ‘BLOKE’.   
insert into s (`s#`, sname, status, city) values ('s5', 'bloke', 40, 'mumbai');
select * from s;

select * from s where soundex(sname)=soundex('block');

#--------9. Display the Supplier name and the status (as Ten, Twenty, Thirty, etc.).  

select sname, case when status=10 then 'Ten'
 when status=20 then 'Twenty'
 when status=30 then 'Thirty'
 when status=50 then 'fifty'
 end as 'status'
 from s;

#--------10. Display the current day (e.g. Thursday).  

select dayname(curdate());








