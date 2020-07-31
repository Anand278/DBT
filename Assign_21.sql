show databases;
use cdac;
show tables;
select * from customers;
select * from orders;
select * from salespeople;

#---------- 1) Give Amit the right to change the ratings of the customers.

GRANT UPDATE ON customers TO Amit;

#--------- 2) Give Manoj the right to give other users the right to query the Orders table.

GRANT SELECT ON orders TO Manoj WITH GRANT OPTION;

  GRANT SELECT ON Manoj.orders TO Seema;

#---------- 3) Take the INSERT privilege on Salespeople away from Ajita.

REVOKE INSERT ON salespeople FROM Ajita;

#----------- 4) Grant Abhijeet the right to insert or update the Customers table while keeping her
-- 				possible rating values in the range of 100 to 500.

CREATE OR REPLACE VIEW RANGE AS
	(SELECT * FROM customers
	WHERE rating BETWEEN 100 AND 500);

GRANT UPDATE ON range100 TO Abhijeet;


#--------- 5) Allow Vikram to query the Customers table, but restrict his access to those
-- 				customers whose rating is the lowest.

 CREATE OR REPLACE VIEW RESTRICTMIN AS
	SELECT * FROM customers
	WHERE rating NOT IN
    	(SELECT min(rating) FROM customers);
 
 GRANT SELECT ON RESTRICTMIN TO Vikaram;