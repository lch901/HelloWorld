<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	String view = (String)request.getAttribute("view");
	AdminVo vo = (AdminVo)session.getAttribute("adminVo");
	if(vo ==null && !view.equals("login.jsp")){
		view = "login.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingMall</title>
<link rel="stylesheet" type="text/css" href="../css/temp.css?ver=138"><!-- css는 "../"로 뒤로가기 가능. a링크나 서블릿에서 경로 바꿀땐 젤앞에 "/"를 붙여서 url를 모두 없애고 다시 다 적어여함 -->
<link rel="stylesheet" type="text/css" href="../css/adTemp.css?ver=2"><!-- table때문에 만든 css파일 -->
</head>
<body>
	<div class="container">
		<header>
			<div class="header">
				<a href="reg">상품 등록</a>
				<a href="list">상품 리스트</a>
				<a href="im">상품 입고</a>
				<a href="saleDay">판매 현황(day)</a>
				<a href="saleMon">판매 현황(mon)</a>
				<a href="saleYear">판매 현황(year)</a>
				<%if(vo ==null){%>
					<a href="login">로그인</a>
				<%}else{ %>
					<a href="/ShoppingMall/logout?type=admin">로그아웃</a><!-- 이클립스의 특징은 하나의 워크스페이스에 어러개의 프로젝트를 생성가능.  -->
				<%} %>		<!-- 제일앞쪽에 "/"를 붙여주면 url주소들이 모두 날아감 -->
			</div>
		</header>
		<section>
			<jsp:include page="<%=view %>"/>
		</section>
		<footer>
			<div>Copyright&copy; 한국쇼핑몰에 오신걸 환영합니다.</div>
		</footer>
	</div>
</body>
</html>