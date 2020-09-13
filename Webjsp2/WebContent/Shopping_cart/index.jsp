<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=EUC_KR" %>
<jsp:useBean id="sel" scope="page" class="com.test.shopp.Book_Info_Query" />

<html><head><title>쇼핑몰 - 장바구니</title></head>
<body>
<center>
<jsp:include page="top.jsp" flush="true"/><br><br>
<h3>추천 도서 리스트</h3>
<hr>
<%
	Vector list = new Vector();
    try {
        list = sel.getMainMulti_Data(request);
    }catch(Exception e){
		out.println("error ="+ e +"<Br>");
	}	
%>
<table width="500"  border="1">
  <tr align="center">
    <td> 책제목 </td><td> 저  자 </td><td> 가격(원)</td><td> 장바구니에 담기</td>
  </tr>
<%
    for(int i = 0; i < list.size(); i++) {
        Book_Info  data = (Book_Info) list.elementAt(i);
%>
	  <tr align="center">
		<td> <a href="book_view.jsp?num=<%= data.getNum() %>"><%= data.getTitle(false) %> </a></td>
		<td> <%= data.getAuthor(false) %> </td>
		<td> <%= data.getPrice() %> </td>
		<td> 
		 <form method="post" action="addGoods_cart.jsp">
		  <input type="hidden" name="num" value="<%= data.getNum() %>">
		  <input type="hidden" name="title" value="<%= data.getTitle(false) %>">
		  <input type="hidden" name="author" value="<%= data.getAuthor(false) %>">
		  <input type="hidden" name="company" value="<%= data.getCompany(false) %>">
		  <input type="hidden" name="price" value="<%= data.getPrice() %>">
		  <input type="submit" value="장바구니에 담기">
	  	 </form>
	   </td>
	  </tr>
<%  }
    if(list.size() < 1) {
%>
	  <tr>
        <td colspan="4" align="center"> 추천 도서가 없습니다.</td>
      </tr>
<%  }  %>
</table>
<hr>
</center>
</body>
</html>