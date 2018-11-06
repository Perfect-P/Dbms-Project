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
	edu_major varchar(50) not null
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
	acc_name varchar(60) primary key,
	acc_password varchar(60) not null
);

show tables;

select * from employees;
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
insert into employees values (	'emp0000001',
								'Le Phuc Loc', 
								'M',
								'1998-2-27',
								'123 sao hoa. tp newyork',
								01219932424,
								'dept000001',
								'pos0000001', 
								'edu0000001',
								1,
								'lephucloc');
                                
insert into employees values (	'emp0000002',
								'Pham Hoang Hao', 
								'M',
								'1998-7-6',
								'Can Tho',
								0998989788,
								'dept000001',
								'pos0000001', 
								'edu0000001',
								1,
								'phamhoanghao');

desc departments;
insert into departments values ('dept000002', 'phong y tuong', 'ha noi', '0555884831');

desc positions;
insert into positions values ('pos0000001', 'giam doc');

desc educations;
insert into educations values ('edu0000001', 'giao su', 'CNTT');

desc salary;
insert into salary values (2, 1500, 2.5, 1.5);

desc time_working;
insert into time_working values ('emp0000001', 'pos0000001', now());

desc accounts;
insert into accounts values ( 'lephucloc', 'locratladeptrai');

desc salary;

delimiter :)
create procedure show_sal(v_emp_id char(10)) 
begin
	select sum(sal_factor*sal_basic+sal_basic*sal_exfac) as sal_sum
	from salary join employees on salary.sal_lvl = employees.sal_lvl
	where employees.emp_id= v_emp_id;
end :)
delimiter ;
drop procedure add_emp;

call show_sal('emp0000001');

##### add



call add_sal('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc accounts;


delimiter ;
call add_emp('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc employees;
=======






