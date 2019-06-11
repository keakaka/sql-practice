desc orders_book;


select c.name, b.title, b.price, b.status
from book b join category c on(b.cate_no = c.no);

select b.title, count, (b.price * c.count) cart_price from cart c join book b on (c.book_no = b.no)
where c.member_no = 1;

select c.count, c.book_no, b.price from cart c join book b on(c.book_no = b.no) where c.no = 1;
insert into member values(null, 'user01', 'pwd01', 'name01', 'email01', 'phone01', 1);

insert into orders values(null, 1, '강남', 35000, now(), '123');

select * from orders;

select price from book where no = 1;

select concat(date_format(now(), '%Y%m%d'), '-', LPAD(1, 5, 0));

select * from orders o join orders_book ob on(o.no = orders_book.order_no);

select RPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0');

insert into orders_book values(null, 1, 2, 1, concat(date_format(now(), '%Y%m%d'), '-', (select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0'))));
select * from orders_book;
(select count(*) from orders where date(pay_date) = date(now()));



select concat(date_format(now(), '%Y%m%d'), '-', LPAD( ( select count(*) from orders where date(pay_date) = date(now()) ), 5, '0') );
select count(*) from orders where date(pay_date) = date(now());


select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0');

select count(*) from orders where date(pay_date) = date(now());

insert into orders_book values(null, ?, ?, ?, concat(date_format(now(), '%Y%m%d'), '-', (select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0'))));
select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0');

select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0');

insert into orders values(null, 1, '강남', 35000, now(), concat(date_format(now(), '%Y%m%d'), '-', (select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0'))));

desc orders_book;

select b.title, ob.count from orders_book ob join book b on (ob.book_no = b.no) where orders_no = 2;

select LPAD((select count(*) from orders where date(pay_date) = date(now())), 5, '0');

select no, pay_no, pay_price, pay_date, deli_add from orders where member_no = 1;

insert into orders values(null, ?, ?, ?, now(), concat(date_format(now(), '%Y%m%d'), '-', LPAD(1, 5, '0')));


select no from orders where member_no = 1 and pay_no = '20190510-00005';

select b.title, ob.count from orders_book ob join book b on (ob.book_no = b.no) where orders_no = 5;