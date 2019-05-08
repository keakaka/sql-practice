select emp_no, first_name, last_name, hire_date
from employees
where first_name like '%a%'
or last_name like '%a%';

desc employees;