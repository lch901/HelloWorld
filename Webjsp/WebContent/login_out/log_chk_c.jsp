<%@ page import=" com.test.util.Utility" %>
<%@ page contentType="text/html; charset=euc-kr" %>

<%
  //로그인을 했는지 체크
  if( Utility.getSession(request, "u_id") == null ){
   System.out.println("u_id = "+ Utility.getSession(request, "u_id"));
	String c_QueryString = request.getQueryString();		
	if(c_QueryString == null){
		c_QueryString = "";
	}
	else{
		 c_QueryString = "?"+ c_QueryString;
	}
%>
	<meta http-equiv="REFRESH" content="0;url=./login.jsp?url=<%=request.getRequestURI()%><%=Utility.paramToString(c_QueryString)%>">	
<%	
	out.close();
	return;	
  }
%>
