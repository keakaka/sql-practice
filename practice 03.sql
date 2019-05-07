-- 1 
select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름, s.salary 연봉
from employees e 
join salaries s on(e.emp_no = s.emp_no) 
where s.to_date = '9999-01-01'
order by s.salary;

-- 2
select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름, t.title 직책
from employees e
join titles t on (e.emp_no = t.emp_no)
where t.to_date = '9999-01-01'
order by 이름;

-- 3
select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름, d.dept_name 부서명
from employees e
join dept_emp de on (e.emp_no = de.emp_no)
join departments d on (de.dept_no = d.dept_no)
where de.to_date = '9999-01-01'
order by 이름;

-- 4
select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름, s.salary 연봉, t.title 직책, d.dept_name 부서명
from employees e
join salaries s on (e.emp_no = s.emp_no)
join titles t on (e.emp_no = t.emp_no)
join dept_emp de on (e.emp_no = de.emp_no)
join departments d on (de.dept_no = d.dept_no)
where s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
and de.to_date = '9999-01-01'
order by 이름;

-- 5
select e.emp_no 사번, concat(e.first_name, ' ', e.last_name) 이름
from employees e
join titles t on (e.emp_no = t.emp_no)
where t.title = "Technique Leader"
and t.to_date not like '%9999-01-01%';

-- 6
select concat(e.first_name, ' ', e.last_name) 이름, d.dept_name 부서명, t.title 직책
from employees e
join dept_emp de on(e.emp_no = de.emp_no)
join departments d on (de.dept_no = d.dept_no)
join titles t on(e.emp_no = t.emp_no)
where e.last_name like 'S%';

-- 7
select concat(e.first_name, ' ', e.last_name) 이름, s.salary 연봉
from employees e
join salaries s on(e.emp_no = s.emp_no)
where s.to_date = '9999-01-01'
and s.salary > 40000
order by 연봉 desc;

-- 8
select t.title 직책, s.salary 연봉
from titles t
join salaries s on(t.emp_no = s.emp_no)
where s.salary > 50000
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01'
order by 연봉 desc;

-- 9
select d.dept_name 부서명, avg(s.salary) '부서별 평균연봉'
from salaries s
join dept_emp de on(s.emp_no = de.emp_no)
join departments d on(de.dept_no = d.dept_no)
where de.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by d.dept_name
order by avg(s.salary) desc;

-- 10
select t.title 직책, avg(s.salary) '직책별 평균연봉'
from salaries s
join titles t on(s.emp_no = t.emp_no)
where t.to_date = '9999-01-01'
and s.to_date = '9999-01-01'
group by t.title
order by avg(s.salary) desc;
