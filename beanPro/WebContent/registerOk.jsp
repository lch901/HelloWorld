<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="pro.*" %> --%>
<%@page import="pro.MemberDBBean"%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mem_uid=request.getParameter("mem_uid");
		String mem_pwd=request.getParameter("mem_pwd");
		String mem_pwd_chk=request.getParameter("mem_pwd_chk");
		String mem_name=request.getParameter("mem_name");
		String mem_email=request.getParameter("mem_email");
		String mem_addr=request.getParameter("mem_addr");
		/* System.out.println(mem_uid);
		System.out.println(mem_pwd);
		System.out.println(mem_pwd_chk);
		System.out.println(mem_name);
		System.out.println(mem_email);
		System.out.println(mem_addr); */
		
		if(!mem_pwd.equals(mem_pwd_chk)){
			response.sendRedirect("register.jsp");
		}
		
		Date date = new Date();
		//System.out.println(date.getYear()+1900+"-"+date.getMonth()+1+"-"+date.getDate());//2020-71-27
		//System.out.println(date);
		String regdate=(date.getYear()+1900)+"-"+(date.getMonth()+1)+"-"+date.getDate();//숫자계산이 잘될수있게 괄호를 해주기
		System.out.println(regdate);
		Timestamp t_regdate=Timestamp.valueOf(regdate);//String을 Timestamp타입으로 변환
		System.out.println(t_regdate);
		
		pro.MemberBean member=new pro.MemberBean();
		member.setMem_uid(mem_uid);
		member.setMem_pwd(mem_pwd);
		member.setMem_name(mem_name);
		member.setMem_email(mem_email);
		member.setMem_regdate(t_regdate);
		member.setMem_addr(mem_addr);
		
		MemberDBBean db=MemberDBBean.getInstance();
		db.getConnection();
		db.insertMember(member);
		
		
	%>
</body>
</html>