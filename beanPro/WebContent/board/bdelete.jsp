<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String b_id=request.getParameter("b_id");
		/* System.out.println(b_id); */
		
	%>
	<h1>글삭제</h1>
	<form action="bdeleteOk.jsp" method="get">
		<input type="hidden" name="b_id" value="<%=b_id %>">
		<table border="1">
			<tr>
				<th colspan="2">암호를 입력하세요.</th>
			</tr>
			<tr>
				<td>암호 </td>
				<td><input type="password" name="b_pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글삭제">
					<input type="reset" value="다시작성">
					<input type="button" value="글목록" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>