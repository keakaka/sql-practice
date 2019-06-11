-- employees ���̺�� titles ���̺��� 
-- join�Ͽ� ������ �̸��� ��å�� ����ϵ� 
-- ���� �����Ͼ ����ϼ���.

select a.first_name, b.title, a.gender
  from employees a, titles b
 where a.emp_no = b.emp_no
   and a.gender = 'F';
  
-- ����6: ���� �μ����� ���� ��å�� 
-- Engineer�� �����鿡 ���ؼ��� 
-- ��ձ޿��� ���ϼ���.
select a.dept_no, a.avg_salary, b.dept_name
  from (  select c.dept_no, avg(a.salary) as "avg_salary"
	from salaries a, titles b, dept_emp c
   where a.emp_no = b.emp_no
     and b.emp_no = c.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
     and b.title = 'Engineer'
group by c.dept_no ) a,
departments b
where a.dept_no = b.dept_no;


-- ����7: ���� ��å���� �޿��� ������ ���ϵ� Engineer��å�� �����ϼ���
--       ��, ������ 2,000,000,000�̻��� ��å�� ��Ÿ���� �޿����տ�
--       ���ؼ� ��������(DESC)�� �����ϼ���.   

  select title, sum(salary)
    from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by title
  having sum(salary) > 2000000000
order by sum(salary) desc;


--
-- ANSI/ISO SQL 1999 join ����
--

-- join ~ on
select count(*)
  from employees a 
  join titles b on a.emp_no = b.emp_no
 where a.gender = 'F';  

-- natural join
select count(*)
  from employees a 
natural join titles b
where a.gender = 'F';

-- join ~ using 
select count(*)
  from employees a 
  join titles b 
  using (emp_no)
 where a.gender = 'F'; 



