create database lab7;           --1

create table locations(                                     --2
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    department_id serial primary key,
    department_name varchar(50),
    budget int,
    location_id int references locations
 );
create table employees(
  employee_id serial primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  phone_number varchar(20),
  salary int,
  manager_id int references employees,
  department_id int references departments,
  grade char(1)
);
create table job_grades(
    grade char(1),
    lowest_salary int,
    highest_salary int
);

select employees.first_name, employees.department_id, locations.city, locations.state_province              --3
    from employees inner join departments on employees.department_id = departments.department_id
                   inner join locations on departments.department_id = locations.location_id
                         where last_name like '%b%';


select departments.department_name, locations.city, locations.state_province                                --4
    from departments inner join locations on departments.department_id = locations.location_id;

select employees.first_name as employee, employees.first_name as manager from employees                     --5
    left join employees emp on employees.employee_id = emp.manager_id;

select job_grades.grade, avg(employees.salary) from job_grades inner join employees on job_grades.grade = employees.grade group by job_grades.grade;               --6

select employees.first_name, employees.last_name from employees inner join departments                      --7
    on employees.department_id = departments.department_id inner join locations
    on departments.location_id = locations.location_id where locations.city = 'London';

select * from employees inner join departments on employees.manager_id is null                                                                       --8
    where employees.department_id = (select department_id from employees group by department_id order by department_id desc limit 1);

select * from departments inner join locations on departments.location_id = locations.location_id                                           --9
    inner join employees on departments.department_id = employees.department_id
        where employees.salary = (select avg(lowest_salary + highest_salary) from job_grades) and locations.city = 'London';

select first_name, last_name from employees inner join job_grades on employees.grade = job_grades.grade                                                             --10
    inner join departments on employees.department_id = departments.department_id where departments.budget > (select avg(budget) from departments);
