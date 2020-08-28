drop table memberT;
create table memberT (
	mem_uid varchar(15) primary key,
	mem_pwd varchar(15) not null,
	mem_name varchar(10) not null,
	mem_email varchar(50),
	mem_regdate date,
	mem_addr varchar(100)
);
insert into memberT(mem_uid, mem_pwd, mem_name, mem_email)
values('100','111','홍길동', 'hong@han.com');
insert into memberT(mem_uid, mem_pwd, mem_name, mem_email)
values('1001','222','홍길동', 'hong@han.com');
select * from memberT;

create table board (
	b_id number(5) primary key, /*1. 글번호 */
	b_name varchar2(20), /*2. 글쓴이 */
	b_email varchar2(50), /*3. 글쓴이 메일 */
	b_title varchar2(80), /*4. 글 제목 */
	b_content varchar2(3000), /*5. 글 내용 */
	b_pwd varchar(12), /*6. 비밀번호 */
	b_date date, /*7. 글쓴 날짜 */
	b_hit number(5) default 0, /*8. 조회 횟수 */
	b_ip varchar2(15), /*9. 글쓴이의 아이피 주소 */
	b_ref number(5), /*10. 글 그룹 번호 */
	b_step number(5), /*11. 화면에 출력되는 글 위치*/
	b_level number(5)
); /*12. 답변 순위*/
insert into board(b_id, b_name, b_email, b_title, b_content)
values(1, '홍길동', 'hong@hanmail.net', '연습', '지금은 연습자료입니다.');
delete from board where b_id>1;

select * from board;
