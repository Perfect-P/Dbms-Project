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
insert into positions values ('pos0000002', 'nhan vien');

desc educations;
insert into educations values ('edu0000004', 'Cu nhan', 'quan ly nhan su','xuat sac');

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

#-------1
delimiter :)
create procedure add_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_sal numeric(10, 5),v_edu char(10))
begin
	insert into employees(emp_id, emp_name, emp_address, emp_gender, emp_dob, emp_phone, sal_lvl,edu_id)
    values(v_id, v_name, v_address,v_gender,v_birthday,v_phone, v_sal, v_edu);
end:)

delimiter ;

drop procedure add_emp;
call add_emp('emp0000006','Perfect', 'Can Tho', 'M', '1998-7-6', 0987654321, 2,'edu0000001');
desc employees;


#-------2
delimiter :)
create procedure add_dept(v_id char(10), v_name varchar(30), v_address varchar(50),
 v_phone numeric(11,0))
begin
	insert into departments(dept_id, dept_name, dept_address, dept_phone)
    values(v_id, v_name, v_address,v_phone);
end:)
delimiter ;

call add_dept('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc departments;

#-------3
delimiter :)
create procedure add_edu(v_id char(10), v_name varchar(50), v_major varchar(50))
begin
	insert into educations(edu_id, edu_name, edu_major)
    values(v_id, v_name, v_major);
end:)
delimiter ;

call add_edu('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc educations;

#-------4
delimiter :)
create procedure add_pos(v_id char(10), v_name varchar(50))
begin
	insert into positions(pos_id, pos_name)
    values(v_id, v_name);
end:)
delimiter ;

call add_pos('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc positions;

#-------5
delimiter :)
create procedure add_sal(v_lvl decimal(10,5),v_basic decimal(20,5),v_factor decimal(10,5), v_exfac decimal(10,5))
begin
	insert into salary(sal_lvl, sal_basic, sal_factor, sal_exfac)
    values(v_lvl, v_basic, v_factor, v_exfac);
end:)
delimiter ;

call add_sal('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc salary;

#-------6
delimiter :)
create procedure add_tw(v_emp_id char(10),v_pos_id char(10),v_inauguration date)
begin
	insert into time_working(emp_id, pos_id, inauguration)
    values(v_emp_id, v_pos_id, v_inauguration);
end:)
delimiter ;

call add_tw('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc time_working;

#-------7
delimiter :)
create procedure add_acc(v_name varchar(60),v_password varchar(60))
begin
	insert into accounts(acc_name, acc_password)
    values(v_name, v_password);
end:)
delimiter ;

call add_sal('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc accounts;

<<<<<<< HEAD
delimiter ;
call add_emp('emp0000002','Pham Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321, 'phamhoanghao');
desc employees;
=======
>>>>>>> 1d4166df86eb8411441162b3bd389a6c7974eceb

#### update
delimiter :)
create procedure update_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_accname varchar(60), v_sal numeric(10, 5))
begin
	update employees set
    emp_name = v_name,
    emp_address = v_address,
    emp_gender = v_gender,
    emp_dob = v_birthday,
    emp_phone = v_phone,
	acc_name = v_accname,
    sal_lvl = v_sal
    where emp_id = v_id;
end:)
delimiter ;

drop procedure update_emp;
call update_emp('emp0000001','Le Phuc Loc', 'Can Tho', 'M', '1998-11-17','0909090909','lploc');


#### DEPARTMENTS 2
delimiter :)
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



#----------delete
#### ACCOUNTS 1
desc accounts;
delimiter :)
create procedure delete_acc(v_name varchar(60))
begin
	delete from accounts where acc_name = v_name;
end :)
delimiter ;

#### departments 2
desc departments;
delimiter :)
create procedure delete_dept(v_id char(10))
begin
	delete from departments where dept_id = v_id;
end :)
delimiter ;

#### educations 3
desc educations;
delimiter :)
create procedure delete_edu(v_id char(10))
begin
	delete from educations where edu_id = v_id;
end :)
delimiter ;

#### employees 4
desc employees;
delimiter :)
create procedure delete_emp(v_id char(10))
begin
	delete from employees where emp_id = v_id;
end :)
delimiter ;

#### positions 5
desc positions;
delimiter :)
create procedure delete_pos(v_id char(10))
begin
	delete from positions where pos_id = v_id;
end :)
delimiter ;

#### salary 6
desc salary;
delimiter :)
create procedure delete_sal(v_lvl decimal(10,5))
begin
	delete from salary where sal_lvl = v_lvl;
end :)
delimiter ;
drop procedure delete_sal;

#### time_working
desc positionstime_working;
delimiter :)
create procedure delete_tw(v_emp_id char(10), v_pos_id char(10))
begin
	delete from time_working where pos_id = v_id and emp_id = v_emp_id;
end :)
delimiter ;
drop procedure delete_tw;

