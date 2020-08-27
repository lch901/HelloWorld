<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
	List<ProductVo> list = (List<ProductVo>)request.getAttribute("list");
	String complete = request.getParameter("complete");
	int pageCnt = (int)request.getAttribute("pageCnt");
	String search = (String)request.getAttribute("search");
	int p = (int)request.getAttribute("page");
%>
<%if(complete != null){ %>
	<script>alert('수정완료')</script>
<%} %>
<div class="main2">
	<h1>상품 리스트</h1>
	<form action="list" method="get">
		상품명 검색<input class="i3" type="text" name="search" value="<%=search%>"><input type="submit" value="검색">
	</form>
	<form class="f" action="list" method="post">
		<table class="table2">
			<tr>
				<td>삼품 번호</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>금액</td>
				<td>수량</td>
				<td>판매여부</td>
				<td>비고</td>
			</tr>
			<%for(ProductVo vo : list){ %>
				<tr>
					<td><%=vo.getI_product() %></td>
					<td><img class="img1" src="<%=vo.getPic() %>"></td>
					<td><%=vo.getNm() %></td>
					<td><%=vo.getPrice() %>원</td>
					<td><%=vo.getQty() %>개</td>
					<%if(vo.getYn_sale() == 1){ %>
						<td>판매중</td>
					<%}else{ %>
						<td>판매정지</td>
					<%} %>
					<td><a href="mod?i_product=<%=vo.getI_product()%>"><input type="button" value="수정"></a></td>
				</tr>
			<%} %>
		</table>
		<div class="end">
			<%for(int i=1;i<=pageCnt;i++){ %>
				<%if(p != i){ %>
					<a href="list?page=<%=i%>&search=<%=search %>"><%=i %></a>
				<%}else{ %>
					<span class="red"><%=i %></span>
				<%} %>
			<%} %>
		</div>
	</form>
</div>