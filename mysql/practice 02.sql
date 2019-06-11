-- 1
select max(salary) 최고임금, min(salary) 최저임금, max(salary)-min(salary) '최고임금 - 최저임금'  from salaries;

-- 2
select date_format(hire_date, '%Y년 %m월 %d일') '신입사원 입사일' from employees order by 1 desc limit 1;

-- 3
select date_format(hire_date, '%Y년 %m월 %d일') '최고 근속직원 입사일' from employees order by 1 limit 1;

-- 4
select avg(salary) '회사 평균연봉' from salaries;

-- 5
select max(salary) '회사 내 최고연봉', min(salary) '회사 내 최저연봉' from salaries;

-- 6
select max(year(curdate())-year(birth_date)) 최연장자, min(year(curdate())-year(birth_date)) 연소자 from employees;