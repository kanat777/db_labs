create database lab8

create table salesman (
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);

create table customers (
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int,
    foreign key (salesman_id) references salesman(salesman_id)
);

create table orders (
    ord_no int primary key,
    purch_amt decimal(10, 2),
    ord_date date,
    customer_id int,
    salesman_id int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (salesman_id) references salesman(salesman_id)
);

insert into salesman (salesman_id, name, city, commission) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Lauson Hen', 'Rome', 0.12);

insert into customers (customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3008, 'Julian Green', 'London', 300, 5002);

insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3004, 5006),
(70004, 110.5, '2012-08-17', 3007, 5001),
(70007, 2400.6, '2012-07-27', 3005, 5002),
(70005, 5760.0, '2012-09-10', 3002, 5001);


/* №3 */
create role junior_dev with login;


/* №4 */
create view salesmen_new_york as
select * from salesman
where city = 'New York';


/* №5 */
create view order_details as
select 
    orders.ord_no,
    orders.purch_amt,
    orders.ord_date,
    salesman.name as salesman_name,
    customers.cust_name as customer_name
from orders
join salesman on orders.salesman_id = salesman.salesman_id
join customers on orders.customer_id = customers.customer_id;

grant all privileges on order_details to junior_dev;


/* №6 */
create view high_grade_customers as
select * from customers
where grade = (select max(grade) from customers);

-- Grant only select privilege on the view to junior_dev
grant select on high_grade_customers to junior_dev;


/* №7 */
create view salesmen_count_per_city as
select city, count(*) as salesman_count
from salesman
group by city;


/* №8 */
create view salesmen_with_multiple_customers as
select s.salesman_id, s.name, s.city, count(c.customer_id) as customer_count
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name, s.city
having count(c.customer_id) > 1;


/* №9 */
create role intern with login;

grant junior_dev to intern;
