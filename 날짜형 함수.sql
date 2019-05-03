select curdate(), current_date;
select curtime(), current_time;
select now(), sysdate(), current_timestamp;

select now(), sleep(2), now();

select sysdate(), sleep(2), sysdate();

select date_format(now(), '%Y-%m-%d %H:%i:%s');

SELECT concat(first_name, ' ', last_name) AS name,               
       PERIOD_DIFF( DATE_FORMAT(CURDATE(), '%Y%m'),  
                    DATE_FORMAT(hire_date, '%Y%m') )
  FROM employees;

select first_name, hire_date, date_add(hire_date, interval 6 month)
  from employees;
  
  select cast(now() as date), now();
  
  select cast(cast(1-2 as unsigned) as signed);
  
  
  
  