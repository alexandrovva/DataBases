create database lab4;       --1

create table Dormitory(     --2
    room_number serial,
    block varchar(4),
    floor int,
    capacity int
);

create table Students(
    student_id varchar(6),
    student_name text,
    speciality varchar(12),
    penalty int,
    room_number int
);

select * from Dormitory;
select * from Students;

Insert into Dormitory values(default, 'A', 1, 2);        --3
Insert into Dormitory values(default, 'B', 2, 1);
Insert into Dormitory values(default, 'C', 3, 4);
Insert into Dormitory values(default, 'D', 1, 4);

Insert into Students values(110845, 'Ali', 'IS', 1, 1);
Insert into Students values(110947, 'Aya', 'IS', 3, 1);
Insert into Students values(110855, 'Bayan', 'VTIPO', 0, 2);
Insert into Students values(110888, 'Sayan', 'AU', 5, 3);
Insert into Students values(110846, 'Fooly', 'IS', 2, 3);
Insert into Students values(111045, 'Alika', 'BS', 1, 4);
Insert into Students values(111067, 'Dayana', 'BS', 0, 4);
Insert into Students values(111070, 'Rean', 'BS', 5, 3);

select * from Dormitory;        --4
select(student_name) from Students where penalty>3;     --5
select student_name, room_number from Students where student_name like '%a%';    --6
select(room_number) from Dormitory where (select count(student_id) from Students where room_number = Dormitory.room_number)>2;      --7
select room_number, count(student_id) from Students group by room_number order by room_number;      --8
select room_number, count(student_id) from Students group by room_number having count(student_id)<3 order by room_number;        --9

Insert into Dormitory values(default, 'A', 2, 3);       --10
Insert into Students values(166787, 'Aidos', 'IT', 3, 3);       --11

Delete from Students where penalty>4 and (select block from Dormitory where room_number = Students.room_number) <= 'C';        --12

select room_number, count(student_id) from Students where penalty>2 group by room_number order by room_number;      --13

Delete from Students where room_number = 2 returning *;      --14

select room_number, count(student_id) from Students
    where (select block from Dormitory where room_number = Students.room_number)='A'
      and (select floor from Dormitory where room_number = Students.room_number)=2 group by room_number order by room_number;        --15






