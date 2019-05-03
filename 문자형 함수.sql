select upper('Seoul'), ucase('seoul');

select upper(first_name) from employees;

select lower('SEOUl'), lcase('SEOUL');
select substring('Happy Dat', 3, 2);


select lpad('123456', 15, '-'), rpad('123456', 15, '-' );

select concat('---', ltrim(' hello '), '---'), concat('---', Rtrim(' hello '), '---'), concat('---', trim(' hello '), '---');

select concat('---', trim(both 'x' from 'xxxhelloxxxxx'), '---');