CREATE TABLE users(
id INT PRIMARY KEY,
userName VARCHAR(50),
passwordRef VARCHAR(50)
)

select * from users

ALTER TABLE users ADD COLUMN user_id INT

ALTER TABLE users RENAME COLUMN user_id TO userIds

ALTER TABLE users MODIFY COLUMN userIds VARCHAR(100)

ALTER TABLE users DROP COLUMN userIds

select * from users

INSERT into users VALUES (1, "Vignesh", "Vignesh@123")

INSERT into users VALUES (2, "Suresh", "Suresh@123"),
(3, "Devanathan", "DN@121"),
(4, "Abdul", "Abdul123#")

INSERT into users (id, userName) VALUES (5, "Revanth")


select userName, passwordRef from users

select * from users where userName = "Abdul"

CREATE TABLE studentRecords(
rollNo INT PRIMARY KEY,
studentName VARCHAR(30) NOT NULL,
course VARCHAR(30),
age INT,
yearOfStudy INT

)

INSERT INTO studentRecords VALUES (1, "Rajesh", "CSE", 18, 2),
(2, "Suresh", "EEE", 20, 3),
(3, "Subhash", "EEE", 18, 2)

select * from studentRecords

select * from studentRecords where course = "EEE" AND yearOfStudy = 3

select * from studentRecords where course = "EEE" OR yearOfStudy = 3

select * from studentRecords where course = "EEE" and yearOfStudy = 3 and age > 20

select * from studentRecords where course in ("EEE", "CSE")


CREATE TABLE sample (
	id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(30)

)

INSERT INTO sample (userName) VALUES ("Suresh")
select * from sample

CREATE TABLE EmployeeDetails(
emp_id INT AUTO_INCREMENT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
department VARCHAR(30) NOT NULL,
salary DECIMAL(10, 2) NOT NULL
) 

INSERT INTO EmployeeDetails (emp_name,department,salary) VALUES
("Ashok", "DEV", 40000),
("Devanathan", "TESTING", 30000),
("Revanth", "CLOUD", 60000),
("Vignesh", "DEV", 50000)

select * from EmployeeDetails

select count(*) from EmployeeDetails

select count(*) as total_employees from EmployeeDetails where department = "DEV"

select MAX(salary) as max_salary from EmployeeDetails where department = "DEV"

select MIN(salary) as max_salary from EmployeeDetails

select * from EmployeeDetails where salary = 60000

select * from EmployeeDetails where salary = (select MAX(salary) from EmployeeDetails)

select SUM(salary) from EmployeeDetails where department = "DEV"

-- DECIMAL (1,1) - 0.0-0.9
-- DECIMAL (2,1) - 0.0-9.9
-- DECIMAL(3,1) - 00.0 -99.9
-- DECIMAL (4,2) - 00.00 - 99.99
-- DECIMAL(5,2) - 999.99

select department, count(*) as total_employees from EmployeeDetails group by department

select * from EmployeeDetails order by salary ASC
select * from EmployeeDetails order by salary

select department, SUM(salary) as total_salary from EmployeeDetails 
group by department HAVING total_salary > 50000 order by total_salary DESC



CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50),
city VARCHAR(20)
)

CREATE TABLE Products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(40),
price DECIMAL(10,2)
)

CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
)

INSERT INTO Customers (customer_name, city ) values ("Vignesh", "chennai"),
("Deva", "Madurai"),
("Sathish", "Madurai"),
("Abdul", "Banglore"),
("Revanth", "Delhi")

select * from Customers

INSERT INTO Products (product_name, price) VALUES ("Toggle", 500),
("Laptop", 60000),
("Mouse", 1000),
("KeyBoard", 1500)

select * from Products

INSERT INTO Orders(customer_id, product_id, quantity) VALUES 
(1, 1, 1),
(1,2,2),
(2,4, 1),
(3,3,2)

select * from Orders


SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Products p ON o.product_id = p.product_id


SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id 

SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
RIGHT JOIN Products p ON o.product_id = p.product_id 


SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id 
UNION
SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
RIGHT JOIN Products p ON o.product_id = p.product_id 

CREATE TABLE Employee(
emp_id int PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT
)

CREATE TABLE Employee_N(
emp_id int PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT
)

INSERT INTO Employee_N VALUES (1, "Vignesh", 3),
(2, "Deva", 3),
(3, "Sathish", NULL)

select * from Employee

select e.emp_name as EmpName, m.emp_name as Manager 
from Employee e LEFT JOIN Employee m
ON e.manager_id = m.emp_id where m.emp_name = "Sathish"


SELECT c.customer_name, c.city, p.product_name, p.price,o.quantity from Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id where o.quantity > 1
and p.price > 20000

select c.customer_name , SUM(o.quantity) as total_quantity from Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
group by c.customer_name

select c.customer_name, SUM(o.quantity*p.price) as total_amount from Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
group by c.customer_id HAVING total_amount > 30000

select c.customer_name, SUM(o.quantity*p.price) as total_amount from Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
group by c.customer_id order by total_amount DESC

select c.customer_name, SUM(o.quantity*p.price) as total_amount from Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Products p ON o.product_id = p.product_id
group by c.customer_id order by total_amount DESC LIMIT 1

SELECT p.product_name, SUM(o.quantity) as total_sold from
Products p JOIN Orders o ON p.product_id = o.product_id group by p.product_name  

select c.customer_name FROM Customers c LEFT JOIN Orders o 
ON c.customer_id = o.customer_id where o.order_id is NULL


