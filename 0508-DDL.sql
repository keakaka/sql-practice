-- DDL

drop table user;

create table user (
	no int not null auto_increment,
    email varchar(50) not null default '',
    passwd varchar(64) not null,
    name varchar(10),
    dept_name varchar(25),
    join_date datetime not null,
    primary key(no)
);

desc user;

insert into user values (
null, '', password('1234'), '박필', '개발팀', sysdate()
);

insert into user(passwd, name, dept_name) values (
password('1234'), '박필2', '개발팀'
);

select * from user;

alter table member add juminbunho char(13) not null after no;
alter table member drop juminbunho;

alter table member add join_date datetime not null;

alter table member change no no int unsigned not null auto_increment;
alter table member change department_name dept_name varchar(25);
alter table member change name name varchar(10);

alter table member rename user;

update user set join_date = (select now())
where name = "박필2";

update user set join_date = now(), name = 'Feel'
where no = 1;

delete from user where no = 1;