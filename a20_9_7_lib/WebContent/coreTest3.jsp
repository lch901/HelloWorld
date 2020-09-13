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
if-----------<br/>
<c:set var="id" value="hong"/>
<c:set var="pwd" value="1234"/>
<c:if test="${id=='hong' }">
	<c:if test="${pwd=='1234' }">
		<c:out value="성공"/>
	</c:if>
</c:if><br/>

choose-----------<br/>
<c:set var="man" value="t"/>
<c:choose>
	<c:when test="${man=='t' }">
		<c:out value="남성"/>
	</c:when>
	<c:when test="${man=='f' }">
		<c:out value="여성"/>
	</c:when>
</c:choose><br/>


배열-----------<br/>
<c:forEach var="i" begin="1" end="10" step="1">
	<c:out value="${i }"/>
</c:forEach><br/>


배열2-----------<br/>
<c:forTokens var="text" items="서울,인천,대구,부산,경주,전주,대전" delims="," varStatus="city">
	<c:out value="${text }"/>
	<c:out value="${city.count }"/>
</c:forTokens><br/>


page import-----------<br/>
<c:import url="coreTest1.jsp" var="data"/>
${data }<br/>

</body>
</html>