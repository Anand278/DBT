show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;


#--------1) Which of these views are updateable (will allow DML operations)?    

#1  Create View Dailyorders as Select Distinct cnum, snum, onum, odate from Orders; 

-- Works without any errors
 create view DAILYORDERS as
select distinct Cnum,Snum,Onum,Odate from ORDERS;

#2  Create View Custotals as Select cname, Sum (amt) Sum_Amt from Orders, Customers   where Orders.cnum=Customers.cnum  Group by cname;  

-- Showed Errors.
create view Custotals as
select Cnum,Snum(AMT) Sum_AMT from ORDERS,CUSTOMERS
where Orders.Cnum=CUSTOMERS.Cnum
group by Cnum;

#3  Create view Thirdorders as Select * from Dailyorders  where odate=’1990-10-03’;  

-- Showed Errors
create view Thirdorders as
select * from DAILYORDERS
where Odate='1990-10-03';

#4  Create view Nullcities  as Select snum, sname, city  from Salespeople  where city is NULL   OR sname BETWEEN ‘A’ and ‘MZ’;  

-- Worked with no errors
create view Nullcities as
select Snum,Sname,city from SALESPEOPLE
where City is NULL Or Sname between 'A' and 'MZ';


#-------- 2) Create a view of the Salespeople table called Commissions. 
-- 			This view will include only the snum and comm fields. 
-- 			Through this view, someone could enter or change commissions, but only to values between .10 and .20.  


create view commissions as select snum, comm from salespeople where comm between 0.10 and 0.20;

select * from commissions;

/*
3) Some SQL implementations have a built-in constant representing the current date, sometimes called “CURDATE” or “SYSDATE”.  
The word SYSDATE can therefore be used in a SQL statement, and be replaced by the current date 
when the value is accessed by commands such as Select or Insert. We will use a view of the Orders table 
called Entryorders to insert rows into the Orders table. Create the Orders table, so that SYSDATE is automatically inserted for odate
 if no value is given. Then create the Entryorders view so that no values can be given.  
*/


create table ORDERS_D3
(
  Onum int(5),
  AMT float(5,2),
  Odate date default(SYSDATE())
);

show tables;

insert into ORDERS_D3 (Onum,AMT)
values (01,2);

select * from ORDERS_D3;

create view ENTRY_ORDERS as
select * from ORDERS_D3
where Onum in
(select Onum_Temp from
(select Onum Onum_Temp from ORDERS_D3) AS Temp)
with check option;

alter table ORDERS_D3 add primary key (Onum);

