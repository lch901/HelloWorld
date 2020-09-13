<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=EUC_KR" %>
<jsp:useBean id="cart" class="com.test.shopp.Shopp_Cart" scope="session" />
<html><head><title>장바구니</title></head>
<body>
<center>
<jsp:include page="top.jsp" flush="true"/>
<h3>장바구니 보기</h3>
<hr>
<table width="500" border="1" >
		  <tr align="center">
		    <td width="50"> 번호 </td>
		    <td width="250"> 제목 </td>
		    <td width="50"> 가격</td>
		    <td width="50"> 수량 </td>
		    <td width="50"> 금액 </td>
		    <td width="50"> 작업 </td>
		  </tr>  
<%
	int cnt = cart.getSize();
	int sum = 0;
	try {
       for(int i = 0; i < cnt; i++) {
           Book_Info data = cart.getBook(i);
	       int num = cart.getNum(i);
%>
		  <tr>
		  	<td align="center"><%= (i+1) %></td>
		    <td>
		      <a href="book_view.jsp?num=<%= data.getNum() %>"><%= data.getTitle(true) %></a>
		    </td>
		    <td align="right"><%= data.getPrice() %></td>
		    <td align="center"><%= num %></td>
		    <td align="right"><%= (data.getPrice() * num) %></td>
    
		    <form method="post" action="removeGoods_cart.jsp">

		    <td align="center">
		      <input type=hidden name="num" value="<%= data.getNum() %>">
		      <input type=submit value="삭제">
		    </td>
		    </form>
		  </tr>
<%		
		sum += data.getPrice();
        }
      }catch(Exception e) { 
    	  out.println("error ="+ e +"<Br>");
      }
      if(cnt < 1) {
%>
		  <tr>
		    <td colspan="6" align="center">
		      담겨져 있는 상품이 없습니다.
		    </td>
		  </tr>
<%    }else {  %>
		  <tr>
		  	<td colspan="4" align="center">총 금액</td>
		    <td align="right"><%= sum %> </td>
		    <td colspan="2"> &nbsp;</td>
		  </tr>
<%    }  %>		  
</table>
<br>
<%    if(cnt < 1) {  %>
		<a href="book_list.jsp">계속 쇼핑하기</a>&nbsp;
<%    }else { %>
		<a href="order.jsp">주문</a>&nbsp;
		<a href="cart_del.jsp">장바구니 비우기</a><br>
<%    }  %>
<hr>
</center>
</body>
</html>