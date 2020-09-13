drop table board1_tbl;
create table board1_tbl (
   num  number(5) primary key,  /*1. //게시물 일련번호 */
   reg_name varchar2(255),            /*2. //작성자  */
   title varchar2(255),            /*3. //제목  */
   content varchar2(3000),              /*4. //내용 */
   file_name1 varchar2(255),      /*5. //파일이름1 */
   hit_cnt number default 0,             /*6. //조회수 */
   doc_group number,                      /*7. //글그룹 */
   doc_pos number,    /*8. //포지션  */
   doc_step number,               /*9. //스탭 */
   ip_num varchar2(255),                 /*10. //IP주소 */
   reg_date varchar2(255),              /*11. //등록일*/
   state varchar2(255));             /*12. //상태 */	
   
create sequence comm1_seq
start with 1
increment by 2
nocycle;
   
insert into BOARD1_TBL(NUM, REG_NAME, TITLE, CONTENT, FILE_NAME1, DOC_GROUP, DOC_POS, DOC_STEP, IP_NUM, REG_DATE, STATE)
values(comm1_seq.nextVal,'a','b','c','d',comm1_seq.currval,3,4,'e','f','g');
delete from board1_tbl;
            
select * from board1_tbl;


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /*drop table board1_tbl;
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
select * from board1_tbl;*/