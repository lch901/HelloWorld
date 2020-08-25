<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	List<Basket_productVo> list = (List<Basket_productVo>)request.getAttribute("list");
	MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
%>
<div class="mypage">
	<nav>
		<a href="basket">장바구니</a>
		<a href="changePw">비밀번호변경</a>
	</nav>
	<div>
		<h1>장바구니</h1>
		<table>
			<tr>
				<td>장바구니 번호</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>금액</td>
				<td>수량</td>
				<td>비고</td>
			</tr>
			<%for(Basket_productVo vo : list){ %>
				<%if(memberVo.getI_member() == vo.getI_member()){ %>
					<tr>
						<td><%=vo.getI_basket()%></td>
						<td><img class="img1" src="<%=vo.getPic()%>"></td>
						<td><%=vo.getNm()%></td>
						<td>
							단가 <%=vo.getPrice() %> 원<br>
							구매금액 <%=vo.getBuy_price() %> 원
						</td>
						<td>
							현재고 <%=vo.getQty()%> 개<br>
							구매수량  <%=vo.getBuy_qty() %> 개
						<td></td>
					</tr>
				<%} %>
			<%} %>
		</table>
	</div>
</div>