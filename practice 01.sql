-- 1
select concat(first_name, ' ', last_name) name from employees where emp_no = 10944;

-- 2
select concat(first_name, ' ', last_name) 이름, gender 성별, hire_date 입사일 from employees order by 2;

-- 3
select 
distinct (select count(*) from employees where gender = 'F') 여직원,
(select count(*) from employees where gender = 'M') 남직원
from employees;

-- 4
select count(emp_no) from salaries where to_date = '9999-01-01';

-- 5
select count(*) from departments;

-- 6
select count(dept_no) from dept_manager where to_date = '9999-01-01';

-- 7
select dept_name from departments order by length(dept_name) desc;

-- 8
select count(*) from salaries where salary > 120000 and to_date = '9999-01-01';

-- 9
select distinct title from titles order by length(title) desc;

-- 10
select count(emp_no) from titles where title = 'Engineer' and to_date = '9999-01-01';

-- 11
select * from titles where emp_no = 13250 order by to_date;