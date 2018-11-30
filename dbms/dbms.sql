use dbms;

create table employees (
	emp_id char(10) primary key,
	emp_name varchar(50) not null,
	emp_gender char(1) not null,
	emp_dob date not null,
	emp_address varchar(100),
	emp_phone numeric(11,0),
	dept_id char(10) references departments(dept_id),
	pos_id char(10) references positions(pos_id),
	edu_id char(10) references educations(edu_id),
	sal_lvl numeric(10, 5) references salary(sal_lvl),
	acc_name varchar(60) references accounts(acc_name) 
);

create table departments (
	dept_id char(10) primary key,
	dept_name varchar(30) not null,
	dept_address varchar(50) not null,
	dept_phone numeric(11,0)
);

create table positions(
	pos_id char(10) primary key,
	pos_name varchar(50) not null
);

create table educations(
	edu_id char(10) primary key,
	edu_name varchar(50) not null,
	edu_major varchar(50) not null,
	edu_evaluation varchar(50) not null
);

create table salary(
	sal_lvl numeric(10, 5) primary key,
	sal_basic numeric(20, 5) not null,
	sal_factor numeric(10, 5) not null,
	sal_exfac numeric(10, 5) not null
);

create table time_working(
	emp_id char(10) references employees(emp_id),
	pos_id char(10) references positions(pos_id),
	inauguration date not null,
	primary key(emp_id, pos_id)
);

create table accounts(
	user_name varchar(60) primary key,
	user_password varchar(60) not null
);

show tables;

select * from employees ;
select * from departments;
select * from positions;
select * from educations;
select * from salary;
select * from time_working;
select * from accounts;

drop table employees;
drop table departments;
drop table positions;
drop table educations;
drop table salary;
drop table time_working;
drop table accounts;

desc employees;
#insert emloyees

insert into employees values (	'emp0000019',
								'Hoang Hao', 
								'M',
								'1998-10-12',
								'Soc Trang',
								0729312488,
								'dept000001',
								'pos0000001', 
								'edu0000001',
								2);
desc departments;
insert into departments values ('dept000008', 'phong cham soc khach hang', 'ha noi', '0555884831');

desc positions;
<<<<<<< HEAD
insert into positions values ('pos0000008', 'truong phong ke toan');
=======
insert into positions values ('pos0000001', 'nhan vien');
>>>>>>> 7c2aced2217daa26754383083611bdcd89577e93

desc educations;
insert into educations values ('edu0000007', 'thac si', 'quan tri kinh doanh','xuat sac');

desc salary;
insert into salary values (10, 4900, 2.0, 1.5);

desc time_working;
insert into time_working values ('emp0000001', 'pos0000001', now());

desc accounts;
<<<<<<< HEAD
insert into accounts values ( 'admin', '123');

desc salary;
=======
insert into accounts values ( 'lephucloc', 'locratladeptrai');

SELECT emp_name,pos_name,inauguration from employees join time_working on employees.emp_id=time_working.emp_id join positions on time_working.pos_id=positions.pos_id;

desc salary;

select * from time_working;

>>>>>>> 7c2aced2217daa26754383083611bdcd89577e93


