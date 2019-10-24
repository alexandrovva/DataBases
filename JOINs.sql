create database test;

create table a(
    num int,
    name text
);

create table b(
    num int,
    value text
);

insert into a values(1, 'a'),(2, 'b'), (3,'c');
insert into b values(1, 'x'),(3,'y'),(5,'z');

select * from a cross join b;

select * from a inner join b using(num);

select * from a left join b using(num);
select * from a left outer join b using(num); --the same as LEFT JOIN

select * from a right join b using(num);

select * from a left join b using(num) where b.num = 1; --only the first row
select * from a left join b using(num) where b.num = 5; --empty

insert into a values(null, 'd');
select * from a left join b using(num) where a.num is null --only the forth row (<null>, d, <null>), third is <null> cause we dont have matching in the second table'






