select avg(salary) '급여 평균', sum(salary) '급여 총합계', emp_no from salaries group by emp_no;

select (select max(salary) from salaries where emp_no = 10060) 최대임금, (select min(salary) from salaries where emp_no = 10060) 최저임금;

select * from salaries;