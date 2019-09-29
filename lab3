create database lab3;       --1

create table countries(     --2
    country_id serial primary key,
    country_name text,
    region_id int,
    capital_name text,
    population int
);

insert into countries values(default, 'name1', 1, 'capital1', 1000);        --3
insert into countries(country_id, country_name) values(default, 'name2' );      --4
insert into countries(region_id) values(NULL);      --5
insert into countries values
        (default, 'name4', 4, 'capital4', 2000),
        (default, 'name5', 5, 'capital5', 4000);        --6
        
alter table countries alter column country_name set default 'Kazakhstan';       --7
alter table countries alter column capital_name set default 'Nursultan';        --8

insert into countries(country_name) values(default);        --9
insert into countries default values;      --10

create table countries_new (like countries);        --11

insert into countries_new select * from countries;      --12

update countries set region_id = 1 where region_id is null;     --13
update countries set population = population + population * 0.15 returning country_name, population as new_population;      --14

delete from countries where population<100000 and country_name like 'K%';       --15
delete from countries_new where country_id in (select country_id from countries) returning *;       --16
delete from countries returning *;      --17
