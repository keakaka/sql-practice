insert into department values(null, '총무팀');
insert into department values(null, '개발팀');
insert into department values(null, '인사팀');
insert into department values(null, '영업팀');

select * from department;

insert into employee values(null, '둘리', 1);
insert into employee values(null, '마이콜', 2);
insert into employee values(null, '또치', 3);
insert into employee values(null, '길동', null);

select * from employee;

-- eq join
select * from employee e join department d on (e.department_no = d.no);

-- non-eq left join
select * from employee e left join department d on(e.department_no = d.no);

-- non-eq right join
select ifnull(e.name, '없음'), d.name from employee e right join department d on(e.department_no = d.no);

-- full join (outer join)  // mysql, maria db 지원 안함.
-- select a.name, b.name from employee a full join department b on a.department_no = b.no;


