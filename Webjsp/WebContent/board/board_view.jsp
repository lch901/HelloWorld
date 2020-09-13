<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Board_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_data" scope="page" class="com.test.bean.Board_Entity"/>
<jsp:setProperty name="b_data" property="*"/>

<jsp:useBean id="b_query" scope="page" class="com.test.bean.Board_Query"/>

<%
//out.println("data = "+ b_data.toInfoString());
boolean han_yn	 	= ServerInfo.GET_HAN;
try{
	b_query.getSin_Data(b_data);
    //out.println("Msg = "+ b_query.show_msg()); 
	out.println(b_query.Error_show()); 
}catch(Exception e){
	out.println("error ="+ e +"<Br>");
}	 	
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/board_mod.js" ></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" width="776" height=500>
<center>
<img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>

<TABLE border="0" cellpadding="0" cellspacing="0" >
	<TR>	
		<TD width=25><img src="../images/blank.gif" width="25" height="1" alt="" border="0"></TD>
		<!-- body 시작 -->
		<TD width=549 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD width=529 valign=top>
						<TABLE border="0" cellpadding="0" cellspacing="0">
							<TR><TD><img src="../images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<TR>
								<TD background="../images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;게시판 관리</b></font>
								</TD>
							</TR>
							<TR><TD><img src="../images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<TR>
								<TD>
									<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
										<TR><TD colspan=3 height=30 bgcolor="#369BD0" align=center><font size="3" color="#FFFFFF"><b><%=b_data.getTitle(false)%></b></font></TD></TR>
										<TR><TD colspan=3 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
										<TR>
											<TD width=160 height=25>&nbsp;&nbsp;<b>작성자</b> : <%=b_data.getReg_name(han_yn)%></TD>
											<TD width=180 font class=board><b>등록일자</b> : <%= Utility.date_format1(b_data.getReg_date(), ".")%></TD>
											<TD width=180 font class=board><b>조회</b> : <%=b_data.getHit_cnt()%></TD>
										</TR>
										<TR><TD colspan=3 background="../images/board_linebg.gif"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR>
											<TD width=160 height=25>&nbsp;<b> IP</b> : <%=b_data.getIp_num()%></TD>
											<TD width=180 font class=board><b>첨부파일1</b> : 
									<%		if(b_data.getFile_name1(false).trim().length() > 0 ) { %>		
											<a href='../system/download.jsp?file_name1=<%=b_data.getFile_name1(false)%>'><img src="../images/icon/<%=Utility.file_ImgSel(b_data.getFile_name1(false).trim())%>" height="16" alt="" border="0"></a>
									<%		}else { out.println("※ 파일 없음");  }  %>		
											</TD>
										</TR>
										<TR><TD colspan=3 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>

										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=150>
											<TD colspan=3 valign=top align="left">
												<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
													<TR><TD colspan=3><img src="../images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
													<TR><TD colspan=3 align="left"><%= Utility.getBrStr(b_data.getContent(han_yn))%></TD></TR>
													<TR><TD colspan=3><img src="../images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR><TD colspan=3 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR><TD colspan=3 bgcolor="#369BD0" height=25 font class=boardtext align=right>
										<a href="board_reply.jsp?p_num=<%=b_data.getNum()%>">[답글]</a>
										<a href="board_modify.jsp?num=<%=b_data.getNum()%>">[수정]</a> 
										<a href="javascript:send_del()">[삭제]</a>
										<a href="board_list.jsp">[목록보기]</a>&nbsp;&nbsp;</TD></TR>
										<TR><TD colspan=3><img src="../images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
									</TABLE>							
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width=20><img src="../images/blank.gif" width="20" height="1" alt="" border="0"></TD>
				</TR>
			</TABLE>
		</TD>
		<!-- body 끝 -->
	</TR>
</TABLE>
<form  name=frm1  method=POST  action="" enctype="multipart/form-data">
<input type=hidden  name=cmd  value='delete'>
<input type=hidden  name=num  value='<%=b_data.getNum()%>'>
<input type=hidden  name=state value='<%=b_data.getState()%>'>
</form>
</center>
</body>
</html>