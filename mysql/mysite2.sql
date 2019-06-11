insert into guestbook values(null, '마이콜', '1234', '라면은 구공탄~~~', now());

select no, name, content, date_format(reg_date, '%Y-%m-%d %h:%i:%s') from guestbook order by reg_date desc;

select no, name from user where email = 'keakaka@naver.com' and password = '1234';

select no, name, email, password, gender from user where no = 1;

desc board;

insert into board values(null, ?, ?, ?, ?, now());

select b.no, u.name, b.title, b.content, date_format(b.write_date, '%Y-%m-%d %h:%i:%s') from board b join user u on(b.user_no =  u.no) order by write_date desc;

desc user;

alter table user modify gender enum('female', 'male');

desc board;


-- 초기 Insert 그룹 넘버, 오더넘버, 뎁스 시퀀스. 하드코딩.
-- 답글 달 시 해당 그룹 넘버의 오더넘버 글의 뎁스를 파악해서 
-- 해당 그룹넘버 + 오더넘버(+1) 뎁스 (+1)을 해주면 된다.
-- 단, 기존의 겹치는 오더넘버는 +1을 해줘야 한다.

insert into board values(null, 1, '타이틀', '컨텐츠', now(), 0, 1, 2, 1);

insert into board values(null, 1, '타이틀', '컨텐츠', now(), 0, (select max(group_no)+1 from board b) , 1, 0);

select max(group_no) from board;
select group_no from board;

delete from board where no = 2;
select * from board;
select max(group_no) from board;
update board set order_no = order_no+1 where order_no > 1 and group_no = 1; 
update board set content = '459435jkhsdfkashfsjkdfhgsjdfhgsdf' where no = 1;
select b.no, user_no writerNo, title, content, u.name writer, date_format(write_date, '%Y-%m-%d %H:%i'), hit, group_no, order_no, depth, status from board b join user u on (b.user_no = u.no);
update board set order_no = order_no+1 where order_no > 1 and group_no = 9;

select user_no writerNo, title, content, u.name writer, date_format(write_date, '%Y-%m-%d %H:%i') writeDate, hit, group_no, order_no, depth, status from board b join user u on (b.user_no = u.no) where b.no = 1;

select b.no, user_no writerNo, title, content, u.name writer, date_format(write_date, '%Y-%m-%d %H:%i') writeDate, hit, group_no, order_no, depth, status from board b join user u on (b.user_no = u.no) order by group_no desc, order_no;

update board set title = '타이틀', content = '콘텐츠', write_date = now() where no = 22;

select * from file where board_no = 24;
desc site;
insert into site values(null, 'MySite', '안녕하세요 FEELSITE입니다.', '/images/profile/spring.png', '가나다라마바사아자차카타파하', 'on');

insert into user values(null, 'admin', '1234', 'admin@mysite.com', 'male', 'ADMIN', now());
desc user;
select * from user;
alter table user add column role enum('ADMIN', 'USER') default 'USER' NOT NULL after gender;

select count(no) from board;

select b.no, user_no writerNo, title, content, u.name writer, date_format(write_date, '%Y-%m-%d %H:%i') writeDate, hit, group_no, order_no, depth, status from board b join user u on (b.user_no = u.no) order by group_no desc, order_no limit 0, 3;