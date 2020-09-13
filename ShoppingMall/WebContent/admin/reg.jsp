<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");
	String complete =request.getParameter("complete");
%>
<%if(complete != null){%>
	 <script>alert('등록완료')</script>
<%} %>
<h1>상품 등록</h1>
<form id="adF" action="reg" method="post" onsubmit="return chk();">
	삼품번호:<input type="number" name="i_product" value="<%=vo.getI_product()%>" readonly><br>
	제품명:<input type="text" name="nm"><br>
	금액:<input type="number" name="price"><br>
	사진:<input type="text" name="pic">(이미지 업로드X, 웹 이미지 주소)<br>
	상품정보:<textarea name="info" ></textarea><br>
	<input type="submit" value="등록">
</form>
<script>
	function chk(){
		if(adF.nm.value === ""){
			alert('이름을 입력하시오.');
			adF.nm.focus();
			return false;
		}
		if(adF.price.value == 0){
			alert('가격을 입력하시오.');
			adF.price.focus();
			return false;
		}
		if(adF.pic.value === ""){
			alert('이미지주소를 입력하시오.');
			adF.pic.focus();
			return false;
		}
		if(adF.info.value === ""){
			alert('상품정보를 입력하시오.');
			adF.info.focus();
			return false;
		}
		return true;
	}
</script>