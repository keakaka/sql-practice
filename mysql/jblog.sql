select count(id) from user where id = id1;

select count(id) from user where id = 'id2';

select count(id) from user where id is not null;

select @@autocommit;

set autocommit=false;

desc blog;
desc category;
select * from user;
select * from blog;
select * from category;
select * from post;
rollback;

select 
	b.id, b.title, b.logo, 
    c.no, c.name, c.comment, c.reg_date, 
    p.no, p.title, p.content, p.reg_date
from blog b 
join category c on(b.id = c.id) 
join post p on(c.no = p.category_no)
where b.id = 'feel'
order by p.reg_date desc limit 1;

select no, title, content, date_format(reg_date, '%Y/%m/%d') regDate from post where category_no = (select category_no from post where no = 9) order by no desc;
select no, title, content, date_format(reg_date, '%Y/%m/%d') regDate from post where category_no = 7 order by no desc;

select b.id blogId, b.title blogTitle, b.logo, c.no, c.name from blog b join category c on(b.id = c.id) where id='user';

select id blogId, title blogTitle, logo from blog where id='user';

select no, name from category where id='user';
update post set category_no = 1 where category_no = ?;
desc post;

insert into post values(null, 'testPost', 'testContent', now(), 1);
insert into post values(null, 'testPost2', 'tasdfasdf ㅁㄴㅇㄻㄴ얼nt', now(), 1);
insert into post values(null, 'orther post', 'tasdfasdf ㅁㄴㅇㄻㄴ얼nt', now(), 6);
commit;
select * from blog;
select * from post;
select no, title, content, reg_date regDate from post where category_no = 1 order by no desc;
update blog set title = 'testtitle', logo = 'logologo' where id = 'user';
rollback;

select count(category_no) from post where category_no = 6;
select no from category where id = 'user' limit 1;

select (select count(category_no) from post where category_no = 1) pCount, name;

select no, name, comment from category where id='user';
select count(category_no) from post where category_no = 1;