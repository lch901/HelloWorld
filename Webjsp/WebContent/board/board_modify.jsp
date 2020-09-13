<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Board_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_data" scope="page" class="com.test.bean.Board_Entity"/>
<jsp:setProperty name="b_data" property="*"/>
<jsp:useBean id="b_query" scope="page" class="com.test.bean.Board_Query"/>

<%  
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today	= formatter.format(new java.util.Date());
System.out.println("today = " + today);

//out.println("data = "+ b_data.toInfoString());
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
<img src="./images/blank.gif" width="1" height="3" alt="" border="0"><br>
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
							<form  name="frm1"  action=""  method="POST" enctype="multipart/form-data">
							<input type='hidden' name='cmd' value='update'> <!-- 작업구분 -->
							<input type='hidden' name='ip_num' value='<%=request.getRemoteAddr()%>'> <!-- ip 얻기 -->
							<input type='hidden' name='num' value='<%=b_data.getNum()%>'> 
							<TR>
								<TD background="../images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;게시판 관리</b></font>
								</TD>
							</TR>
							<TR><TD><img src="../images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<TR>
								<TD>
									<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
										<TR><TD colspan=2 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
										<TR>
											<TD width=129 height=30 bgcolor="#369BD0" align=center><font color="#ffffff">* 작성자명</font></TD>
											<TD width=400 font class=board>&nbsp;&nbsp;<%=b_data.getReg_name(false)%></TD>
										</TR>
										<TR><TD colspan=2 background="../images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR>
											<TD width=129 height=30 bgcolor="#369BD0" align=center><font color="#ffffff">* 제&nbsp;&nbsp;&nbsp;&nbsp;목</font></TD>
											<TD font class=board>&nbsp;&nbsp;<input type=text name="title" class="form" style="width:370;height:18px;" value='<%=b_data.getTitle(false)%>'></TD>
										</TR>
										<TR><TD colspan=2 background="../images/board_linebg.gif"><img src="./images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR>
											<TD width=129 height=210 bgcolor="#369BD0" align=center><font color="#ffffff">* 내&nbsp;&nbsp;&nbsp;&nbsp;용</font></TD>
											<TD font class=board>&nbsp;&nbsp;<textarea name="content" class="form" style="width:370;height:200px;" ><%=b_data.getContent(false)%></textarea></TD>
										</TR>
										<TR><TD colspan=2 background="../images/board_linebg.gif"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR>
											<TD width=129 height=50 bgcolor="#369BD0" align=center><font color="#ffffff">첨부파일</font></TD>
											<TD font class=board>
												&nbsp;파일1:<input type="file" name="file_name1" size=15 class="form">
								<%			if(b_data.getFile_name1(false).length() > 0 ) {  %>
												(<%=b_data.getFile_name1(false)%>)&nbsp;<input type="checkbox" name="f_del1" value="ok">삭제<br>
								<%			} %>
											</TD>
										</TR>
										<TR><TD colspan=9 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
										<TR><TD colspan=9 bgcolor="#035F8E" height=25 font class=boardtext align=right>
										<a href="board_list.jsp">[목록보기]</a> 
										<a href="javascript:send()">[등록]</a> 
										<a href="javascript:history.back()">[취소]</a>&nbsp;&nbsp;
										</TD></TR>
									</TABLE>							
								</TD>
							</TR>
							</form>
						</TABLE>
					</TD>
					<TD width=20><img src="../images/blank.gif" width="20" height="1" alt="" border="0"></TD>
				</TR>
			</TABLE>
		</TD>
		<!-- body 끝 -->
	</TR>
</TABLE>
</center>
</body>
</html>