use dbms;
desc employees;



# counting employees
delimiter :)
create function sum_emp() returns numeric
begin
	declare emp_sum numeric(3, 0) default 0;
    select count(emp_id) into emp_sum from employees;
	return emp_sum;
end :)
delimiter ;

drop function if exists sum_emp;
select sum_emp();

select * from employees;

# counting number of date worked in the company

delimiter :)
create function days_worked(v_emp_id char(10)) returns numeric
begin

	declare days_sum numeric(3, 0) default 0;
    
    declare temp char(10) default null;
    select emp_id into temp from time_working where v_emp_id = emp_id ;
    
    if (temp is not null) then
		select curdate()-min(inauguration) into days_sum from time_working where v_emp_id = emp_id;
	end if;
	return days_sum;
end :)
delimiter ;

drop function if exists days_worked;

select days_worked('emp0000001');

select * from time_working;
select from_days((date('2018-11-12')-date('2018-1-1')));


# show salary

delimiter :)
create function show_sal(v_emp_id char(10)) returns numeric
begin
	declare sal_sum numeric(20, 5) default 0;
    declare temp char(10) default null;
    select emp_id into temp from employees where v_emp_id = emp_id ;
    
    if (temp is not null) then
		select sal_factor*sal_basic+sal_basic*sal_exfac into sal_sum
		from salary join employees on salary.sal_lvl = employees.sal_lvl
		where employees.emp_id= v_emp_id;
    end if;
    return sal_sum;
end :)
delimiter ;
drop function if exists show_sal;

select * from employees;

select show_sal('emp0000002') as sum_sal;


# number employees in the department
desc departments;

delimiter :)
create function sum_emp_in_dept(v_dept_id char(10)) returns numeric
begin

	declare emp_sum numeric(20, 5) default 0;
    declare temp char(10) default null;
    select dept_id into temp from departments where v_dept_id = dept_id ;
	if (temp is not null) then
		select count(emp_id) into emp_sum from employees where dept_id = temp;
	end if;
	return emp_sum;
end :)
delimiter ;

drop function if exists sum_emp_in_dept;
select sum_emp_in_dept('dept000001');

# number emp co bang xuat sac






# nhan vien co ngay sinh trong thang nao do de to chuc sinh nhat

