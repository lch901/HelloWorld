<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String b_id=request.getParameter("b_id");
		System.out.println("b_id");
		
		BoardDBBean db=BoardDBBean.getInstance();
		db.getConnection();
		BoardBean board=db.getBoard(b_id,false);
	%>
<h1>글수정</h1>
	<form action="editOk.jsp" method="get">
		<input type="hidden" name="b_id" value="<%=board.getB_id() %>">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_name" value="<%=board.getB_name()%>"></td>
				<td>이메일</td>
				<td><input type="email" name="b_email" value="<%=board.getB_email()%>"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td colspan="3"><input type="text" name="b_title" value="<%=board.getB_title()%>"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" cols="70" name="b_content" ><%=board.getB_content()%></textarea>
				</td>
			</tr>
			<tr>
				<td>암호(현재암호)</td>
				<td colspan="3"><input type="text" name="b_pwd" value=""></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시입력">
					<input type="button" value="글목록" onclick="location.href='view.jsp?b_id=<%=board.getB_id()%>'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>