<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="/error.jsp" %>
<%@ page contentType="text/html; charset=EUC_KR" %>
<jsp:useBean id="cart" class="com.test.shopp.Shopp_Cart" scope="session"/>
<%
    try {
        int num = Integer.parseInt(request.getParameter("num"));
        cart.removeGoods(num);
    } catch(Exception e) {
        out.println("error ="+ e +"<Br>");
    }
%>
<jsp:forward page="cart_view.jsp"/>
