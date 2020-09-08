drop table board1_tbl;
drop sequence comm1_seq;
create table board1_tbl(
	num number primary key,
	reg_name varchar2(20) not null,
	title varchar2(20) not null,
	content varchar2(20) not null
);

create sequence comm1_seq
start with 1
increment by 2
nocycle;

insert into board1_tbl(num,reg_name,title,content)values(comm1_seq.nextVal,'홍길동','연습','컨텐트');
select * from board1_tbl;