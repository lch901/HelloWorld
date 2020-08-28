<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글수정</h1>
	<form action="editOk.jsp" method="get">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_name"></td>
				<td>이메일</td>
				<td><input type="email" name="b_email"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td colspan="2"><input type="text" name="b_title"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" cols="50" name="b_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>암호</td>
				<td colspan="2"><input type="text" name="b_pwd"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시입력">
					<input type="button" value="글목록" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>