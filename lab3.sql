Select lastname from employees;

select distinct lastname from employees;

select*from employees 
where lastname = 'Smith';

select*from employees 
where lastname = 'Smith' or lastname ='Doe';

select*from employees
where department = 14;

select*from employees 
where department = 37 or department = 77;

select SUM(budget)
from departments;

select department, count(*) as number_of_employees
from employees
group by department;

select department, count(*) as number_of_employees
from employees
group by department
having count(*) > 2;

select name
from departments
order by budget desc
limit 1 offset 1;

select e.name, e.lastname
from employees e
join departments d on e.department = d.code
where d.budget = (select min(budget) from departments);

select name from employees
where city = 'Almaty'
union
select name from customers
where city = 'Almaty';

select*from departments
where budget > 60000
order by budget asc, code desc;

update departments
set budget = budget * 0.9
where budget = (select min(budget) from departments);

update employees
set department = (
    select code
    from departments 
    where name = 'IT'
)
where department = (
    select code 
    from departments 
    where name = 'Research'
);

delete from employees
where department = (
    select code
    from departments
    where name = 'IT'
);

delete from employees;
