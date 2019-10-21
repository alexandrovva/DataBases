create database lab6;

create table employees(                         --1
    emp_id serial primary key,
    first_name varchar(20),
    last_name varchar(40),
    salary int not null,
    begin_date date,
    end_date date,
    job_title varchar(50) default ' '
);

create table department(
    department_id serial not null primary key,
    emp_id integer references employees(emp_id),
    department_name varchar(5),
    email char(40) unique,
    phone_number char(12),
    hire_date timestamp,
    commission float
);

alter table employees add constraint chk_date check(end_date>=begin_date and begin_date>='2001-01-01');         --2

alter table employees add constraint chk_salary check(salary>=60000);           --3

alter table employees add constraint uni_last unique(last_name);                --4

alter table employees drop constraint chk_salary;               --5

select conname from pg_catalog.pg_constraint where contype = 'f';               --6

alter table department add constraint check_val check(department_name in ('FIT', 'BS', 'FEOG', 'FGGE'));            --7

alter table employees drop column emp_id cascade;               --8

select first_name, last_name from employees where char_length(first_name)<=5;               --9

alter table employees drop constraint uni_last;                 --10











