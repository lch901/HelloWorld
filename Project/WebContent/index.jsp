<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String view=(String)request.getAttribute("view");
	
	if(view == null){
		view="main.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html{
	over-flow:scroll;
}
html,body,.container{
	width:100%;
	margin:0;
	padding:0;
}
.container{
	display:flex;
	flex-direction:column;
}
.container > nav{
	height:50px;
	
}
.container > header{
	height:200px;
	display:flex;
	justify-content:space-between;
	
}
.container > section{
	flex-grow:1;
	display:flex;
}
.container > section > .left{
	width:300px;
}
.container > section > .center{
	flex-grow:6;
	display:flex;
	flex-direction: column;
}
.container > section > .center > .main{
	width:
	height:1000px;
	border:1px solid black;
	display:flex;
	flex-direction:column;
}
.container > section > .center > .main > .main-top{
	flex-grow:1;
	display:flex;
}
.container > section > .center > .main > .main-top > .top-event{
	width:100%;
	height:800px;
	
}
.container > section > .center > .main > .main-bottom{
	flex-grow:1;
	display:flex;
	justify-content:space-between;
}
.container > section > .center > .main > .main-bottom > .bottom-item1{
	margin:25px 0;
	width:400px;
	height:400px;
	
}
.container > section > .center > .main > .main-bottom > .bottom-item2{
	margin:25px 0;
	width:400px;
	height:400px;
	
}
.container > section > .center > .main > .main-bottom > .bottom-item3{
	margin:25px 0;
	width:400px;
	height:400px;
	
}
.container > section > .right{
	width:300px;
	
}
.container > footer{
	height:50px;
	
}
</style>
</head>
<body>
	<div class="container">
		<nav>
			주도 행사 알림바 h50px
		</nav>
		<header>
			<div>=</div>
			<div>쇼핑몰 이름 및 로고</div>
			<div>
				<a href="login">login</a>
				<a href="cart">cart(*)</a>
				<a href="help">help</a>
			</div>
		</header>
		<section>
			<div class="left">w300px</div>
			<div class="center">
				<div class="main">
					<jsp:include page="<%=view %>"/>
				</div>
			</div>
			<div class="right">w300px</div>
		</section>
		<footer>
			h50px
		</footer>
	</div>
</body>
</html>