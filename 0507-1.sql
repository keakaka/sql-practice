select emp_no, avg(salary) from salaries join dept_manager dm using(dept_no) where to_date = '9999-01-01' group by emp_no;

select emp_no, avg(salary), max(salary) from salaries group by emp_no order by avg(salary) desc;

select emp_no, title from titles where title = 'Manager';

select emp_no, count(title) from titles group by emp_no;

select emp_no, avg(salary) from salaries group by emp_no having avg(salary) > 50000 order by 2;

-- 예제5: 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요.
select title, avg(salary) from salaries join titles using(emp_no) group by title having count(title) > 100;
select title, count(emp_no) from titles where to_date = '9999-01-01' group by title having count(emp_no) > 100;

-- 예제6: 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.

select c.dept_no, avg(a.salary)
  from salaries a, titles b, dept_emp c
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
   and b.title = 'Engineer'
group by c.dept_no;

select d.dept_no, d.dept_name, avg(salary) 
 from departments d, dept_emp de, salaries s, titles t 
 where d.dept_no = de.dept_no and de.emp_no = s.emp_no and s.emp_no = t.emp_no
 and s.to_date = '9999-01-01' and title = 'Engineer' and t.to_date = '9999-01-01' 
 group by d.dept_name;
-- 예제7: 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요 단, 총합이 2,000,000,000이상인 
-- 		  직책만 나타내며 급여총합에 대해서 내림차순(DESC)로 정렬하세요.

select t.title, sum(salary) from titles t join salaries s on(t.emp_no = s.emp_no) 
and s.to_date = '9999-01-01' and t.to_date = '9999-01-01' 
group by t.title having sum(salary) > 2000000000
order by sum(salary);

-- employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요. 
-- ANSI 표준
select count(*)
 from employees e
 join titles t on (e.emp_no = t.emp_no)
 where e.gender = 'F';
-- Natural Join, using
select count(*)
-- e.first_name, t.title, e.gender
 from employees e
 join titles t using(emp_no)
 where e.gender = 'F';
 
-- 실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를 사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
select e.emp_no, concat(e.first_name, ' ', e.last_name), dept_name
-- e.emp_no, concat(e.first_name, ' ', e.last_name), dept_name
from employees e
join dept_emp de on(e.emp_no = de.emp_no)
join departments d on(de.dept_no = d.dept_no)
where de.to_date = '9999-01-01'
and d.dept_no is null;


-- 실습문제 2:  현재 회사에서 지급되고 있는 급여체계를 반영한 결과를 출력하세요. 
--              사번,  전체이름, 연봉  이런 형태로 출력하세요.    
select e.emp_no, concat(e.first_name, ' ', e.last_name), s.salary
from employees e
join salaries s on(e.emp_no = s.emp_no)
where s.to_date = '9999-01-01';