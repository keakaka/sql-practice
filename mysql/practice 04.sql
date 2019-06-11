-- 1
select count(*) 
from salaries s
where s.to_date = '9999-01-01'
and salary > (select avg(salary) from salaries where to_date = '9999-01-01');

-- 2
select e.emp_no, concat(e.first_name, ' ' , e.last_name) name, d.dept_name, s.salary
from employees e
join dept_emp de on (e.emp_no = de.emp_no)
join departments d on(de.dept_no = d.dept_no)
join salaries s on (e.emp_no = s.emp_no)
where de.to_date > now()
and s.to_date > now()
and (de.dept_no, s.salary) in
 (select de.dept_no, max(s2.salary) 
  from salaries s2 
  join dept_emp de on(s2.emp_no = de.emp_no)
  where s2.to_date > now()
  group by de.dept_no)
order by s.salary desc;

-- 3
select de2.dept_no, e.emp_no, e.first_name, s2.salary from
			(select de.dept_no, avg(s.salary) avg_salary
			from dept_emp de 
			join salaries s on(de.emp_no = s.emp_no)
			where de.to_date > now()
			and s.to_date > now()
			group by de.dept_no) a
join dept_emp de2 on (a.dept_no = de2.dept_no)
join employees e on (de2.emp_no = e.emp_no)
join salaries s2 on (e.emp_no = s2.emp_no)
where s2.salary > a.avg_salary
and s2.to_date > now()
and de2.to_date > now();

-- 4
select e.emp_no, concat(e.first_name, ' ', e.last_name) emp_name, 
(select concat(e2.first_name, ' ', e2.last_name) from employees e2 where dm.emp_no = e2.emp_no) man_name, d.dept_name
from employees e
join dept_emp de on (e.emp_no = de.emp_no)
join dept_manager dm on (de.dept_no = dm.dept_no)
join departments d on (de.dept_no = d.dept_no)
and dm.to_date > now()
and de.to_date > now();


-- 5
select e.emp_no, concat(e.first_name, ' ', e.last_name) emp_name, t.title, s.salary
from employees e
join titles t on (e.emp_no = t.emp_no)
join salaries s on (e.emp_no = s.emp_no)
join dept_emp de on (e.emp_no = de.emp_no)
where de.dept_no = (select dept_no
					from dept_emp de join salaries s on (de.emp_no = s.emp_no)
					group by de.dept_no
					order by avg(s.salary) desc
					limit 1)
and t.to_date > now()
and s.to_date > now()
and de.to_date > now();

-- 6
select dept_no
from dept_emp de join salaries s on (de.emp_no = s.emp_no)
where de.to_date > now()
and s.to_date > now()
group by de.dept_no
order by avg(s.salary) desc
limit 1;

-- 7
select title
from titles t join salaries s on (t.emp_no = s.emp_no)
where t.to_date > now()
and s.to_date > now()
group by t.title
order by avg(s.salary) desc
limit 1;

-- 8
select 
	d.dept_name, 
    concat(e.first_name, ' ', e.last_name) emp_name, s.salary,
	(select concat(e2.first_name, ' ', e2.last_name) 
	from employees e2 where dm.emp_no = e2.emp_no) man_name,
    (select s2.salary from salaries s2 where emp_no = dm.emp_no and s2.to_date > now()) man_sal
from employees e
join dept_emp de on (e.emp_no = de.emp_no)
join dept_manager dm on (de.dept_no = dm.dept_no)
join departments d on (de.dept_no = d.dept_no)
join salaries s on (e.emp_no = s.emp_no)
and dm.to_date > now()
and de.to_date > now()
and s.to_date > now()
and s.salary > (select s2.salary from salaries s2 where emp_no = dm.emp_no and s2.to_date > now());
