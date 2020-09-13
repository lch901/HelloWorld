<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Member_Query" />

<%	String id = request.getParameter("id");
	String c_id="";
	boolean data_yn = false;
	if(id != null) {
		c_id = id;
		try{
			data_yn = b_sel.getIdcheck(id);
		    //out.println("Msg = "+ b_sel.show_msg()); 
			//out.println(b_sel.Error_show()); 
		}catch(Exception e){
			out.println("error ="+ e +"<Br>");
		}
	}  
%>

<HTML>
<HEAD>
<TITLE>아이디 검색</TITLE>
<link rel="stylesheet" href="../seem.css" type="text/css">
<script language="JavaScript" src="./js/member_write.js" ></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
<TABLE border="0" cellpadding="0" cellspacing="0" width=370 >
<!--	<TR><TD colspan=3><img src="./images/post_seach_title.gif" width="474" height="67" alt="" border="0"></TD></TR>-->
	<TR><TD colspan=3><img src="./images/blank.gif" width="1" height="23" alt="" border="0"></TD></TR>
	<TR>
<!--		<TD width=115 rowspan=2 valign=top><img src="./images/post_seach_img.gif" width="115" height="86" alt="" border="0"></TD>-->
		
	<%  if(id == null) { %>
		<TD width=346 height=60>※ 사용하고자 하는 ID를 입력해 주십시요.<br>※ 영문과 숫자의 조합으로 4자이상 8자 이하로 가능합니다..</TD>
	<%	}else {	
			if(data_yn) {		
	%>
			<TD width=346 height=60 align=center>사용 가능한 아이디 입니다...</TD>
		<%	}else { %>
			<TD width=346 height=60 align=center>아이디가 이미 존재합니다...</TD>
	<%  	}
		} %>	
		<TD width=13 rowspan=2><img src="./images/blank.gif" width="13" height="1" alt="" border="0"></TD>
	</TR>
	<TR>
		<TD>
			<TABLE border="0" cellpadding="0" cellspacing="0" width=346 >
				<TR><TD><img src="./images/post_seach_box_top.gif" width="346" height="15" alt="" border="0"></TD></TR>
					<TR></tr><TD background="./images/post_seach_box_bg.gif">
						<TABLE border="0" cellpadding="1" cellspacing="0" width=346>
							<form name=p_id method="post" action="member_id.jsp"  >							
							<TR>
								<TD width=20><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD>
								<TD width=60></TD>
								<TD width=189>
									<input type=text name="id"  size="8" maxlength="8" class="form" style="width:120;height:18px;" value="<%=c_id%>">
								</TD>
								<TD width=77>
									<input type="Button" value="조 회" onClick="javascript:checkid(p_id);" class=form> 
								</TD>
							</TR>
							<TR>
								<TD colspan=4><img src="./images/blank.gif" width="1" height="5" alt="" border="0"></TD>
							</TR>
							</form>
						</TABLE>
			    </TD></TR>
			</TABLE>
			<img src="./images/post_seach_box_bottom.gif" width="346" height="15" alt="" border="0">
		</TD>
	</TR>
	<TR align=center>
		<TD colspan=3> 
		    <input type="Button" value="확 인" onClick="javascript:SendId('<%=c_id%>');" class=form> 
			<input type="Button" value="취 소" onClick="javascript:window.close();" class=form>
		</TD>	
	</TR>
	<TR><TD colspan=3><img src="./images/blank.gif" width="1" height="20" alt="" border="0"></TD></TR>
	<TR><TD colspan=3 align=center height=35 bgcolor="#75BE2F"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
</TABLE>
</BODY>
</HTML>
