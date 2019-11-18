create database lab8;                       --1

create table salesman(                                              --2
    salesman_id int primary key,
    name text,
    city text,
    commission real
);
create table customer(
    customer_id int primary key,
    cust_name text,
    city text,
    grade int,
    salesman_id int references salesman(salesman_id)
);
create table orders(
    ord_no int,
    purch_amt real,
    ord_date date,
    customer_id int references customer(customer_id),
    salesman_id int references salesman(salesman_id)
);

create role junior_dev with password 'password';                    --3

create view order_amt as                                                                                        --4
    select salesman.name, avg(orders.purch_amt), sum(orders.purch_amt) from salesman
        inner join orders on orders.salesman_id = salesman.salesman_id group by salesman.name;

create view orders_num as                                                                                       --5
    select customers.city, count(orders.ord_no) from customers
        inner join orders on orders.customer_id = customers.customer_id group by city;
grant all privileges on orders_num to junior_dev;

create view low_grade as                                                                                        --6
    select cust_name from customers where grade = (select min(grade) from customers);
grant select on low_grade to junior_dev;

create view sale_count as                                                                             --7
    select grade, count(salesman_id) from customers group by grade;

create view more_ord as                                                                                                                 --8
    select salesman.name, count(ord_no) from salesman
        inner join orders on salesman.salesman_id = orders.salesman_id group by salesman.name having count(ord_no)>0;

create role intern;                                                     --9
grant intern to junior_dev;


