create database mid1;

create table movies(
    id serial primary key,
    title varchar(255) not null unique,
    rating int,
    genre varchar(50) not null
);
insert into movies values (1, 'Citizen Kane', 5, 'Drama'),
                          (2, 'Singing in the Rain', 7, 'Comedy'),
                          (3, 'The Wizard of Oz', 7, 'Fantazy'),
                          (4, 'North by Northwest', null, 'Comedy'),
                          (5, 'The Last Tango in Paris', 9, 'Drama'),
                          (6, 'The Quiet Man', null, 'Thriller');
create table theaters(
    id serial primary key,
    name varchar(255) not null unique,
    size int not null,
    city varchar(50) not null
);
insert into theaters values (1, 'Kinopark Esentai', 15, 'Alamty'),
                            (2, 'Star Cinema Mega', 7, 'Alamty'),
                            (3, 'Kinopark 8', 9, 'Shymkent'),
                            (4, 'Star Cinema 15', 11, 'Astana');


select distinct on(genre) title from movies;
select * from movies order by rating desc nulls last limit 3;
select * from theaters order by size desc limit 1 offset 2;
select title from movies where rating is null;
select * from theaters where city in ('Alamty', 'Shymkent') and size>7;
select row_number() over(order by id) as MovieID, 'The genre of ' || title || ' is ' || genre as MovieInfo from movies;


create table movietheaters(
    theater_id int references theaters(id),
    movie_id int references movies(id),
    rating int
);
insert into movietheaters values (1, 5, 5),
                                 (3, 1, 7),
                                 (1, 3, 9),
                                 (4, 6, 6);


select * from theaters where id not in (select theater_id from movietheaters);
select title,
    case when rating is null then 'No rating'
    when rating between 0 and 3 then 'Low'
    when rating between 4 and 7 then 'Medium'
    when rating between 8 and 10 then 'High'
    end
from movies;
update movies set rating = 1 where rating is null;
delete from movies where id not in (select movie_id from movietheaters);
select title from movies where title like 'T_e%n';
select genre, avg(rating) from movies group by genre;
select name from theaters where id in (select theater_id from movietheaters group by theater_id having count(theater_id)>1);
