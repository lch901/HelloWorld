drop table member;
drop table product;
drop table product_import;

create table member(
	i_member number primary key,
	id varchar(30) not null unique,
	pw varchar(30) not null,
	nm varchar(100),
	tel varchar(20),
	email varchar(100),
	addr varchar(100),
	sex varchar(3)
--	r_date date default sysdate
);

insert into member(i_member,id,pw,nm,tel,email,addr,sex)values(2,'1','asd','dsa','as','a','a','a');
insert into member(i_member,id,pw,nm,tel,email,addr,sex)values((select count(*)+1 from member),'a','asd','dsa','as','a','a','a');

select * from member where id='1' and email='a';

create table product(
	i_product number primary key,
	nm varchar(30),
	price number default 0,
	pic varchar(255),
	qty number(4) default 0,
	info varchar(255)
);

create table product_import(
	i_pi number primary key,
	i_product number,
	qty number(4),
	i_date date default sysdate,
	foreign key(i_product) references product(i_product)
);

insert into product values(1,'이름',10000,'이미지',0,'정보');
insert into product values(2,'이름',10000,'bag.png',0,'정보');
insert into product_import values();

select * from member;
select * from product;
select * from product_import;