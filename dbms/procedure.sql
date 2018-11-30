# number emp co bang xuat sac
use dbms;
desc educations;

delimiter :)
create procedure emp_edu(v_edu_evaluation varchar(50))
begin
	select * from employees join educations on employees.edu_id = educations.edu_id where edu_evaluation = 'xuat sac';
end :)
delimiter ;

drop procedure if exists emp_edu;

select * from employees;
call emp_edu('xuat sac');
select * from employees join educations on employees.edu_id = educations.edu_id where edu_evaluation = 'xuat sac';

desc departments;

select * from employees;