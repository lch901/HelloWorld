<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="User" class="temp.User"/>
	<jsp:setProperty property="firstName" name="User"/>
	<jsp:setProperty property="lastName" name="User"/>
	--------------
	둘 다 같은 방식<br/>
	1. request : <%=request.getParameter("firstName") %> <%=request.getParameter("lastName") %><br/>
	2. EL : ${param.firstName } ${param.lastName }<br/>
	3. jsp액션에 있는 객체 : <%=User.getFirstName() %> <%=User.getLastName() %><br/>
	4. jsp액션에 있는 객체 EL : ${User.firstName} ${User.lastName}<br/>
	--------------
</body>
</html>