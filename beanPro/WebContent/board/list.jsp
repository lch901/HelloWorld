<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDBBean db=BoardDBBean.getInstance();
		db.getConnection();
		ArrayList<BoardBean> list=db.listBoard();
	%>
	<h1>게시판</h1>
	<a href="write.jsp">글쓰기</a>
	<table>
		<tr>
			<td>번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
			<%if(list!=null){ %>
				<%for(BoardBean board:list){ %>
					<tr>
						<td><%=board.getB_id() %></td>
						<td><a href="view.jsp?b_id=<%=board.getB_id()%>"><%=board.getB_title() %></a></td>
						<td><a href=""><%=board.getB_name() %></a></td>
						<td><%=board.getB_date() %></td>
						<td><%=board.getB_hit() %></td>
					</tr>
				<%} %>
			<%} %>
	</table>
</body>
</html>