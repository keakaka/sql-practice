-- 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요. 

-- 1)
select b.dept_no
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date > now()
and concat(a.first_name, ' ', a.last_name) = "Fai Bale";

-- 2)
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date > now()
and b.dept_no = 'd004';

-- subquery
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.to_date > now()
and b.dept_no = 
 (select b.dept_no
  from employees a, dept_emp b
  where a.emp_no = b.emp_no
  and b.to_date > now()
  and concat(a.first_name, ' ', a.last_name) = "Fai Bale");
  
-- 단일행인 경우
-- <, >, =, !=, <=, >=
-- ex1) 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의  이름, 급여를 나타내세요.
select e.first_name, s.salary
from employees e
join salaries s on (e.emp_no = s.emp_no)
where s.salary < (select avg(salary) from salaries where to_date > now())
and s.to_date > now()
order by 2 desc;

-- ex2) 현재 가장적은 평균 급여를 받고 있는 직책에해서  평균 급여를 구하세요 
-- 2-1
select b.title, round(avg(a.salary)) avg_salary
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date > now()
and b.to_date > now()
group by b.title
having avg_salary = (
select min(avg_salary)
from (select round(avg(s2.salary)) avg_salary 
		from salaries s2 join titles t2 on (s2.emp_no = t2.emp_no) 
		where s2.to_date > now()
		and t2.to_date > now()
		group by t2.title) as n);

-- ex2-2) TOP-K
select b.title, avg(a.salary) avg_salary
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date > now()
and b.to_date > now()
group by b.title
order by 2
limit 1;


-- 다중행
-- in(not in)
-- =any() = in 과 동일, >any, >any, <>any = !=all과 동일, <=any, >=any
-- =all, >all, <all, <=all, >=all

-- 예제:현재 급여가 50000 이상인 직원 이름 출력
select emp_no, salary
from salaries
where to_date > now()
and salary > 50000;

select e.first_name, s.salary from employees e join salaries s on(e.emp_no = s.emp_no)
where s.to_date > now()
and (e.emp_no, s.salary) =any
	(select emp_no, salary
	from salaries
	where to_date > now()
	and salary > 50000);
    
select a.first_name, b.salary
from (select emp_no, salary
		from salaries
		where to_date > now()
		and salary > 50000) b
join employees a on (b.emp_no = a.emp_no);

-- 각 부서별 최고 월급을 받는 직원의 이름과 월급을 출력
-- sol1) where 절에 subquery
select e.first_name, de.dept_no, s.salary
from employees e
join salaries s on (e.emp_no = s.emp_no)
join dept_emp de on (e.emp_no = de.emp_no)
where s.to_date > now()
and de.to_date > now()
and (de.dept_no, s.salary) in (select de.dept_no, max(s.salary)
from employees e
join salaries s on (e.emp_no = s.emp_no)
join dept_emp de on (e.emp_no = de.emp_no)
where s.to_date > now()
and de.to_date > now()
group by de.dept_no);

-- sol2) from절에 subquery

select a.first_name, c.dept_no, b.salary
from employees a, salaries b, dept_emp c, (select de.dept_no, max(s.salary) max_salary
										from employees e
										join salaries s on (e.emp_no = s.emp_no)
										join dept_emp de on (e.emp_no = de.emp_no)
										where s.to_date > now()
										and de.to_date > now()
										group by de.dept_no) d
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
and b.to_date > now()
and c.to_date > now()
and b.salary = d.max_salary;


select de.dept_no, max(s.salary)
from employees e
join salaries s on (e.emp_no = s.emp_no)
join dept_emp de on (e.emp_no = de.emp_no)
where s.to_date > now()
and de.to_date > now()
group by de.dept_no;