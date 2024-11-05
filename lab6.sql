create table locations(
location_id serial primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12)
);

create table departments(
department_id serial primary key,
department_name varchar(50) unique,
budget integer,
location_id integer references locations
);

create table employees(
employee_id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(20),
salary integer,
department_id integer references departments
);

INSERT INTO locations (street_address, postal_code, city, state_province) 
VALUES
('123 Main St', '12345', 'New York', 'NY'),
('456 Elm St', '67890', 'Los Angeles', 'CA'),
('789 Oak St', '54321', 'Chicago', 'IL')
('123 Main St', '12345', 'New York', 'NY'),
('456 Elm St', '67890', 'Los Angeles', 'CA'),
('789 Oak St', '54321', 'Chicago', 'IL');

INSERT INTO departments (department_name, budget, location_id) 
VALUES
('Human Resources', 100000, 1),
('Engineering', 250000, 2),
('Sales', 150000, 3),
('Engineering', 250000, 2),
('Sales', 150000, 3),
('Marketing', 120000, 4),
('IT Support', 90000, 5);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) 
VALUES
('Alice', 'Smith', 'alice.smith@example.com', '555-1234', 70000, 1),
('Bob', 'Jones', 'bob.jones@example.com', '555-5678', 90000, 2),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-8765', 60000, 3),
('Daisy', 'Johnson', 'daisy.johnson@example.com', '555-4321', 95000, 2),
('Ethan', 'Clark', 'ethan.clark@example.com', '555-3456', 72000, 1),
('Fiona', 'Lopez', 'fiona.lopez@example.com', '555-7890', 120000, 4),
('George', 'Martinez', 'george.martinez@example.com', '555-0123', 85000, 5);

/* №3 */
select first_name, last_name, e.department_id, department_name 
from employees e 
join departments d 
on e.department_id = d.department_id

/* №4 */
select first_name, last_name, e.department_id, department_name 
from employees e 
join departments d 
on e.department_id = d.department_id 
where e.department_id = 80 and e.department_id = 40

/* №5 */
select first_name, last_name, e.department_id, city, state_province
from employees e
join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id

/* №6 */
select d.department_id, department_name 
from departments d
left join employees e
on d.department_id = e.department_id

/* №7 */
select first_name, last_name, e.department_id, department_name 
from employees e 
left join departments d 
on e.department_id = d.department_id 
