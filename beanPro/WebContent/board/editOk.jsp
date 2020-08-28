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
	<%
		String b_name=request.getParameter("b_name");
		String b_email=request.getParameter("b_email");
		String b_title=request.getParameter("b_title");
		String b_content=request.getParameter("b_content");
		String b_pwd=request.getParameter("b_pwd");
		System.out.println(b_name);
		System.out.println(b_email);
		System.out.println(b_title);
		System.out.println(b_content);
		System.out.println(b_pwd);
		
		BoardDBBean db=BoardDBBean.getInstance();
		BoardBean board=new BoardBean();
		board.setB_name(b_name);
		board.setB_email(b_email);
		board.setB_title(b_title);
		board.setB_content(b_content);
		board.setB_pwd(b_pwd);
		
		
		
		db.getConnection();
		int re=db.editBoard(board);
		if(re==0){
			response.sendRedirect("edit.jsp");//비밀번호가 틀림. 
		}else{
			response.sendRedirect("list.jsp");
		}
		
	%>
</body>
</html>