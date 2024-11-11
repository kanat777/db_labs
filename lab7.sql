create table countries (
    country_id serial primary key,
    name varchar(100) unique
);

create table employees (
    employee_id serial primary key,
    name varchar(100),
    surname varchar(100),
    salary numeric(10, 2),
    department_id int
);

create table departments (
    department_id serial primary key,
    budget numeric(10, 2)
);

do $$
declare 
    i int := 1;
    base_budget numeric(10, 2) := 100000;
begin
    while i <= 10000 loop
        insert into departments (budget) values (base_budget + (i - 1) * 100);
        i := i + 1;
    end loop;
end $$;

do $$
declare 
    i int := 104;
begin
    while i <= 10300 loop
        insert into countries (name) values ('Country' || i);
        i := i + 1;
    end loop;
end $$;

do $$
declare 
    i int := 101;
begin
    while i <= 10300 loop
        insert into employees (name, surname, salary, department_id) 
        values ('Employee' || i, 'Surname' || i, 70000 + (i - 1) * 1000, (i % 3) + 1);
        i := i + 1;
    end loop;
end $$;

/* №1 */
create index countries_name_idx on countries (name);

SELECT * FROM countries WHERE name = 'Russia';

/* №2 */
create index employees_name_surname_idx on employees (name, surname);

SELECT * FROM employees WHERE name = 'Employee16'
AND surname = 'Surname16';

/* №3 */
create unique index employees_salary1_idx on employees (salary);

SELECT * FROM employees WHERE salary > 87000
AND salary < 90000;
/* №4 */
create index employees_name_substring_idx on employees (substring(name from 1 for 4));

SELECT * FROM employees WHERE substring(name
from 1 for 4) = 'abcd';

/* №5 */
create index employees_departments_salary_idx on employees (salary);
create index departments_employees_budget_idx on departments (budget);

SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id WHERE
d.budget > 70000 AND e.salary < 90000;
