create database lab3;

create table countries(
    country_id serial primary key,
    country_name text,
    region_id int,
    capital_name text,
    population int
);

insert into countries values(default, 'name1', 1, 'capital1', 1000);
insert into countries(country_id, country_name) values(default, 'name2' );
insert into countries(region_id) values(NULL);
insert into countries values
        (default, 'name4', 4, 'capital4', 2000),
        (default, 'name5', 5, 'capital5', 4000);
alter table countries alter column country_name set default 'Kazakhstan';
alter table countries alter column capital_name set default 'Nursultan';
insert into countries(country_name) values(default);
insert into countries default  values;

create table countries_new (like countries);
insert into countries_new select * from countries;
update countries set region_id = 1 where region_id is null;
update countries set population = population + population * 0.15 returning country_name, population as new_population;
delete from countries where population<100000 and country_name like 'k%';
delete from countries_new where country_id in (select country_id from countries) returning *;
delete from countries returning *;

