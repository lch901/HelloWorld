<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view=(String)request.getAttribute("view");
	if(view==null){
		view="home.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
	<div class="container">
		<header>
			<h1>shaun-way back home</h1>
			<audio controls>
				<source src="./music/WayBackHoe.mp3" type="audio/mp3">
			</audio>
			<a href="">상품 등록</a>
			<a href="">상품 리스트</a>
			<a href="">상품 입고</a>
			<a href="">판매현황(day)</a>
			<a href="">판매현황(mon)</a>
			<a href="">판매현황(year)</a>
			<a href="">로그인</a>
			<a href="login">로그인</a>
		</header>
		<section>
			<jsp:include page="<%=view %>"></jsp:include>
		</section>
		<footer>
			Copyright@ 이딴걸 또 만들게 되서 짜증납니다.
		</footer>
	</div>
</body>
</html>