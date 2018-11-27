use dbms;

delimiter :)
create function show_sal(v_emp_id char(10)) 
returns numeric(10,5)
begin
	declare
	sal_sum numeric(10,5);
	select sum(sal_factor*sal_basic+sal_basic*sal_exfac) as sum_salary into sal_sum
	from salary join employees on salary.sal_lvl = employees.sal_lvl
	where employees.emp_id= v_emp_id;
    return sal_sum;
end :)
delimiter ;

drop function show_sal;
select show_sal('emp0000001') as sum_salary;


delimiter :)
create procedure show_edu(v_emp_id char(10))
begin
	select edu_name from employees join educations on employees.edu_id = educations.edu_id
    where emp_id =v_emp_id;
end :)
delimiter ;

drop procedure show_edu;
call show_edu('emp0000001');


delimiter :)
create procedure show_pos(v_emp_id char(10))
begin
	select pos_name from employees join positions on employees.pos_id = positions.pos_id
    where emp_id =v_emp_id;
end :)

delimiter ;
drop procedure show_pos;
call show_pos('emp0000001');

delimiter :)
create procedure show_timeWorking()
begin
	SELECT emp_name,pos_name,inauguration
    from 
    employees join time_working on employees.emp_id = time_working.emp_id 
    join positions on time_working.pos_id = positions.pos_id;
end:)
delimiter ;
drop procedure show_timeWorking;
call show_timeWorking();

delimiter :)
create procedure add_emp(v_id char(10), v_name varchar(50), v_address varchar(100),v_gender char(1),
 v_birthday date, v_phone numeric(11,0), v_sal numeric(10, 5),v_edu char(10), v_pos char(10))
begin
	insert into employees(emp_id, emp_name, emp_address, emp_gender, emp_dob, emp_phone, sal_lvl,edu_id,pos_id)
    values(v_id, v_name, v_address,v_gender,v_birthday,v_phone, v_sal, v_edu,v_pos);
end:)

delimiter ;

drop procedure add_emp;
call add_emp('emp0000008','Haro', 'Can Tho', 'M', '1998-7-6', 0987654321, 2,'edu0000001','pos0000001');
select * from positions;
