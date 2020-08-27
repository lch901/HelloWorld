<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
	List<ProductVo> list = (List<ProductVo>)request.getAttribute("list");
%>
<h1>상품 리스트</h1>
<div class="flex">
	<%for(ProductVo vo : list){ %>
		<span class="list">
			<a href="pDetail?i_product=<%=vo.getI_product()%>"><img class="img2" src="<%=vo.getPic()%>"></a><br>
			<%=vo.getNm() %><br>
			<%=vo.getPrice() %>원<br>
		</span>
	<%} %>
</div>