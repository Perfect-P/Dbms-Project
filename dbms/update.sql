use dbms;
#### update
desc employees;
delimiter :)
create procedure update_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
<<<<<<< HEAD
 v_birthday date, v_phone numeric(11,0), v_dept_name varchar(30), v_pos_name varchar(50), v_edu_name varchar(50), v_accname varchar(60), v_sal numeric(10, 5))
begin
	declare temp char(10) default null;
	declare v_dept_id varchar(30);
    declare v_pos_id varchar(50);
    declare v_edu_id varchar(50);
    
    select dept_id into v_dept_id from departments where v_dept_name = dept_name;
    select pos_id into v_pos_id from positions where v_pos_id = pos_id;
    select edu_id into v_edu_id from educations where v_edu_id = edu_id;
    
	update employees set

=======
 v_birthday date, v_phone numeric(11,0), v_sal numeric(10, 5), v_edu varchar(50), v_pos varchar(50))
begin
	update employees join educations on employees.edu_id=educations.edu_id join positions on employees.pos_id = positions.pos_id
    set
>>>>>>> 996509492f183f8b7a355eb54752caded985eaa5
    emp_name = v_name,
    emp_address = v_address,
    emp_gender = v_gender,
    emp_dob = v_birthday,
    emp_phone = v_phone,
<<<<<<< HEAD
    dept_id = v_dept_id,
    pos_id = v_pos_id,
    edu_id = v_edu_id,
	acc_name = v_accname,
    sal_lvl = v_sal

=======
    sal_lvl = v_sal,
    edu_name = v_edu,
    pos_name = v_pos
>>>>>>> 996509492f183f8b7a355eb54752caded985eaa5
    where emp_id = v_id;
end:)
delimiter ;

drop procedure update_emp;
<<<<<<< HEAD
call update_emp('emp0000001','Hoang Hao', 'Can Tho', 'M', '1998-7-6', 0987654321,'Pham Hoang Hao', 'lao cong', 'tien si','phamhoanghao', 2);



=======
call update_emp('emp0000001','Le Phuc Loc', 'Can Tho', 'M', '1998-11-17','0913245687',2,'thac si','pho giam doc');


>>>>>>> 996509492f183f8b7a355eb54752caded985eaa5
-- test update join
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
call update_edu('edu0000001', 'cu nhan', 'CNTT');
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
