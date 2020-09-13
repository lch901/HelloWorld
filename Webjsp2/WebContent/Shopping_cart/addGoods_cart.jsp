<%@ page import="com.test.shopp.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=EUC_KR" %>

<jsp:useBean id="book" class="com.test.shopp.Book_Info" />
<jsp:setProperty name="book" property="*" />

<jsp:useBean id="cart" class="com.test.shopp.Shopp_Cart" scope="session"/>

<%    cart.addGoods(book);     %>

<jsp:forward page="cart_view.jsp"/>


