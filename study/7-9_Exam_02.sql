select * from momey_tbl_02;
select * from member_tbl_02;
commit;
rollback;

delete from member_tbl_02 where custno >0;

select 
a.custno,  
b.custname, 
a.total, 
decode(b.grade, 
      'A','VIP', 
      'B','일반', 
      'C','직원') as grade
from( 
select custno,sum(price) as total
from momey_tbl_02 
group by custno) a 
inner join member_tbl_02 b
on a.custno = b.custno 
order by a.total desc;

select custno,sum(price) as total
from momey_tbl_02 
group by custno;

select max(custno) as max_custno 
from member_tbl_02;
      
      
---------------------------------------------------

create table member_tbl_02(
    custno number(6) not null primary key,
    custname varchar2(20),
    phone varchar2(13),
    address varchar2(60),
    joindate date,
    grade char(1),
    city char(2)
);

insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100001,'김행복','000-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100002,'이축복','000-1111-3333','서울 동대문구 휘경2동','20191206','B','01');
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100003,'장믿음','000-1111-4444','울릉군 울릉읍 독도1리','20191001','B','30');
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100004,'최사랑','000-1111-5555','울릉군 울릉읍 독도2리','20191113','A','30');
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100005,'진평화','000-1111-6666','제주도 제주시 외나무골','20191225','B','60');
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values(100006,'차공단','000-1111-7777','제주도 제주시 감나무골','20191211','C','60');
truncate table member_tbl_02;

create table money_tbl_02(
    custno number(6) not null,
    salenol number(8) not null,
    pcost number(8),
    amount number(4),
    price number(8),
    pcode varchar2(4),
    sdate date,
    primary key(custno,salenol)
);

insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100001,20160001,500,5,2500,'A001','20160101');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100001,20160002,1000,4,4000,'A002','20160101');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100001,20160003,500,3,1500,'A008','20160101');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100002,20160004,2000,1,2000,'A004','20160102');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100002,20160005,500,1,500,'A001','20160103');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100003,20160006,1500,2,3000,'A003','20160103');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100004,20160007,500,2,1000,'A001','20160104');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100004,20160008,300,1,300,'A005','20160104');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100004,20160009,600,1,600,'A006','20160104');
insert into money_tbl_02(custno,salenol,pcost,amount,price,pcode,sdate)
values(100004,20160010,3000,1,3000,'A007','20160106');

select nvl(max(custno)+1,0)as n from member_tbl_02;
select custno+1,TO_CHAR(SYSDATE,'YYYY-MM-DD') as d from member_tbl_02;
select custno+1,(select sysdate from dual) as e from member_tbl_02;
select * from member_tbl_02;
insert into member_tbl_02(custno,custname,phone,address,joindate,grade,city)
values((select nvl(max(custno)+1,0)as n from member_tbl_02),'차공단','000-1111-7777','제주도 제주시 감나무골','20191211','C','60');
select 
custno,
custname,
phone,
address,
joindate,
decode(grade, --그냥 암기
      'A','VIP', 
      'B','일반', 
      'C','직원') as grade,
city 
from member_tbl_02;--DB로 만들기 힘듬.
select decode(grade,
            'A','VIP',
            'B','일반',
            'C','직원'
) as grade
from member_tbl_02 where custno = 100001;
--select decode(grade,'A','VIP','B','일반','C','직원') as grade from member_tbl_02 where custno = 100001; --왠만하면 DB말고 자바로 만들자
select 
custno,
sum(price) as total 
from money_tbl_02
group by custno
order by total desc;

select
a.custno,
a.custname,
a.grade,
b.total
from member_tbl_02 a
inner join 
(select 
custno,
sum(price) as total 
from money_tbl_02
group by custno
order by total desc) b
on a.custno = b.custno;
select custno,custname,phone,address,to_char(joindate,'YYYY"년"MM"월"DD"일"'),grade,city from member_tbl_02 where custno=100001;
update member_tbl_02 set custno=11233,custname='a',phone='a',address='a',joindate='11111221',grade='a',city='a' where custno=99999; 

commit;
select * from member_tbl_02;
select * from money_tbl_02;

