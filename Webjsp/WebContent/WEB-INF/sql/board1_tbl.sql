drop table board1_tbl cascade constraints;
create table board1_tbl(
     num 		number  not null,
     reg_name 	varchar2(20)  not null,
     title      varchar2(40) not null,
     content 	varchar2(4000) not null,
     file_name1 	varchar2(50),
     hit_cnt 	number   default 0,
     doc_group  number,
     doc_pos 	number,
     doc_step	number,
     ip_num		varchar2(16)	not null,
     reg_date 	varchar2(10)  	not null,
     state		varchar2(2)		not null,
     constraint board1_tbl_pk primary key(num) 
);

--alter table board1_tbl modify(file_name1 varchar2(50));

create sequence comm1_seq
start with 1
increment by 1 
nocycle;

insert into board1_tbl(num,reg_name,title,content,ip_num,reg_date,state) 
  values(comm1_seq.nextval ,'홍길동','연습','연습연습','0','0','0');

 select * from board1_tbl;


