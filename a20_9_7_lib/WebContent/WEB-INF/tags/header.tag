<%@ tag body-content="empty" pageEncoding="euc-kr" %>
<%@ attribute name="title" required="true" %>           
<%@ attribute name="level" type="java.lang.Integer" %>
<%
	//required='true' - header태크를 쓰려면  title속성을 반드시써야함.
	//attribute - header태그는 2개의 속성(title,level)을 가짐
	String headStartTag = null;
	String headEndTag = null;
	if (level == null) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 1) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 2) {
		headStartTag = "<h2>";
		headEndTag = "</h2>";
	} else if (level == 3) {
		headStartTag = "<h3>";
		headEndTag = "</h3>";
	}else if (level == 4) {
		headStartTag = "<h4>";
		headEndTag = "</h4>";
	}
	else if (level == 5) {
		headStartTag = "<h5>";
		headEndTag = "</h5>";
	}else if (level == 6) {
		headStartTag = "<h1 style='font-size:30px'>그런짓은 하지말았어야 했는데 그땐 왜 몰랐을까~";
		headEndTag = "~~</h1>";
	}
%>
<%= headStartTag %>
${title}
<%= headEndTag %>
