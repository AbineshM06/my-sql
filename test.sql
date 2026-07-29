create database qa
use qa

CREATE TABLE students(
stu_id int primary key auto_increment,
stu_name varchar(50),
stu_age int ,
stu_mark int,
city varchar(50)
);

INSERT INTO students (stu_id,stu_name,stu_age,stu_mark,city) VALUES ("1","sabari","20","90","cuddalore"),
("2","abi","19", "75", "mannai"),
("3","adhi","18","80","thanjavur")

select * from students,

select stu_name,stu_mark from students #1 question

select * from students where stu_mark >=80

select * from students where city = "cuddalore"

select * from students where stu_age >18

select *from students where stu_mark between 60 and 80

select  * from students where stu_name like  "a%"

select * from students where city != "thanjavur"

select * from students   ORDER  BY stu_mark DESC

select * from students   ORDER  BY stu_mark DESC LIMIT 2

#QUESTIONS 2

select count(*) from students

select avg (stu_mark) from students

select max(stu_mark) from students
 
select min(stu_mark) from students

select sum(stu_mark) from students

select city, count(*) as total_students from students group by city

select city, avg(stu_mark) from students group by city




create table Orders(
order_id int primary key,
customer_name varchar(50),
order_date date,
amount decimal(10,2)
);

insert into Orders values(1,"sabari","2026-07-22",20000);

insert into Orders values(2,"vicky","2026-07-20",30000);

insert into Orders values(3,"rithish","2026-02-26",10000);

insert into Orders values(4,"yuvaraj",current_date(),23000);

insert into Orders values(5,"sam","2025-02-26",10000);

insert into Orders values(6,"logesh","2024-02-26",10000);

select * from Orders
 
select * from orders where order_date > curdate() - interval 7 day;

select * from orders where order_date < curdate() - interval 2 year;

select order_id,datediff(curdate(),order_date)as days_diff from Orders;

select year(order_date) from orders;

select month(order_date) from orders;



create  table Customers(
cus_id int primary key,
cus_name varchar(50),
city varchar(50)
);


create table OrdersN(
order_id int primary key,
cus_id int,
amount decimal(10,2),
foreign key (cus_id)references Customers(cus_id)
);

insert into Customers values(1,"sabari","Cuddalore"),(2,"vicky","Trichy"),(3,"vijay","Karur");

insert into OrdersN values(1,1,3000),(2,2,4000),(3,3,7688);

select * from customers

select * from OrdersN

select c.cus_name,o.amount from Customers as c 
inner join OrdersN as o on c.cus_id=o.cus_id;

select * from Customers as c 
inner join OrdersN as o on c.cus_id=o.cus_id;

select c.cus_name,sum(o.amount) AS total_amount from Customers c 
inner join OrdersN o on c.cus_id = o.cus_id group by c.cus_id, c.cus_name;


create table Doctor(
doctor_id int primary key,
doctor_name varchar(50),
spec varchar(50)
);

insert into doctor values ("101", "sabari", "cardiology") ,("102","vicky","md"),
("103","rithish","demotology"),
("104","sam","neouorology");

select * from doctor


create table Patient(
patient_id int primary key,
patient_name varchar(50),
age int
);

insert into Patient values(151,"sabari",25),
(152,"vicky",55),
(153,"raj",28),
(154,"sam",56),
(155,"yuva",59)

select* from Patient


create table Appointment(
appointment_id int primary key,
patient_id int,
doctor_id int,
appointment_date date,
foreign key (patient_id)references Patient(patient_id),
foreign key (doctor_id) references Doctor(doctor_id)
);

insert into Appointment values(1,151,101,"2026-02-10"),
(2,152,102,"2026-05-11"),
(3,153,103,"2026-06-12"),
(4,154,104,"2026-07-22")

create table Prescription(
prescription_id int primary key,
appointment_id int,
medicine varchar(50)
);


