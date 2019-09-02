create database lab1;
create table users(
    id serial primary key,
    firstname varchar(50),
    lastname varchar(50)
);

select * from users;

alter table users add column isadmin int;
alter table users alter column isadmin set data type boolean using isadmin::boolean;

alter table users alter column isadmin set default false;

create table tasks(
    id serial,
    name varchar(50),
    user_id integer
);

select * from tasks;

drop table tasks;
drop database lab1;







