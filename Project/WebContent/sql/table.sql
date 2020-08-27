drop table admin;
drop table member;
drop table product;
create table admin(
	a_num number primary key,
	id nvarchar2(30) not null,
	pw nvarchar2(30) not null,
	nm nvarchar2(100)
);

create table member(
	m_num number primary key,
	id nvarchar2(30) not null,
	pw nvarchar2(30) not null,
	nm nvarchar2(100),
	tel nvarchar2(100),
	addr nvarchar2(100),
	sex nvarchar2(20),
	r_date date default sysdate
);

create table product(
	p_num number primary key,
    nm nvarchar2(100) not null,
    price number default 0,
    pic nvarchar2(255),
    qty number(4) default 0,
    info nvarchar2(255),
    yn_sale number(1) default 0
);