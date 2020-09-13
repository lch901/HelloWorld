<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ page contentType="text/html; charset=EUC_KR" %>
<jsp:useBean id="cart" class="com.test.shopp.Shopp_Cart" scope="session"/>
<html>
<head><title>장바구니</title></head>
<body>
<center>
<jsp:include page="top.jsp" flush="true"/>
<table width="500" border="1" >
		  <tr align="center">
		    <td width="50"> 번호 </td>
		    <td width="350"> 제목 </td>
		    <td width="50"> 수량 </td>
		    <td width="50"> 금액 </td>
		  </tr>  
<%  int cnt = cart.getSize();  
    for (int i = 0; i < cnt; i++) {
        Book_Info  book = cart.getBook(i);
	    int num = cart.getNum(i);
%>
		  <tr>
		  	<td align="center"><%= (i+1) %> </td>
		    <td><%= book.getTitle(true) %> </td>
		    <td align="center"><%= num %>권</td>
		    <td align="right"><%= (book.getPrice() * num) %></td>
		  </tr>
<%
    }
%>
</table>
<br>
<%  if(cnt < 1) { %>
         주문 처리될 내용이 없습니다. <a href="index.jsp"> 확인 </a>
<%  }else { %>         
         요청하신 위의 책(들)의  주문이 완료되었습니다. <a href="index.jsp"> 확인 </a>
<%  }  %>         

<% session.invalidate();  %>
<hr>
</center>
</body>
</html>