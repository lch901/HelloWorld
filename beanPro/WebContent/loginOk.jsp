<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mem_uid=request.getParameter("mem_uid");
		String mem_pwd=request.getParameter("mem_pwd");
		/* System.out.println(mem_uid);
		System.out.println(mem_pwd); */
		
		MemberDBBean manager=MemberDBBean.getInstance();
		manager.getConnection();
		int check=manager.userCheck(mem_uid, mem_pwd);
		
		if(check==1){
			out.print("아이디와 비번이 일치");
		}else if(check==0){
			out.print("아이디가 존재하지 않습니다.");
		}else{
			out.print("비번불일치");
		}
		
		
	%>
</body>
</html>