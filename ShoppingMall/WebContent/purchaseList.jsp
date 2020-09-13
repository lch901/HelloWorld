<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
	List<Purchase_productVo> list = (List<Purchase_productVo>)request.getAttribute("list");
	MemberVo memberVo =(MemberVo)session.getAttribute("memberVo"); 
%>
<h1>구매 리스트</h1>
<table>
	<tr>
		<td>구매 번호</td>
		<td>이미지</td>
		<td>상품명</td>
		<td>금액</td>
		<td>수량</td>
		<td>구매일</td>
		<td>비고</td>
	</tr>
	<%for(Purchase_productVo vo : list){ %>
		<%if(memberVo.getI_member() == vo.getI_member()){ %>
			<tr>
				<td><%=vo.getI_purchase() %></td>
				<td><img class="img1" src="<%=vo.getPic() %>"></td>
				<td><%=vo.getNm() %></td>
				<td>
					단가 <%=vo.getPrice() %>원<br>
					구매 금액 <%=vo.getBuy_price() %>원
				</td>
				<td>
					현재고 <%=vo.getQty() %>개<br>
					구매수량 <%=vo.getBuy_qty() %>개
				</td>
				<td><%=vo.getR_dt().substring(0,10) %></td>
				<td><a href="pDetail?i_product=<%=vo.getI_product()%>"><button>상품보기</button></a></td>
			</tr>
		<%} %>
	<%} %>
</table>