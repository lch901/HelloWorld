create table t_admin(
    i_admin number primary key,
    mid nvarchar2(30) not null,
    mpw nvarchar2(50) not null,
    nm nvarchar2(10) not null
);

insert into t_admin(i_admin,mid,mpw,nm)values(1,'admin','1212','������');

create table t_member(
    i_member number primary key,
    mid nvarchar2(30) not null,
    mpw nvarchar2(50) not null,
    nm nvarchar2(10) not null,
    sex number(1) not null,
    r_date date default sysdate
);
delete from t_member where i_member >3;

create table t_product(
    i_product number primary key,
    nm nvarchar2(100) not null,
    price number default 0,
    pic nvarchar2(255),
    qty number(4) default 0,
    info nvarchar2(255),
    yn_sale number(1) default 0
);

insert into t_product(i_product,nm,price,pic)values((select nvl(max(i_product),0)+1 from t_product),'��Դ� ���',1000000,'https://www.bloter.net/wp-content/uploads/2016/11/dugong-765x574.jpg');
delete from t_product where i_product>=6;
alter table t_product add(info nvarchar2(255) default'');

create table t_product_import(
    i_pi number primary key,
    i_product number,
    qty number(4) not null,
    i_dt date default sysdate,
    foreign key(i_product) references t_product(i_product)
);



select * from t_product_import;
update t_product set qty = qty -2 where i_product = 3;
delete from t_product_import where i_pi > 0;
delete from t_product where i_product = 3;

select b.i_pi,a.nm,sum(price*b.qty),b.qty from t_product a 
inner join t_product_import b 
on a.i_product = b.i_product
group by b.i_pi,a.nm,b.qty order by i_pi desc;

select i_product,sum(qty) from t_product group by i_product;

create table t_basket(
    i_basket number primary key,
    i_member number,
    i_product number,
    qty number(4) not null,
    price number not null,
    r_dt date default sysdate,
    foreign key(i_member) references t_member(i_member),
    foreign key(i_product) references t_product(i_product)
);

delete from t_basket where i_basket =1;
delete from t_purchase where i_purchase = 10;

insert into t_basket(i_basket,i_member,i_product,qty,price)values((select nvl(max(i_basket),0)+1 from t_basket),2,1,1,5000);
update t_member set mpw = 'a' where i_member = 2;


---
create table t_purchase(
    "I_PURCHASE" NUMBER, 
	"I_MEMBER" NUMBER, 
	"I_PRODUCT" NUMBER, 
	"QTY" NUMBER(4,0) NOT NULL ENABLE, 
	"PRICE" NUMBER NOT NULL ENABLE, 
	"R_DT" DATE DEFAULT sysdate, 
	 PRIMARY KEY ("I_PURCHASE")
);



select a.i_basket,b.pic,b.nm,b.price,(a.price*a.qty),b.qty,a.qty,a.i_member,b.yn_sale,b.i_product from t_basket a
inner join t_product b
on a.i_product = b.i_product;

select a.i_basket,b.pic,b.nm,b.price,(a.price*a.qty),b.qty,a.qty,a.i_member,b.yn_sale,b.i_product,rank() over(order by a.i_basket) as num from t_basket a
inner join t_product b
on a.i_product = b.i_product where i_member = 3 order by num desc;



select a.i_purchase,b.pic,b.nm,b.price,b.price*a.qty,b.qty,a.qty,a.r_dt,b.i_product,a.i_member from t_purchase a
inner join t_product b
on a.i_product = b.i_product;

select a.i_purchase,b.pic,b.nm,b.price,b.price*a.qty,b.qty,a.qty,a.r_dt,b.i_product,a.i_member,rank() over(order by a.i_purchase) as num from t_purchase a
inner join t_product b
on a.i_product = b.i_product where a.i_member = 1 order by num desc;
---

select to_char(r_dt,'yyyy-mm-dd'),pic,nm,price,sum(qty),sum(p) from
(select a.r_dt,b.pic,b.nm,b.price,a.qty,a.price*a.qty as p from t_purchase a
inner join t_product b
on a.i_product = b.i_product 
where to_char(a.r_dt,'yyyy-mm-dd') between '2019-09-10' and '2019-09-11')
group by to_char(r_dt,'yyyy-mm-dd'),pic,nm,price;


select to_char(r_dt,'yyyy-mm'),pic,nm,price,sum(qty),sum(p) from
(select a.r_dt,b.pic,b.nm,b.price,a.qty,a.price*a.qty as p from t_purchase a
inner join t_product b
on a.i_product = b.i_product 
where to_char(a.r_dt,'yyyy-mm') between '2019-09' and '2019-09')
where nm = '�̳��� ���'
group by to_char(r_dt,'yyyy-mm'),pic,nm,price ;

insert into t_purchase(i_purchase,i_member,i_product,qty,price,r_dt)values((select nvl(max(i_purchase),0)+1 from t_purchase),3,3,1,9999,'2019-12-');

select ceil(count(*)/5) from t_product;

select * from t_product where i_product between 1 and 20 and nm = '��Դ� ���';
select * from t_product where i_product between 1 and 20 and nm='%��%';
select i_product,nm,price,pic,qty,yn_sale,info,rank() over(order by i_product) as num from t_product where num = 11;--����select���� num���� where�� ���Ұ���
select * from 
(select i_product,nm,price,pic,qty,yn_sale,info,rank() over(order by i_product) as num 
from t_product where nm like '%��%') 
where num between 1 and 5;--���������ȿ� num���� where ��밡��

commit;
select * from t_admin;
select * from t_member;
select * from t_product order by i_product;
select * from t_product_import order by i_pi;
select * from t_basket;
select * from t_purchase;

drop table t_purchase;
drop table t_basket;
drop table t_product_import;
drop table t_product;
drop table t_member;
drop table t_admin;