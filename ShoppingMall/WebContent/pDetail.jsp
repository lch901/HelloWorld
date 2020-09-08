<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	ProductVo vo = (ProductVo)request.getAttribute("vo");
%>
<h1>상품 정보</h1>
제품명 : <%=vo.getNm() %><br>
<img class="img3" src="<%=vo.getPic()%>"><br>
금액 : <%=vo.getPrice() %><br>
수량 : <%=vo.getQty() %><br>
정보 : <%=vo.getInfo() %><br>

<hr/>

<form id="f" action="pDetail" method="post">
	<input type="hidden" name="i_product" value="<%=vo.getI_product()%>">
	수량 : <input type="button" value="-" onclick="return sub();"><input type="text" name="qty" value="0"><input type="button" value="+" onclick="return add();"><br>
	<input type="submit" value="장바구니 담기" formaction = "/ShoppingMall/basket" onclick="return basket_buy();">
	<input type="submit" value="바로구매" onclick="return basket_buy();"><br>
</form>
<script>
	function sub(){
		if(f.qty.value > 0){
			f.qty.value--;
		}
		return true;
	}
	function add(){
		f.qty.value++;
		return true;
	}
	function basket_buy(){//자바스크립트는 에러가 나면 페이지는 실행되지만 자바스크립트는 전부 실행 안됨..
		if(f.qty.value > <%=vo.getQty()%>){
			alert('재고가 부족합니다.');
			return false;
		}
		if(f.qty.value == 0){
			alert('제품 수량은 0이상이어야 합니다.');
			return false;
		}
	
		return true;
	}
	
</script>