<%@ page import="com.test.util.Utility" %>
<%
	String u_num 	= Utility.getSession(request, "u_num");//일련번호
	String u_id 	= Utility.getSession(request, "u_id");	//아이디
 	String u_name 	= Utility.getSession(request, "u_name");//성명
 	String u_email	= Utility.getSession(request, "u_email");//이메일
 	String u_allow	= Utility.getSession(request, "u_allow");//권한(회원구분 일반-M, 특별 - S)
%>