<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Post_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Post_Query" />
<jsp:useBean id="data" scope="page" class="com.test.bean.Post_Entity" /> 
<jsp:setProperty name="data" property="*"/>           

<%
boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();

String key=request.getParameter("key");
key = (key == null) ?  "a" : key;
if(key.equals("b")) {		
	list  = new Vector();
	try{
		list = b_sel.getMul_Data(request);
		//out.println(b_sel.show_msg()); 
		out.println(b_sel.Error_show()); 
	}catch(Exception e){
		out.println("error ="+ e +"<Br>");
	}	
}   
%> 

<HTML>
<HEAD>
<TITLE>우편번호 찾기</TITLE>
<link rel="stylesheet" href="../edu.css" type="text/css">
<script language="JavaScript" src="./js/member_write.js" ></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
<TABLE border="0" cellpadding="0" cellspacing="0" width=346 >
	<!--<TR><TD colspan=3><img src="./images/post_seach_title.gif" width="474" height="67" alt="" border="0"></TD></TR>-->
	<TR><TD colspan=3><img src="./images/blank.gif" width="1" height="23" alt="" border="0"></TD></TR>
	<TR>
		<!--<TD width=115 rowspan=2 valign=top><img src="./images/post_seach_img.gif" width="115" height="86" alt="" border="0"></TD>-->
		<TD width=346 height=60>찾고자 하는 지역의 ‘동이름’을 입력해 주십시요.<br>예) 서울시 강남구 삼성1동 이라면 ‘삼성1’만 입력하시면 됩니다.</TD>
		<TD width=13 rowspan=2><img src="./images/blank.gif" width="13" height="1" alt="" border="0"></TD>
	</TR>
	<TR>
		<TD>
			<TABLE border="0" cellpadding="0" cellspacing="0" width=346 >
				<TR><TD><img src="./images/post_seach_box_top.gif" width="346" height="15" alt="" border="0"></TD></TR>
				<TR>
					<TD background="./images/post_seach_box_bg.gif">
						<TABLE border="0" cellpadding="1" cellspacing="0" width=346>
						 
							<form name=dong_name method="post" action="member_post.jsp"  >
							<input type="hidden" value="b" name="key">	
							<TR>
								<TD width=20><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD>
								<TD width=100>주소입력</TD>
								<TD width=220>								
								<input type=text name="dongid" size="10" class="form" style="width:120;height:18px;"> 동(읍면)</TD>
								<TD width=77>
								<input type="image"  onclick="postnum(dong_name)" src="./images/button_seach.gif" width="57" height="21" alt="" border="0" align="absmiddle"></TD>
							</TR>
							</form>	

					<%  if("b".equals(key)) {
							for(int i=0; i < list.size() ; i++){						
								Post_Entity pe = (Post_Entity)list.get(i);
								String zipcode = pe.getZipcode();
								String addr_1 = pe.getSido(han_yn)+" "+pe.getGugun(han_yn)+" "+pe.getDong(han_yn)+" "+pe.getRi(han_yn);
					%>  							
							<TR>
								<TD colspan=4><img src="./images/blank.gif" width="1" height="10" alt="" border="0"></TD>
							</TR>
							<TR>
								<TD><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD>
								<TD colspan=3 height=20>
								<A href="javascript:SendAddress('<%=zipcode%>','<%=addr_1%>');" style="text-decoration:none;font-size:12">&nbsp;&nbsp;&nbsp;&nbsp;
									<%=pe.getZipcode()%>&nbsp;&nbsp;&nbsp;&nbsp;
									<%=pe.getSido(han_yn)%>&nbsp;<%=pe.getGugun(han_yn)%>&nbsp;
									<%=pe.getDong(han_yn)%>&nbsp;<%=pe.getRi(han_yn)%>&nbsp;<%=pe.getBunji(han_yn)%><br></a>													
								</TD>
							</TR>
					 	<%  }  %>						
					<% } //우편 번호검색 완료 %>		
						</TABLE>
					</TD>
				</TR>
				<TR><TD>
			    </TD></TR>
			</TABLE>
			<img src="./images/post_seach_box_bottom.gif" width="346" height="15" alt="" border="0">
		</TD>
	</TR>
	<TR><TD colspan=3><img src="./images/blank.gif" width="1" height="20" alt="" border="0"></TD></TR>
	<TR><TD colspan=3 align=center width="346" height=35 bgcolor="#75BE2F"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
</TABLE>
</BODY>
</HTML>
