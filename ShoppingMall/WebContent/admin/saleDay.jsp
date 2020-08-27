<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.time.*" %>
<%
	List<Purchase_productVo> list = (List<Purchase_productVo>)request.getAttribute("list");
	String s = (String)request.getAttribute("s");
	String e = (String)request.getAttribute("e");
	
	LocalDateTime date = LocalDateTime.now();
	LocalDate onlydate = LocalDate.now();
	System.out.println(onlydate+"  "+s+"  "+e);
	
%>

<h1>일별 판매 현황</h1>
<form id="f" action="saleDay" method="get" onsubmit="return chk();">
	날짜 : <input type="date" name="s_r_dt" <%if(s == null){%> value="<%=onlydate%>" <%}else{%> value="<%=s %>"  <%}%>> ~ 
		<input type="date" name="e_r_dt" <%if(e == null){%> value="<%=onlydate%>" <%}else{%> value="<%=e %>"  <%}%>>
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
			<td><%=vo.getR_dt().substring(0,10) %></td>
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
		if(f.e_r_dt.value === ''){
			alert('날짜를 입력해주세요.');
			return false;
		}
		return true;
	}
</script>