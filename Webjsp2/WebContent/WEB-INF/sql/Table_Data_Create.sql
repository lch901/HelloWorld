CREATE TABLE category_tbl (
    num      		NUMBER(5)       PRIMARY KEY,
    name       		VARCHAR2(30)    NOT NULL
);


insert into category_tbl  values(1, '컴퓨터');
insert into category_tbl  values(2, '교양서적');
insert into category_tbl  values(3, '참고서');



CREATE TABLE book_info_tbl (
    num           	NUMBER(5)       PRIMARY KEY,
    category        NUMBER(5)       NOT NULL,
    title           VARCHAR2(50)    NOT NULL,
    author          VARCHAR2(30)    NOT NULL,
    company       	VARCHAR2(50)    NOT NULL,
    c_date          VARCHAR2(20) 	NOT NULL,
    price           NUMBER(5)       NOT NULL,
    point           CHAR(1)         NOT NULL
    
    --FOREIGN KEY(category) 
);

insert into book_info_tbl  values(1001, 1, 'html', '고집녀', '퍼블리싱', '2020', 25000, 'Y');
insert into book_info_tbl  values(1002, 1, '자바스크립트', '정완용', '퍼블리싱', '2020.9.10', 20000, 'N');
insert into book_info_tbl  values(1003, 1, 'Java Programming', '강감찬', '퍼블리싱', '2020.07.15', 26000, 'N');

insert into book_info_tbl  values(1004, 2, '합격하는 사람은 단순하게 공부한다', '이박사', 'ebook', '2019.10.11', 20000, 'N');
insert into book_info_tbl  values(1005, 2, '돈의 속성', '김승호', 'ebook', '2019.08.15', 20000, 'Y');
insert into book_info_tbl  values(1006, 2, '투자의 태도', '곽상준', 'ebook', '2019.11.24', 15000, 'N');

insert into book_info_tbl  values(1007, 3, '필수영어', '정철', '중앙교육', '2018.09.01', 32000, 'N');
insert into book_info_tbl  values(1008, 3, '필수수학', '이기찬', '종로학원', '2019.09.01', 35000, 'Y'); 







