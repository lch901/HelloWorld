<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<br>
<h1>로그인</h1>
<form action="login" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td>
				<a href="findIdPw">아이디/비밀번호 찾기</a>
			</td>
			<td></td>
			<td><a href="join">회원가입</a></td>
		</tr>
	</table>
</form>

