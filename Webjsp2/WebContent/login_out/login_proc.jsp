<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page import=" com.test.util.Utility" %>
<jsp:useBean id="bean" scope="page" class="com.test.bean.Login_Query"/>
<%
	String   url = "";
	int result = 0; 
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("passwd");
	
	try{
		result = bean.getSys_LoginChk(id, pwd, request);
		//out.println(bean.show_msg()); 
		//out.println(bean.Error_show()); 
	}catch(Exception e){
		out.println("error ="+ e +"<Br>");
	}	

	if(result == 2 ){
	     String temp = request.getParameter("url");
	     if(temp == null) temp = "";	
	     if(temp.length() > 0 ){
		  	url = Utility.stringToParam(temp);
	     }else{
		  	url = "./index2.jsp";
	     }	
	     response.sendRedirect(url);
%>
<%	}else if(result == 3) {  %>
	   <script language="JavaScript">
		    alert("패스워드가 틀려요! 다시 확인해주세요!! ");
	   </script>	
<%	}else {  %>	   
       <script language="JavaScript">
	 		alert("아이디가 틀려요! 다시 확인해주세요!! ");
	   </script>	
<%	}	%>

<meta http-equiv="REFRESH" content="0;url=./login.jsp">