use dbms;
#delete

###### delete accounts
delimiter :)
create procedure delete_acc(v_name varchar(60))
begin
	delete from accounts where acc_name = v_name;
end :)
delimiter ;

#### delete departments
desc departments;
delimiter :)
create procedure delete_dept(v_id char(10))
begin
	delete from departments where dept_id = v_id;
end :)
delimiter ;

#### delete education educations
desc educations;
delimiter :)
create procedure delete_edu(v_id char(10))
begin
	delete from educations where edu_id = v_id;
end :)
delimiter ;

#### delete employees
desc employees;
delimiter :)
create procedure delete_emp(v_id char(10))
begin
	delete from employees where emp_id = v_id;
end :)
delimiter ;

#### delete positions
desc positions;
delimiter :)
create procedure delete_pos(v_id char(10))
begin
	delete from positions where pos_id = v_id;
end :)
delimiter ;

#### delete salary
desc salary;
delimiter :)
create procedure delete_sal(v_lvl decimal(10,5))
begin
	delete from salary where sal_lvl = v_lvl;
end :)
delimiter ;
drop procedure delete_sal;

#### delete time_working
desc positionstime_working;
delimiter :)
create procedure delete_tw(v_emp_id char(10), v_pos_id char(10))
begin
	delete from time_working where pos_id = v_id and emp_id = v_emp_id;
end :)
delimiter ;
drop procedure delete_tw;
