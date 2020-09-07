<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="board" class="pro.BoardBean"></jsp:useBean>
	<jsp:setProperty property="*" name="board"/>
	<%
		BoardDBBean db=BoardDBBean.getInstance();
		
		db.getConnection();
		int re=db.editBoard(board);
		if(re==0){
			response.sendRedirect("edit.jsp?b_id="+board.getB_id());//비밀번호가 틀림. 
		}else{
			response.sendRedirect("view.jsp?b_id="+board.getB_id());
		}
		
	%>
</body>
</html>