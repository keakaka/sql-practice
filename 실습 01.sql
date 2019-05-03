-- 1
select concat(first_name, ' ', last_name) full_name from employees where emp_no = 10944;

-- 2
select concat(first_name, ' ', last_name) 이름, gender 성별, hire_date 입사일 from employees order by 2;

-- 3
select 
distinct (select count(*) from employees where gender = 'F') 여직원,
(select count(*) from employees where gender = 'M') 남직원
from employees;

-- 4
select count(distinct emp_no) from salaries;

-- 5
select count(*) from departments;

-- 6
select count(distinct dept_no) from dept_manager;

-- 7
select dept_name from departments order by length(dept_name) desc;

-- 8
select count(*) from salaries where salary > 120000;

-- 9
select distinct title from titles order by length(title) desc;

-- 10
select count(emp_no) from titles where title = 'Engineer';

-- 11
select * from titles where emp_no = 13250 order by to_date;