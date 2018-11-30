use dbms;


#### update
delimiter :)
create procedure update_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_sal numeric(10, 5), v_edu varchar(50), v_pos varchar(50))
begin
	update employees join educations on employees.edu_id=educations.edu_id join positions on employees.pos_id = positions.pos_id
    set
    emp_name = v_name,
    emp_address = v_address,
    emp_gender = v_gender,
    emp_dob = v_birthday,
    emp_phone = v_phone,
    sal_lvl = v_sal,
    edu_name = v_edu,
    pos_name = v_pos
    where emp_id = v_id;
end:)
delimiter ;
drop procedure update_emp;
call update_emp('emp0000001','Le Phuc Loc', 'Can Tho', 'M', '1998-11-17','0913245687',2,'thac si','pho giam doc');

######
delimiter :)
create procedure update_test(v_emp_id char(10), v_edu_name varchar(50))
begin
	update employees join educations on employees.edu_id = educations.edu_id
    set
    edu_name = v_edu_name
    where emp_id =v_emp_id;
end:)
delimiter ;
drop procedure update_test;
call update_test('emp0000001', 'thac si');

######
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

######
desc educations;
delimiter :)
create procedure update_edu(v_id char(10), v_name varchar(50), v_major varchar(50),v_evaluation varchar(50))
begin
	update educations set
    edu_name = v_name,
    edu_major = v_major,
    edu_evaluation = v_evaluation
    where edu_id = v_id;
end:)
delimiter ;
drop procedure update_edu;
call update_edu('edu0000017', 'cu nhan', 'CNTT', 'gioi');
select * from educations;

######
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


######
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
select * from accounts;

######
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
call update_sal(1,2000,0.8,0.3);

######
desc time_working;
delimiter :)
create procedure update_tw(v_emp_id char(10), v_pos_id char(10), v_inauguration date)
begin
	update time_working set
    inauguration = v_inauguration
    where emp_id = v_emp_id
    and pos_id =v_pos_id;
end:)
delimiter ;
drop procedure update_tw;
call update_tw('emp0000003','pos0000001', '2018-12-04');
select * from time_working;
