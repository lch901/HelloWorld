<%@ page contentType="text/html; charset=euc-kr" %> 
<HTML>
<HEAD>
<TITLE>사용자 인증 처리</TITLE>
<link rel="stylesheet" href="./main.css" type="text/css">
<script language="javascript">
<!--
function login() {
	if(frm.user_id.value==""){
		alert("아이디를 입력해주세요");
		frm.user_id.focus();
	}else if(frm.passwd.value=="") {
		alert("비밀번호를 입력해주세요");
		frm.passwd.focus();
	}else {
		frm.submit();
	}
}

function chk_enter() {
	if(event.keyCode == 13)	{
	 login();
	}
}
//-->
</script>
</HEAD>

<BODY bgcolor="#D7D7D7" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" height=350>
<center>
<TABLE width="480" border="0" cellpadding="0" cellspacing="0" background="./img/index_page_bg.gif" bgcolor="#ffffff">
	<jsp:include page="./log_info.jsp" flush="true"/>
	<TR><TD><img src="./img/main1.jpg" width="480" border="0"></TD></TR>
	<TR><TD><img src="./im/blank.gif" width="1" height="20" alt="" border="0"></TD></TR>
	<TR>	
		<TD width="100%" height=300 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD>
					<!-- 로그인 시작 -->
					<table width="400" border="0" cellspacing="0" cellpadding="0">
					<%	String url = request.getParameter("url");
						if(url == null) url = "";
					%>	                          
					    <form name="frm" method="post" action="login_proc.jsp">
					    <input type=hidden  name=url value='<%=url%>' >
                            <tr> 
                              <td width="97" rowspan="2"><img src="./img/login_img.gif" width="90" height="129"></td>
                              <td height="47" valign="bottom"><img src="./img/login_txttit.gif" width="54" height="23"></td>
                            </tr>
                            <tr> 
                              <td bgcolor="#EEEEEE"  style="padding:10;" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="77%">
					   				<table width="100%" border="0" cellpadding="0" cellspacing="3">
                                        <tr> 
                                          <td align="center"><img src="./img/login_txt_id.gif" width="25" height="17" hspace="5"> 
                                            <input type="text" name="user_id" style="border-width:1; border-color:#979797; width:108; height:20;" ></td>
                                        </tr>
                                        <tr> 
                                          <td align="center"><img src="./img/login_txt_pw.gif" width="25" height="17" hspace="5"> 
                                            <input type="password" name="passwd" style="border-width:1; border-color:#979797; width:108; height:20;" onkeypress="chk_enter();"></td>
                                        </tr>
                                      </table></td>
                                    <td width="23%"><a href="javascript:login()"><img src="./img/login_bt_login.gif" width="48" height="48" border=0></a></td>
                                  </tr>
                                </table></td>
                            </tr>
                          </form>
                        </table>
                        <br>
                        <table border="0" cellspacing="3" cellpadding="0">
                          <tr> 
                            <td  width="400" align=center >
                            <a href="#"><img src="./img/login_bt_join.gif" border="0"></a>
                            <a href="#"><img src="./img/login_bt_search_idpw.gif" border="0" ></a>
                            </td>                         
                          </tr>
                        </table>
					<!-- 로그인 끝 -->
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR><TD><img src="./img/copyright.gif" width="480" height="79" alt="" border="0"></TD></TR>
</TABLE>
</center>
</BODY>
</HTML>
