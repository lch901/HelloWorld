<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ tag import="java.util.Calendar"%>
<%
	Calendar cal=Calendar.getInstance();
	out.print(cal.get(Calendar.YEAR)+"년");
	out.print(cal.get(Calendar.MONTH)+1+"월");
	out.print(cal.get(Calendar.DATE)+"일");
	out.print(cal.get(Calendar.HOUR)+"시");
	out.print(cal.get(Calendar.MINUTE)+"분");
	out.print(cal.get(Calendar.SECOND)+"초");

%>