select * from Customers

select * from Customers LIMIT 2 OFFSET 2

select * from Customers LIMIT 10 OFFSET 0
select * from Customers LIMIT 10 OFFSET 10
select * from Customers LIMIT 10 OFFSET 20
CREATE TABLE product_deliveryStatus(
id INT PRIMARY KEY,
product_name VARCHAR(50),
order_date DATE,
delivery_expected TIME,
updated_timeStamp DATETIME
)
insert into product_deliveryStatus VALUES (4, "Battery", "2026-07-08", "10:10:00", "2026-07-08 10:10:00")

select * from product_deliveryStatus

insert into product_deliveryStatus VALUES (5, "BackCover", CURDATE(), CURTIME(), NOW()),
(3, "Charger", CURDATE(), CURTIME(), NOW())

select DATE_FORMAT(order_date, "%d/%m/%Y") from product_deliveryStatus

select DATE_FORMAT(updated_timeStamp, "%d/%m/%Y %H: %i: %s") from product_deliveryStatus

select * from product_deliveryStatus where order_date >= CURDATE() - INTERVAL 10 DAY



select * from product_deliveryStatus 
where order_date >= NOW() - INTERVAL 2 YEAR 


select * from product_deliveryStatus 
where updated_timeStamp >= CURDATE() - INTERVAL 15 MINUTE 

select * from product_deliveryStatus 
where updated_timeStamp >= NOW() - INTERVAL '2 5' DAY_HOUR

select * from product_deliveryStatus 
where updated_timeStamp >= NOW() - INTERVAL '3 10:20' DAY_MINUTE



select * from product_deliveryStatus 
where updated_timeStamp >= NOW() - INTERVAL '3 10:20:30' DAY_SECOND

select * from product_deliveryStatus 
where updated_timeStamp >= NOW() - INTERVAL '10:20:30' HOUR_SECOND

select * from product_deliveryStatus 
where updated_timeStamp >= NOW() - INTERVAL '10:20' HOUR_MINUTE

select * from product_deliveryStatus 
where updated_timeStamp >= CURDATE() - INTERVAL '1-6' YEAR_MONTH

select * from Products

select * from Products where product_name LIKE 'm%'

select * from Products where product_name LIKE '_o%'

select * from Products where product_name LIKE '%ou%'

select UPPER(product_name) from Products

select LOWER(product_name) from Products

select SUBSTRING(product_name, 3) from Products

select CONCAT( 
UPPER(LEFT(product_name, 1)),
LOWER(SUBSTRING(product_name, 2))
) as productName from Products

CREATE TABLE product_Info (
product_id int PRIMARY KEY,
product_name VARCHAR(50),
price INT
)

DELIMITER $$

CREATE TRIGGER set_priceTo_default
before INSERT on product_Info
FOR EACH ROW
BEGIN
	if NEW.price is NULL THEN 
     SET NEW.price = 299;
 end if;
END $$
DELIMITER ;

CREATE TRIGGER set_price_default
BEFORE INSERT ON product_Info
FOR each row
SET NEW.price = ifnull(NEW.price, 299)

insert into product_Info (product_id, product_name) VALUES (1, "RAM")
select * from product_Info


CREATE TRIGGER update_product_price
before update on product_Info
for each row
set NEW.price = IFNULL(NEW.price,499);

UPDATE product_Info SET price = NULL where product_id = 1


CREATE TABLE product_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
action VARCHAR(20),
message VARCHAR(40),
log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

DELIMITER $$

CREATE TRIGGER trg_after_delete
AFTER DELETE 
ON product_Info
FOR EACH ROW 
BEGIN
	INSERT INTO product_log(product_id, action, message)
    VALUES(
    OLD.product_id, 'DELETE', concat('product', OLD.product_name, 'deleted')
    );
END $$

DELIMITER ;

DELETE FROM product_Info where product_id = 1

select * from product_log


select * from Products

CREATE INDEX product_price_index ON Products(price)

SHOW INDEX from Products

DROP INDEX product_price_index ON Products



DELIMITER $$
CREATE PROCEDURE productData()
BEGIN
	select * from Products;
END $$

DELIMITER ;

CALL productData()

DELIMITER $$

CREATE procedure getProductinput(in productid INT)
BEGIN
	select * from Products where product_id = productid;
END $$

DELIMITER ;


CALL getProductinput(2)

DELIMITER $$

CREATE procedure productCountNew()
BEGIN
	select COUNT(*) as total_products from Products;
    select AVG(price) as average_price from Products;
END $$

DELIMITER ;

CALL productCountNew()

DROP PROCEDURE IF EXISTS productCountNew

SHOW PROCEDURE STATUS



DELIMITER $$

CREATE PROCEDURE productCountNew(OUT total INT)
BEGIN
	select COUNT(*) INTO total from Products;
END $$

DELIMITER ;

CALL productCountNew(@count);

select @count




CREATE TABLE accounts(
id INT PRIMARY KEY,
customer_name VARCHAR(50),
balance DECIMAL(10,2)
)

INSERT INTO accounts VALUES (1, "john", 5000),
(2, "Alex", 3000)


START TRANSACTION;
UPDATE accounts SET balance = balance-1000 where id = 1; 
UPDATE accounts SET balance = balance+1000 where id = 2;
COMMIT;

rollback;

select * from accounts;

START TRANSACTION;
UPDATE accounts SET balance = balance-1000 where id = 1; 
UPDATE accounts SET balance = balance+1000 where id = 3;
ROLLBACK;
