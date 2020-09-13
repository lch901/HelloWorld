<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Member_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_data" scope="page" class="com.test.bean.Member_Entity"/>
<jsp:setProperty name="b_data" property="*"/>
<jsp:useBean id="b_query" scope="page" class="com.test.bean.Member_Query"/>

<%
boolean han_yn = ServerInfo.GET_HAN;
try{
	b_query.getSin_Data(b_data);
    //out.println("Msg = "+ b_query.show_msg()); 
	//out.println(b_query.Error_show()); 
}catch(Exception e){
	out.println("error ="+ e +"<Br>");
}	 	
%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/member_write.js" ></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" width="776" height=500>
<center>
<img src="./images/blank.gif" width="1" height="3" alt="" border="0"><br>
<TABLE border="0" cellpadding="0" cellspacing="0" >
	<TR>
		<TD width=25><img src="./images/blank.gif" width="25" height="1" alt="" border="0"></TD>
		<!-- body 시작 -->
		<TD width=549 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD width=529 valign=top>
						<TABLE border="0" cellpadding="0" cellspacing="0">
							<TR><TD><img src="./images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<TR><TD colspan=2 background="./images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;회원 관리(정보보기)</b></font>
								</TD>
							</TR>
							<TR><TD colspan=2><img src="./images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<TR><TD colspan=2 bgcolor="#8E8E8E"><img src="images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
							<TR><TD colspan=2><img src="./images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
							<TR>
								<TD width=129 height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 작성자명</font></TD>
								<TD width=400 font class=board>&nbsp;&nbsp;<%=b_data.getName(han_yn)%></TD>
							</TR>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25  bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* I &nbsp;&nbsp; D</font></td>
								<td>&nbsp;&nbsp;<%=b_data.getId()%></td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25  bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* E-mail</font> </td>
								<td>&nbsp;&nbsp;<%=b_data.getEmail()%></td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25  bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 핸드폰</font> </td>
								<td>&nbsp;&nbsp;<%=b_data.getTel()%></td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 우편번호</font></td>
								<td>&nbsp;&nbsp;<%=b_data.getPost()%></td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 주&nbsp;&nbsp;소</font></td>
								<td>&nbsp;&nbsp;<%=b_data.getAddr_1(han_yn)%></td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 상세 주소</font></td>	
								<td>&nbsp;&nbsp;<%=b_data.getAddr_2(han_yn)%></td>
							</tr>	
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<TR>
								<TD height=50 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 하고싶은 말</font> </TD>
								<TD font class=board>&nbsp;&nbsp;<%=Utility.getBrStr(b_data.getComment1(han_yn))%></TD>
							</TR>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<tr>
								<td height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 권한(구분)</font> </td>
								<td>
								<%  String acc = b_data.getAccess1();   %>
									&nbsp;&nbsp;<input type="radio" name="access1"  value="M" <% if("M".equals(acc)) out.println(" checked "); %>>일반회원
									&nbsp;&nbsp;<input type="radio" name="access1"  value="S" <% if("S".equals(acc)) out.println(" checked "); %>>특별회원
								</td>
							</tr>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<TR>
								<TD height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 가입일자</font> </TD>
								<TD font class=board>&nbsp;&nbsp;<%=Utility.date_format1(b_data.getReg_date(),".")%></TD>
							</TR>
							<TR><TD colspan=2 background="./images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<TR>
								<TD height=25 bgcolor="#369BD0"><font color="#ffffff">&nbsp;&nbsp;* 상태 </font></TD>
								<TD font class=board>&nbsp;&nbsp;
								<%  String st = b_data.getState(); 
									if("Y".equals(st)) out.println("정상");
									else out.println("탈퇴");
								%>	</TD>
							</TR>
							<TR><TD colspan=2 bgcolor="#8E8E8E"><img src="./images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
							<TR><TD colspan=2><img src="./images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
							<TR>
							    <TD colspan=9 bgcolor="#369BD0" height=25 font class=boardtext align=right>
							      <a href="member_list.jsp">[목록보기]</a>
							      <a href="member_modify.jsp?num=<%=b_data.getNum()%>">[수정]</a>
							      <a href="member_process.jsp?cmd=delete&num=<%=b_data.getNum()%>">[삭제]</a>
							    </TD>
						 	</TR>
						</TABLE>
					</TD>
				</TR>
				</form>
			</TABLE>
		</TD>
	</TR>
</TABLE>
</center>
</body>
</html>