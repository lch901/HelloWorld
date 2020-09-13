<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String b_id=request.getParameter("b_id");
		String b_pwd=request.getParameter("b_pwd");
		/* System.out.println(b_id);
		System.out.println(b_pwd); */
		
		BoardDBBean db=BoardDBBean.getInstance();
		int re=db.deleteBoard(b_id,b_pwd);
		if(re==1){
			response.sendRedirect("list.jsp");
		}else if(re==0){
			%>
			<script language="javascript">
				alert("비번이 맞지않음.");
				history.back();
			</script>
			<%
		}else if(re==-1){
			%>
			<script language="javascript">
				alert("삭제실패");
				history.back();
			</script>
			<%
		}
	%>
</body>
</html>