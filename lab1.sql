create database lab1;

create table users(
id serial,
firstname varchar(50),
lastname varchar(50)
)

alter table users
add column isadmin int;

alter table users
alter column isadmin set data type boolean
using 
case isadmin when 1 then true else false end;

alter table users 
alter column isadmin set default false;

alter table users
add constraint pk_id primary key(id);

create table tasks(
id serial,
name varchar(50),
user_id int
);

drop table users;

drop database lab1;


