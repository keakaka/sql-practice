-- insert(book)

insert into author values(null, '스테파니메이어');


insert into book values(null, '트와일라잇', '대여가능', 1);
insert into book values(null, '뉴문', '대여가능', 1);
insert into book values(null, '이클립스', '대여가능', 1);
insert into book values(null, '브레이킹던', '대여가능', 1);


select b.title, a.name, b.status from book b 
join author a on(b.author_no = a.no)
order by b.no;

-- update(book status)
update book set status = '대여가능'
where no = 13;


rename table Book to book;
select * from book;
select * from author;


drop table author;
drop table book;