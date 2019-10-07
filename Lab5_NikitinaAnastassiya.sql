create database lab5;       --1

create table customers(                     --2
    customer_id integer primary key,
    cust_name text,
    city text,
    grade integer,
    salesman_id integer
);

create table orders(
    ord_no integer,
    purch_amt real,
    ord_date date,
    customer_id integer references customers(customer_id),
    salesmen_id integer
);

insert into customers values(3002, 'Nike Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', null, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3008, 'Julian Green', 'London', 300, 5002),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003);

insert into orders values(70001, 150.5, '2012-10-05', 3005, 5002),
                         (70009, 270.65, '2012-09-10', 3001, 5005),
                         (70002, 65.26, '2012-10-05', 3002, 5001),
                         (70004, 110.5, '2012-08-17', 3009, 5003),
                         (70007, 948.5, '2012-09-10', 3005, 5002),
                         (70005, 2400.6, '2012-07-27', 3007, 5001),
                         (70008, 5760, '2012-09-10', 3002, 5001);

select sum(purch_amt) from orders;          --3
select avg(purch_amt) from orders;          --4
select count(cust_name) from customers;         --5
select min(purch_amt) from orders;          --6
select * from customers where cust_name like '%b';          --7
select * from orders where customer_id = (select customer_id from customers where customers.customer_id = orders.customer_id and customers.city = 'New York');      --8
select * from orders where customer_id = (select customer_id from customers where customers.customer_id = orders.customer_id) and purch_amt>10;         --9
select sum(grade) from customers;           --10
select * from customers where cust_name is not null;            --11
select max(grade) from customers;           --12



