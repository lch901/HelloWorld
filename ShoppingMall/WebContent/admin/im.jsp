<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
	List<ProductVo> productList = (List<ProductVo>)request.getAttribute("productList");
	List<ProductVo> list = (List<ProductVo>)request.getAttribute("list");
%>
<h1>상품 입고</h1>
<form action="im" method="post">
	상품:<select name="i_product">
		<%for(ProductVo vo : productList){ %>
			<option value="<%=vo.getI_product()%>"><%=vo.getNm() %></option>
		<%} %>
	</select><br>
	수량:<input type="number" name="qty"><br>
	<input type="submit" value="입고"><br>
</form>
<hr/>
<h1>입고 리스트</h1>
<table>
	<tr>
		<td>입고 번호</td>
		<td>상품명</td>
		<td>금액</td>
		<td>수량</td>
	</tr>
	<%for(ProductVo vo : list){ %>
		<tr>
			<td><%=vo.getI_pi() %></td>
			<td><%=vo.getNm() %></td>
			<td><%=vo.getPrice() %>원</td>
			<td><%=vo.getQty() %>개</td>
		</tr>
	<%} %>
</table>