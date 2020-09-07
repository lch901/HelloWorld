drop table member;

create table member(
	m_num number primary key,
	id varchar(30) not null,
	pw varchar(30) not null,
	nm varchar(100),
	tel varchar(20),
	email varchar(100),
	addr varchar(100),
	sex varchar(3)
--	r_date date default sysdate
);

insert into member(m_num,id,pw,nm,tel,email,addr,sex)values(2,'1','asd','dsa','as','a','a','a');
insert into member(m_num,id,pw,nm,tel,email,addr,sex)values((select count(*)+1 from member),'a','asd','dsa','as','a','a','a');

select * from member;