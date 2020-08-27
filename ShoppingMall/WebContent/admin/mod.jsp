<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");
%>
<h1>상품 수정</h1>
<form action="mod" method="post">
	<input type="hidden" name="i_product" value="<%=vo.getI_product()%>">
	제품명:<input type="text" name="nm" value="<%=vo.getNm()%>"><br>
	금액:<input type="number" name="price" value="<%=vo.getPrice()%>"><br>
	사진:<input type="text" name="pic" value="<%=vo.getPic()%>">(이미지 업로드 X,웹 이미지 주소)<br>
	상품정보:<input type="text" name="info" value="<%=vo.getInfo()%>"><br>
	판매여부:<select name="yn_sale">
		<option value="1" <%if(vo.getYn_sale() == 1){ %>selected<%} %>>판매중</option>
		<option value="0" <%if(vo.getYn_sale() == 0){ %>selected<%} %>>판매정지</option>
	</select><br>
	<input type="submit" value="수정">
</form>