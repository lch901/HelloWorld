<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="registerOk.jsp" method="get">
		<table border="1">
			<tr>
				<td colspan="2"><h1>회원가입신청</h1><p>표시 항목은 필수 입력 항목입니다.</p></td>
			</tr>
			<tr><td>id</td><td><input type="text" name="mem_uid"></td></tr>
			<tr><td>암호</td><td><input type="password" name="mem_pwd"></td></tr>
			<tr><td>암호확인</td><td><input type="password" name="mem_pwd_chk"></td></tr>
			<tr><td>이름</td><td><input type="text" name="mem_name"></td></tr>
			<tr><td>email</td><td><input type="text" name="mem_email"></td></tr>
			<tr><td>주소</td><td><input type="text" name="mem_addr"></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="다시입력">
					<input type="button" value="가입안함" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>