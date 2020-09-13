<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Board_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Board_Query" />

<%
boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();
try{
	list = b_sel.getMulti_Data(request);
	//out.println(b_sel.show_msg()); 
	out.println(b_sel.Error_show()); 
}catch(Exception e){
	out.println("error ="+ e +"<Br>");
}	
int cnt = list.size();
%>	

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/board_write.js" ></script>
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
							<!--<TR>
								<TD background="../images/notice_title.gif" width="529" height="56" align=right valign=bottom></TD>
							</TR>
							-->
							<TR>
								<TD background="../images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;게시판 관리</b></font>
								</TD>
							</TR>

							<TR><TD><img src="../images/blank.gif" width="1" height="25" alt="" border="0"></TD></TR>
							<tr><td>총 게시물수 :  <%=b_sel.getTotal()%> 개 Page : <%=b_sel.getCurrent_page()%> / <%=b_sel.getTotal_page()%> </td></tr>
							<TR>
								<TD>
							<form  name=frm2  action=""  method="POST" >
							<input type='hidden' name='cmd' value='multi_del'> 		
									<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
										<TR><TD colspan=8 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
										<TR align=center>
											<TD width=30 height=30>
											<input type="checkbox" name="no_all"  value="1" 
								<%  if(cnt >= 1) {out.println("onClick='javascript:selectall(1);'"); }
								%>	/>
											</TD>
											<TD width=30 font class=board>No.</TD>
											<TD width=70 font class=board>작성자</TD>
											<TD width=230 font class=board>제&nbsp;&nbsp;&nbsp;&nbsp;목</TD>
											<TD width=30 font class=board>파일</TD>
											<TD width=80 font class=board>등록일자</TD>
											<TD width=50 font class=board>조회수</TD>
											<TD width=30 font class=board>상태</TD>
										</TR>
										<TR><TD colspan=8 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
								<%  
									int number = b_sel.getMax();
									for(int i = 0; i < cnt; i++){
										Board_Entity be = (Board_Entity)list.get(i);
								%>
										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=25>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><input type="checkbox" name="no"  value="<%=be.getNum()%>"></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=(number--)%></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=be.getReg_name(han_yn)%></TD>
											
										<%	if(be.getDoc_step() == 0){ //부모글일 경우 	%>	
											   <TD align=left><img src="../images/blank.gif" width="1" height="3" alt="" border="0">
											   <a href="board_view.jsp?num=<%=be.getNum()%>">
										<%	if("Y".equals(be.getState())) {  out.println(be.getTitle(han_yn)); }
											else { out.println("<font color=#FF0000>[del]"+be.getTitle(han_yn)+"</font>"); }
										%>     </a>
											   </TD>
										<%	} else { //답글일 경우
												int xpos = 0;
												int title_length = 0;
												int title_end_value = 0;
												String blank_f = "";
	
												for (xpos=0; xpos < be.getDoc_pos(); xpos++) { blank_f += "&nbsp;&nbsp;&nbsp;"; }
												blank_f += "<img src='../images/reply.gif' align='absmiddle' border='0'>";
										%>	
											    <TD align=left><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>
								   				<%=blank_f%><a href="board_view.jsp?num=<%=be.getNum()%>">
								   		<%	if("Y".equals(be.getState())) {  out.println(be.getTitle(han_yn)); }
											else { out.println("<font color=#FF0000>[del]"+be.getTitle(han_yn)+"</font>"); }
										%>		</a>
								   				</TD>
										<%  }  %>
										<%  if(be.getFile_name1(han_yn).trim().length() > 0 ) {  %>
										       <TD><img src="../images/icon/<%=Utility.file_ImgSel(be.getFile_name1(han_yn).trim())%>"   alt="" border="0"></TD>
										<%	}else { %>
											   <TD>&nbsp;</TD>
										<%	}  %>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=Utility.date_format1(be.getReg_date(), ".")%></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=be.getHit_cnt()%></TD>
										<%	if("Y".equals(be.getState())) {   %>	
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>정상</TD>
										<%	} else {   %>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><a href="board_process.jsp?cmd=recovery&num=<%=be.getNum()%>&state=N">복원</a></TD>
										<%	}  %>	
										</TR>
										<TR><TD colspan=10 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<%	} 
									if(cnt < 1 ) {	 %>
										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=25>
											<TD colspan=8 align="center" > 해당된 데이타가 없습니다!</TD>
										</TR>
										<TR><TD colspan=8 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<%	}   %>
							</form>	
								<%		String query = request.getQueryString();  
										if(query == null) query ="";
								%>
										<TR>
											<TD colspan=8 bgcolor="#369BD0" height=25 align=center>
												<TABLE border="0" cellpadding="0" cellspacing="0" width=529>
													<TR>
														<TD width=329 font class=boardnum  align="center"><%= b_sel.getPage_navi()%></TD>
														<TD width=200 font class=boardtext align=right><a href="board_write.jsp?<%=query%>">[글쓰기]</a> 
														<a href="javascript:multi_del()">[삭제]</a>&nbsp;&nbsp;</TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
			
									<form  name=frm1  action=""  method="GET" >
									<!--<input type='hidden' name='cmd' value=''> -->
										
								<%		String  s_key = request.getParameter("s_key");
										String  s_str = request.getParameter("s_str");
										if(s_str == null) s_str="";
										s_str = Utility.han(s_str);
								%>		
										<TR>
											<TD colspan=8 bgcolor="#035F8E" height=30>
												&nbsp;&nbsp;&nbsp;&nbsp;<select name="s_key" class="form"> 
													<option value="all" <% if("all".equals(s_key)) out.println(" selected "); %>>전체</option>
			                                        <option value="title" <% if("title".equals(s_key)) out.println(" selected "); %>>제목</option>
			                                        <option value="reg_name" <% if("reg_name".equals(s_key)) out.println(" selected "); %>>작성자</option>
			                                        <option value="content" <% if("content".equals(s_key)) out.println(" selected "); %>>내용</option>			
												</select>
												<!--<a href="javascript:check()"><img src="/images/button_seach.gif" width="54" height="19" alt="" border="0" align=absmiddle></a> -->
												&nbsp;&nbsp;<input type=text name="s_str" value='<%=s_str%>' class="form" style="width:100;height:18px;"><input type="Button" value="검색" onClick="javascript:check();" class=form>
											</TD>
										</TR>
									</form>	
										<TR><TD colspan=8><img src="../images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>									
									</TABLE>							
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width=20><img src="/images/blank.gif" width="20" height="1" alt="" border="0"></TD>
				</TR>
			</TABLE>
		</TD>
		<!-- body 끝 -->
	</TR>
</TABLE>
</center>
</body>
</html>