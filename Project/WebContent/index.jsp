<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view=(String)request.getParameter("view");
	
	if(view == null){
		view="main.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?ver=101"/>
<link rel="stylesheet" type="text/css" href="./css/menubar.css?ver=200"/>
<link rel="stylesheet" type="text/css" href="./css/section.css?ver=300"/>
</head>
<body>
	<div class="container">
		<header>
			<div class="event">
				주도 행사 알림바
			</div>
			<div class="backend">
				<a href="index.jsp">홈</a>
				<a href="">즐겨찾기</a>
				<a href="">바로가기</a>
				<a href="index.jsp?view=login.jsp">로그인</a>
				<a href="index.jsp?view=join.jsp">회원가입</a>
				<a href="">마이쇼핑</a>
				<a href="">장바구니</a>
				<a href="">주문조회</a>
				<a href="">고객센터 & 이벤트</a>
				<form class="search" action="" method="get">
					<input type="text" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
			<div class="logo">
				<img class="logo-img" src="./images/snoopy.jpg" alt="로고"/>
				<h1>쇼핑몰 이름</h1>
			</div>
			<div class="ss">
				<ul class="category">
					<li><a href="">=</a></li>
					<li><a href="">best</a></li>
					<li><a href="">new</a></li>
					<li>
						<a href="">top</a>
						<ul class="category-sub">
							<li><a href="">긴팔</a></li>
							<li><a href="">맨투맨/후드</a></li>
							<li><a href="">니트</a></li>
							<li><a href="">반팔</a></li>
							<li><a href="">티셔츠</a></li>
						</ul>
					</li>
					<li>
						<a href="">pants</a>
						<ul class="category-sub">
							<li><a href="">menu</a></li>
							<li><a href="">menu</a></li>
							<li><a href="">menumenu</a></li>
							<li><a href="">menumenu</a></li>
							<li><a href="">menumenumenu</a></li>
						</ul>
					</li>
					<li><a href="">shirt</a></li>
					<li><a href="">outer</a></li>
					<li><a href="">shoes</a></li>
					<li><a href="">item</a></li>
				</ul>
			</div>
		</header>
		<section>
			<jsp:include page="<%=view %>"/>
		</section>
		<footer>
			footer
		</footer>
	</div>
</body>
</html>