<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.time.*" %>
<%
	List<Purchase_productVo> list = (List<Purchase_productVo>)request.getAttribute("list");
	int y = (int)request.getAttribute("y");
	int m = (int)request.getAttribute("m");
	
	Calendar c = Calendar.getInstance();
	int v=c.get(c.YEAR);
	
	String product = (String)request.getAttribute("product");
	System.out.println(product);
%>

<h1>월별 판매 현황</h1>
<form id="f" action="saleMon" method="get" onsubmit="return chk();">
	연도 : <select name="y">
		<%for(int i=0;i<6;i++){ %>
			<option value="<%=i+v%>"<%if(y == v+i) {%> selected <%} %>><%=i+v %>년</option>
		<%} %>
	</select>
	월 : <select name="m">
		<%for(int i=1;i<=12;i++){ %>
			<option <%if(i < 10){ %>value="0<%=i%>"<%}else{%>value="<%=i %>"  <%} %> 
					<%if(m == i) {%> selected <%} %>><%=i %>월</option>
		<%} %>
	</select>
	상품 : <select name="product">
		<option value="">--전체--</option>
		<%for(int i=0;i<list.size();i++){ %>
			<option value="<%=list.get(i).getNm() %>" <%if(list.get(i).getNm().equals(product)) {%> selected <%} %>><%=list.get(i).getNm() %></option>
		<%} %>
	</select>
	<input type="submit" value="검색">
</form>
<table>
	<tr>
		<td>날짜</td>
		<td>이미지</td>
		<td>상품명</td>
		<td>단가</td>
		<td>총 수량</td>
		<td>총 금액</td>
	</tr>
	<%for(Purchase_productVo vo : list){ %>
		<tr>
			<td><%=vo.getR_dt() %></td>
			<td><img class="img1" src="<%=vo.getPic() %>"></td>
			<td><%=vo.getNm() %></td>
			<td><%=vo.getPrice() %>원</td>
			<td><%=vo.getQty() %>개</td>
			<td><%=vo.getTotal_price() %>원</td>
		</tr>
	<%} %>
</table>
<script>
	function chk(){
		if(f.s_r_dt.value === ''){
			alert('날짜를 입력해주세요.');
			return false;
		}
		return true;
	}
</script>