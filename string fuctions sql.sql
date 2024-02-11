create database student;
use student;
create table students(student_id int primary key,first_name varchar(20),last_name varchar(20));
insert into students values 
(1,"Rio","aaaksh"),
(2,"sankar","rajan"),
(3,"karthi","sandy"),
(4,"sam","jovin"),
(5,"kamalesh","macha"),
(6,"dinesh","kumar"),
(7,"dhaya","rajan"),
(8,"aakash","baskar"),
(9,"ram","kumar"),
(10,"mani","gandan");
 select*from students;
update students set last_name="Rajan" where student_id=10;
update students set first_name ="Baskar" where student_id=1;
select student_id ,concat(first_name," ",last_name) as concat_name from students;
select student_id ,upper(first_name) from students;
select upper(first_name) from students where student_id=1;
select trim(first_name) from students;
select trim(last_name) from students where student_id =7;
select length(first_name) as nameLength from students;
select length(last_name) as nameLength from students where student_id=5;
select first_name,replace(first_name, "dinesh","palani") from students;
select first_name,replace(first_name,"ram","raj") from students where student_id = 7;
select first_name ,position('a'in first_name) from students;
select last_name,position('e' in last_name) from students;
select first_name,substring(last_name,1,3) from students;
select * ,left(first_name,3) from students;
select * ,right(last_name,4) from students;
select * from students;
