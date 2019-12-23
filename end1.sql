create database end1;

create table Highschooler(
    id int primary key,
    name varchar(255),
    grade int
);
insert into Highschooler values (1510, 'Jordan', 9),
                                (1689, 'Gabriel', 9),
                                (1381, 'Tiffany', 9),
                                (1709, 'Cassandra', 9),
                                (1101, 'Haley', 10),
                                (1782, 'Andrew', 10),
                                (1468, 'Kris', 10),
                                (1641, 'Brittany', 10),
                                (1247, 'Alexis', 11),
                                (1316, 'Austin', 11),
                                (1911, 'Gabriel', 11),
                                (1501, 'Jessica', 11),
                                (1304, 'Jordan', 12),
                                (1025, 'John', 12),
                                (1934, 'Kyle', 12),
                                (1661, 'Logan', 12);
create table Friends(
    ID1 int,
    ID2 int
);
insert into Friends values   (1510, 1381),
                            (1510, 1689),
                            (1689, 1709),
                            (1381, 1247),
                            (1709, 1247),
                            (1689, 1782),
                            (1782, 1468),
                            (1782, 1316),
                            (1782, 1304),
                            (1468, 1101),
                            (1468, 1641),
                            (1101, 1641),
                            (1247, 1911),
                            (1247, 1501),
                            (1911, 1501),
                            (1501, 1934),
                            (1316, 1934),
                            (1934, 1304),
                            (1304, 1661),
                            (1661, 1025);
create table Likes(
    ID1 int,
    ID2 int
);
insert into Likes values(1689, 1709),
                        (1709, 1689),
                        (1782, 1709),
                        (1911, 1247),
                        (1247, 1468),
                        (1641, 1468),
                        (1316, 1304),
                        (1501, 1934),
                        (1934, 1501),
                        (1025, 1101);


select h1.name, h2.name from Highschooler h1 join Friends f on h1.id = f.ID1
    join Highschooler h2 on h2.id = f.ID2
        where h1.name = 'Gabriel' or h2.name = 'Gabriel';

select h1.name, h1.grade, h2.name, h2.grade from Highschooler h1 join Likes l on h1.id = l.ID1
    join Highschooler h2 on h2.id = l.ID2
        where (h1.grade-h2.grade)>1 or (h2.grade-h1.grade)>1;

select distinct h1.name, h1.grade from Highschooler h1 inner join Likes l on h1.id = l.ID2
        where (select count(ID2) from Likes where id2 = h1.id)>1;

select h1.name, h1.grade, h2.name, h2.grade from Highschooler h1 inner join Friends f on h1.id = f.ID1
    inner join Highschooler h2 on h2.id = f.ID2
        where h1.grade = h2.grade order by h1.grade, h1.grade;

select h1.name, h1.grade, h2.name, h2.grade from Highschooler h1, Highschooler h2, Likes l1, Likes l2
        where (h1.id = l1.ID1 and h2.id = l1.ID2) and (h1.id = l2.ID2 and h2.id = l2.ID1) and h1.name<h2.name
                                                                                            order by h1.name, h2.name;
