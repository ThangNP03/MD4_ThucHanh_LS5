create database thuchanh;
use classicmodels;
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;

-- create views
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;

select * from customer_views;



CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

DROP VIEW customer_views;


 SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

 ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
 EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

 ALTER TABLE customers DROP INDEX idx_full_name;
 
 
DELIMITER //

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cusNum;

END //

call getCusById(175);


DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);

SELECT @total;




DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8


