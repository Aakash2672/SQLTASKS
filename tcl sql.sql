use employees;
create table employees(emp_id int primary key ,fname varchar(20),l_name varchar(20),salary decimal(7,2));
insert into employees values(1,"Raj","Kumar",30000),(2,"Dhinesh","Kumar",23000),(3,"Sathish","Kumar",25000),
(4,"Kalai","Selvan",45000),(5,"Tamil","Selvan",35000),(6,"Govind","Samy",25000);

start transaction;
commit;

start transaction;

update employees set salary=28000 where emp_id=2;
savepoint updation;
start transaction;
insert into employees values(8,"Dhilip","Kumar",25000);
rollback;
insert into employees values (7,"Sam","Kumar",34000);
rollback;
select * from employees;
