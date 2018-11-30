use dbms;
#-------1
desc educations;
desc employees;
delimiter :)
create procedure add_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_dept_id char(10), v_pos_id char(10), v_edu_id char(10), v_sal_lvl numeric(10, 5))
begin

	insert into employees(emp_id, emp_name, emp_address, emp_gender, emp_dob, emp_phone, dept_id, pos_id, edu_id, sal_lvl)
    values				(v_id	, v_name	, v_address,v_gender	,v_birthday, v_phone, v_dept_id, v_pos_id, v_edu_id, v_sal);
end:)

delimiter ;

drop procedure add_emp;
call add_emp('emp0000002','Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321,'dept000002', 'pos0000001', 'edu0000001', 2);
desc employees;

select * from educations;
#-------2
delimiter :)
create procedure add_dept(v_id char(10), v_name varchar(30), v_address varchar(50),
 v_phone numeric(11,0))
begin
	insert into departments(dept_id, dept_name, dept_address, dept_phone)
    values(v_id, v_name, v_address,v_phone);
end:)
delimiter ;

call add_dept('dept000001','Pham Hoang Hao', 'Can Tho', 0987654321);
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