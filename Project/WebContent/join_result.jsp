<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.*" %>
<jsp:useBean id="member" class="db.MemberVO" scope="page"/>
<jsp:setProperty property="id" name="member"/>
<jsp:setProperty property="pw" name="member"/>
<jsp:setProperty property="nm" name="member"/>
<jsp:setProperty property="tel" name="member"/>
<jsp:setProperty property="email" name="member"/>
<jsp:setProperty property="addr" name="member"/>
<jsp:setProperty property="sex" name="member"/>

<%/* 
	out.println(member.getId());
	out.println(member.getPw());
	out.println(member.getNm());
	out.println(member.getTel());
	out.println(member.getEmail());
	out.println(member.getAddr());
	out.println(member.getSex()); */
	
	
	MemberDAO dao=MemberDAO.getInstance();
	dao.join(member);
	response.sendRedirect("index.jsp?view=login.jsp");
%>