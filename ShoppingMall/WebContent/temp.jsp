<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	String view = (String)request.getAttribute("view");
	MemberVo vo = (MemberVo)session.getAttribute("memberVo");
	if(vo != null && view.equals("login.jsp")){
		view = "home.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingMall</title>
<link rel="stylesheet" type="text/css" href="css/temp.css?ver=912"/>
</head>
<body>
	<div class="container">
		<header>
			<div class="header">
				<%if(vo == null){ %>
					<a href="login">로그인</a>
				<%}else{%>
					<a href="pList">상품 리스트</a>
					<a href="purchaseList">구매 리스트</a>
					<a href="basket">마이페이지</a>
					<a href="logout?type=member">로그아웃</a>
				<%} %>
			</div>
		</header>
		<section>
			<jsp:include page="<%=view %>"/>
		</section>
		<footer>
			<div>Copyrightⓒ 한국쇼핑몰에 오신걸 환영합니다.</div>
		</footer>
	</div>
</body>
</html>