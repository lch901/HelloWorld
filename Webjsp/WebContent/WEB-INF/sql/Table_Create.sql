-- 테이블 생성 

-- DROP TABLE MEMBER1_TBL CASCADE CONSTRAINTS;

CREATE TABLE MEMBER1_TBL (
	NUM		number		NOT NULL,	--일련번호(회원고유번호)
	ID		varchar2(10) 	NOT NULL,	--아이디
	PWD		varchar2(8) 	NOT NULL,	--비밀번호
	NAME		varchar2(20) 	NOT NULL,	--성명
	EMAIL		varchar2(30) 	NOT NULL,	--이메일
	TEL		varchar2(13) ,		--휴대폰번호
	POST		varchar2(7) 	NOT NULL,	--우편번호
	ADDR_1		varchar2(50) 	NOT NULL,	--주소
	ADDR_2		varchar2(50) 	NOT NULL,	--상세주소
	COMMENT1	varchar2(300), 		--남기는말
	ACCESS1		char(1) 		NOT NULL,	--회원분류(접근권한'S':특별회원, 'M':일반회원)
	REG_DATE 	varchar2(10) 	NOT NULL,	--가입일자
	STATE		char(1)		NOT NULL,	--'Y':정상 'N' : 탈퇴
	CONSTRAINTS MEMBER1_TBL_PK PRIMARY KEY(NUM)
);

----------------------------------------------------

-- 우편번호 테이블 생성

create table tbl_postcode
  (no number,
  zipcode    varchar2(20),
  sido       varchar2(20),
  gugun      varchar2(30),
  DONG       varchar2(30),
  RI varchar2(40),
  BUNJI      varchar2(40)
  );



------------------------------------------------------
