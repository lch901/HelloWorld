<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ page contentType="text/html; charset=EUC_KR" %>

<jsp:useBean id="sel" scope="page" class="com.test.shopp.Category_Query" />

<html><head><title> 장바구니</title></head>
<body>
<center>
<jsp:include page="top.jsp" flush="true"/>
<h3>책 분류</h3>
<hr>
<%
  try{
    Vector list = sel.getMulti_Data(request);
    for (int i = 0; i < list.size(); i++) {
        Category data = (Category) list.elementAt(i);
%>
        <a href="cate_book_list.jsp?num=<%= data.getNum() %>"> <%= data.getName(false) %></a><br><br>
<%
    }
  }catch(Exception e){
	 out.println("error ="+ e +"<Br>");
  }
%>
<hr>
</center>
</body>
</html>