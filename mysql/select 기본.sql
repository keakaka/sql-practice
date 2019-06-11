-- select 기본
select * from departments;

select concat(first_name, ' ', last_name) full_name from employees where emp_no = 10944;

select concat(first_name, ' ', last_name) 이름, gender 성별, hire_date 입사일 from employees order by 2;

select 
distinct (select count(*) from employees where gender = 'F') 여직원,
(select count(*) from employees where gender = 'M') 남직원
from employees;

select count(distinct emp_no) from salaries;

select first_name from employees;

select count(*) from departments;

select emp_no, salary from salaries where from_date like '2001%' order by 2 desc;

select emp_no, dept_no from dept_emp where dept_no in ('d005', 'd009');