show databases;
use exercise;
show tables;
select * from j;
select * from p;
select * from s;
select * from spj;
select * from sdept;
select * from semp;


#-------- 1. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.  (in my table , 'monty') 

select * from s where status in (select status from s where sname = 'monty');

#-------- 2. Display all the Employees in the same department as the employee ‘MILLER’.('ALI').

select empname from semp where deptno in  (select deptno from semp where empname = 'ali');

#-------- 3. Display all the Parts which have more Weight than all the Red parts.(blue parts)

select pname, weight from p where weight > (select max(weight) from p where color = 'blue' );

#-------- 4. Display all the Projects going on in the same city as the project ‘TAPE’. ('TAB')

select * from j where city in (select city from j where jname = 'tab');

#-------- 5. Display all the Parts with Weight less than all the Green parts. (white parts)

select pname, weight from p where weight < (select weight from p where color = 'white');

#--------- 6. Display the name of the Supplier who has sold the maximum Quantity (in one sale). 

select sname, qty from spj join s using (`s#`) where qty = (select max(qty) from spj);

#-------- 7. Display the name of the Employee with the minimum Salary.   

select empname from semp where basic = (select min(basic) from semp);

#-------- 8. Display the name of the Supplier who has sold the maximum overall Quantity (sum of Sales).   

select sname, max(qty) from s,spj where s.`s#`=spj.`s#` group by qty order by qty desc limit 1;


#-------- 9. Display the name of the Department with the maximum number of Employees. 

select distinct deptname from semp ,sdept
    where semp.deptno = (select maxno.deptno from 
    (select temp.deptno, max(temp.no ) 
    from (select deptno,count(empno) no from semp group by deptno) as temp) as maxno) and semp.deptno = sdept.deptno;



