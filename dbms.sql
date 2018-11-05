create database dbms;
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
insert into departments values ('dept000001', 'phong phat trien ung dung', 'ha noi', '01299838481');

desc positions;
insert into positions values ('pos0000001', 'giam doc');

desc educations;
insert into educations values ('edu0000001', 'giao su', 'CNTT');

desc salary;
insert into salary values (1, 1000, 2, 10);

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

delimiter :)
create procedure add_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_accname varchar(60))
begin
	insert into employees(emp_id, emp_name, emp_address, emp_gender, emp_dob, emp_phone,acc_name)
    values(v_id, v_name, v_address,v_gender,v_birthday,v_phone,v_accname);
end:)
delimiter ;




call add_emp('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc employees;

#=======================================================================
delimiter :)
create procedure namesa()
as
begin
end :)
delimiter ;
#========================================================================

#-------UPDATE-----------
#### EMPLOYEES 1
delimiter :)
create procedure update_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_accname varchar(60))
begin
	update employees set
    emp_name = v_name,
    emp_address = v_address,
    emp_gender = v_gender,
    emp_dob = v_birthday,
    emp_phone = v_phone,
	acc_name = v_accname
    where emp_id = v_id;
end:)
delimiter ;

drop procedure update_emp;
select * from employees;
call update_emp('emp0000002','Pham Hoang Hao', 'Can Tho', 'F', '1998-7-6', 0987654321, 'phamhoanghao');

#### DEPARTMENTS 2
delimiter :)
desc departments;
create procedure update_dept(v_id char(10), v_name varchar(30), v_address varchar(50), v_phone numeric(11,0))
begin
	update departments set
    dept_name = v_name,
    dept_address = v_address,
    dept_phone = v_phone
    where dept_id = v_id;
end:)
delimiter ;

drop procedure update_dept;
call update_dept('dept000001', 'phong pha hoai ung dung', 'ha noi', '01299838481');
select * from departments;

#### EDUCATIONS 3
desc educations;
delimiter :)
create procedure update_edu(v_id char(10), v_name varchar(50), v_major varchar(50))
begin
	update educations set
    edu_name = v_name,
    edu_major = v_major
    where edu_id = v_id;
end:)
delimiter ;

drop procedure update_edu;
call update_edu('edu0000001', 'tien si', 'CNTT');
select * from educations;

#### POSITIONS 4
desc positions;
delimiter :)
create procedure update_pos(v_id char(10), v_name varchar(50))
begin
	update positions set
    pos_name = v_name
    where pos_id = v_id;
end:)
delimiter ;

drop procedure update_pos;
call update_pos('pos0000001', 'lao cong');
select * from positions;

#### POSITIONS 5
desc accounts;
delimiter :)
create procedure update_acc(v_name char(60), v_password varchar(60))
begin
	update accounts set
    acc_password = v_password
    where acc_name = v_name;
end:)
delimiter ;

drop procedure update_acc;
call update_acc('pos0000001', 'lao cong');
select * from accounts;

#### POSITIONS 6
desc salary;
delimiter :)
create procedure update_sal(v_lvl decimal(10,5), v_basic decimal(20,5), v_factor decimal(10,5), v_exfac decimal(10,5))
begin
	update salary set
    sal_basic = v_basic,
    sal_factor = v_factor,
    sal_exfac = v_exfac
    where sal_lvl = v_lvl;
end:)
delimiter ;

drop procedure update_sal;
call update_sal('pos0000001', 'lao cong');
select * from accounts;

#### POSITIONS 7
desc time_working;
delimiter :)
create procedure update_tw(v_emp_id char(10), v_pos_id char(10), v_inauguration date)
begin
	update time_working set
	pos_id = v_pos_id,
    inauguration = v_inauguration
    where emp_id = v_emp_id;
end:)
delimiter ;

drop procedure update_tw;
call update_tw('pos0000001', 'lao cong');
select * from accounts;















