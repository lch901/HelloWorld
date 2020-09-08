<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="msg" value="Hello"/>
	<c:set var="age">
		${30}
	</c:set>
	
	<c:out value="연습"/>
	<c:out value="${msg}"/>
	<c:out value="${age}" default="40"/>
	<c:out value="${aaa}" default="40"/>
	<c:remove var="msg"/>
	<c:out value="${msg }" default="bye"/>
</body>
</html>