insert into Prescription values(1,1,"Aspirin"),
(2,2,"Paracetamol"),
(3,4,"Calcium")

select * from Prescription

select p.patient_name,d.doctor_name from Patient p 
inner join Appointment a on a.patient_id=p.patient_id
inner join Doctor d on a.doctor_id=d.doctor_id;

select p.patient_name,d.spec ,a.appointment_date from Patient p 
inner join Appointment a on a.patient_id=p.patient_id
inner join Doctor d on a.doctor_id=d.doctor_id;

select p.patient_name,d.spec ,a.appointment_date,r.medicine from Patient p 
inner join Appointment a on a.patient_id=p.patient_id
inner join Doctor d on a.doctor_id=d.doctor_id
inner join Prescription r on r.appointment_id=a.appointment_id;

select p.patient_name,d.doctor_name,a.appointment_date from Patient p 
inner join Appointment a on a.patient_id=p.patient_id
inner join Doctor d on a.doctor_id=d.doctor_id;


select p.patient_name,d.doctor_name,a.appointment_date from Patient p 
inner join Appointment a on a.patient_id=p.patient_id
inner join Doctor d on a.doctor_id=d.doctor_id;

select a.appointment_date,r.medicine from Appointment a
left join Prescription r on r.appointment_id=a.appointment_id;

select d.doctor_name,p.patient_name from Doctor d
left join Appointment a on d.doctor_id=a.doctor_id
left join Patient P on a.patient_id =p.patient_id;

select p.patient_name,d.doctor_name from Patient p
left join Appointment a on a.patient_id=p.patient_id
left join Doctor d on a.doctor_id=d.doctor_id;


select d.doctor_name,p.patient_name from Appointment a
right join Doctor d on d.doctor_id=a.doctor_id
right join Patient p on p.patient_id=a.patient_id;

select r.medicine,a.appointment_date from Appointment a
right join Prescription r on r.appointment_id=a.appointment_id;

select p.patient_name,d.doctor_name from Patient p
left join Appointment a on a.patient_id=p.patient_id 
left join Doctor d on a.doctor_id=d.doctor_id
union
select p.patient_name,d.doctor_name from Patient p
right join Appointment a on a.patient_id=p.patient_id 
right join Doctor d on a.doctor_id=d.doctor_id;

select d.doctor_name ,count(d.doctor_id)as Highest_appointment from Doctor d
left join Appointment a on a.doctor_id=d.doctor_id
group by d.doctor_id order by Highest_appointment desc limit 1;

select p.patient_name from Patient p
left join Appointment a on p.patient_id = a.patient_id
where a.appointment_id is null;

select a.appointment_id,a.appointment_date from Appointment a
left join Prescription r on a.appointment_id = r.appointment_id
where r.prescription_id is null;

select d.doctor_name from Doctor d
left join Appointment a on d.doctor_id = a.doctor_id
where a.appointment_id is null;

select d.doctor_name from Doctor d
left join Appointment a on d.doctor_id = a.doctor_id
left join Patient p on a.patient_id = p.patient_id
where p.age > 50;

select d.doctor_name,count(a.patient_id) as total_patients from Doctor d 
left join Appointment a on  d.doctor_id = a.doctor_id
group by d.doctor_id, d.doctor_name;

select d.doctor_name,count(a.patient_id) as total_patients from Doctor d
left join Appointment a on d.doctor_id = a.doctor_id
group by d.doctor_id, d.doctor_name
Order by total_patients desc limit 1;

select d.spec,count(a.appointment_id) as total_appointments from Doctor d
left join Appointment a on d.doctor_id = a.doctor_id
group by d.spec;

select d.doctor_name,count(r.prescription_id) as total_prescriptions from Doctor d
left join Appointment a on d.doctor_id = a.doctor_id
left join Prescription r on  a.appointment_id = r.appointment_id
group by d.doctor_id, d.doctor_name;