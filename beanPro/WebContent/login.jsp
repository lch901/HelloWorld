<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginOk.jsp" method="get">
		<table border="1">
			<tr>
				<td>id</td>
				<td><input type="text" name="mem_uid"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="mem_pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인"/>
					<input type="button" value="회원가입" onclick="location.href='register.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>