create database lab2;

create table countries(
    country_id serial primary key,
    country_name varchar(200),
    region_id int,
    population int
);

insert into countries (country_name, region_id, population)
values
('Greece',300, 10000000);

select*from countries
insert into countries (country_id, country_name)
values
(5,'Kazakhstan');

insert into countries (country_name, region_id, population)
values ('USA', NULL, 350000000);

insert into countries (country_name, region_id, population)
values
('China','153', 150000000),
('Iran','450', 19000000),
('India','1000', 16000000);

alter table countries
alter country_name set default 'Russia';

insert into countries (region_id, population)
values
(16736, 1638136);

insert into countries default values;

create table countries_new (like countries including all);

insert into countries_new select * from countries;

update countries
set region_id = 1
where region_id is NULL;

select country_name, population * 1.10 as "New Population"
from countries;

delete from countries
where population < 100000
returning *;

delete from countries_new
where country_id in (select country_id from countries)
returning *;

delete from countries
returning *;
