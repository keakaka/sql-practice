-- ���� SQL 

  select emp_no, avg(salary)
    from salaries
   where to_char(from_date, 'yyyy') = '1985' 
group by emp_no
  having avg(salary) > 1000;
  
 
-- ����1 : �� ������� ��տ��� ���
   select emp_no, avg(salary)
     from salaries
 group by emp_no
 order by avg(salary) desc;

-- ���� 3:  ���(��) �� ���� ��å ������ �־����� ��ȸ 
   select emp_no, count(title)
     from titles
 group by emp_no; 
 
-- ����4 : �� ������� ��տ��� ����ϵ� 50,000�� �̻��� ������ ���
   select emp_no, avg(salary)
     from salaries
 group by emp_no
   having avg(salary) > 50000;
   
-- ����5: (����) ��å���� (��տ���)�� �ο����� ���ϵ� ��å���� �ο��� 
--       100�� �̻��� ��å�� ����ϼ���.
   select title, count(emp_no)
     from titles
    where to_date = '9999-01-01' 
 group by title
   having count(emp_no) >= 100;  
  