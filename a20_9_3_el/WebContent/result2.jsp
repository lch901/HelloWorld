<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#eeeeee">
	<%
		request.setAttribute("name","홍길동");
		request.setAttribute("id","hong");
	%>
	
	1. <%=request.getAttribute("name")%><br/>
	2. ${requestScope["name"] }<br/>
	3. ${requestScope.name }<br/><br/>
	
	${name }<br/>
	${id }<br/>
	
	----url창에 userid변수와 값을 입력(?userid=123)---<br/>
	<%=request.getParameter("userid") %><br/>
	${param["userid"] }<br/>
	${param.userid }<br/>
	-----<br/>
</body>
</html>