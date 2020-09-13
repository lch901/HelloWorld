<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br>
<h1>회원가입</h1>
<form id="f" action="join_result.jsp" method="get" onsubmit="return chk();">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"><button onclick="location.href='join'">아이디 중복확인</button></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="pw_chk"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="nm"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" name="tel"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				남<input type="radio" name="sex" value="남" checked>
				여<input type="radio" name="sex" value="여">
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="회원가입"></td>
		</tr>
	</table>
</form>


<script>
	function chk(){
		if(f.id.value ===''){
			alert('아이디를 입력하시오.');
			f.id.focus();
			return false;
		}
		if(f.pw.value ===''){
			alert('비밀번호를 입력하시오.');
			f.pw.focus();
			return false;
		}
		if(f.pw_chk.value ===''){
			alert('확인비밀번호를 입력하시오.');
			f.pw_chk.focus();
			return false;
		}
		if(f.pw_chk.value != f.pw.value){
			alert('확인비밀번호가 틀렸습니다.');
			f.pw_chk.focus();
			return false;
		}
		if(f.nm.value ===''){
			alert('이름을 입력하시오.');
			f.nm.focus();
			return false;
		}
		if(f.tel.value ===''){
			alert('전화번호를 입력하시오.');
			f.tel.focus();
			return false;
		}
		if(f.email.value ===''){
			alert('이메일을 입력하시오.');
			f.email.focus();
			return false;
		}
		if(f.addr.value===''){
			alert('주소를 입력하시오.');
			f.addr.focus();
			return false;
		}
		return true;
	}
</script>