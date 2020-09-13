<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Member_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>

<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Member_Query" />

<%
Utility  util = new Utility();
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
String today = formatter.format(new java.util.Date());


boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();//결과를 저장하기 위한 무한배열 생성
try{
	list = b_sel.getMulti_Data(request); //회원리스트를 얻는다.
	//out.println(b_sel.show_msg()); //빈즈를 통한 특정 메세지 얻기
	out.println(b_sel.Error_show()); //빈즈에서 발생된 에러 메세지 얻기
}catch(Exception e){	out.println("error ="+ e +"<Br>"); }	
int cnt = list.size(); //회원 인원수를 얻는다.
%>			

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="../ssem.css" type="text/css">
<script language="JavaScript" src="./js/member_write.js" ></script>
</HEAD>

<BODY bgcolor="#ffffff" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" width="776" height=500>
<center>
<img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>
<TABLE border="0" cellpadding="0" cellspacing="0" >
	<TR>	
		<TD width=25><img src="../images/blank.gif" width="25" height="1" alt="" border="0"></TD>
		
		
		<%	String all = request.getParameter("all");
			if(all == null) all="off";
			
			String s_year = request.getParameter("s_year");
			String s_month = request.getParameter("s_month");
			String s_day = request.getParameter("s_day");
			String e_year = request.getParameter("e_year");
			String e_month = request.getParameter("e_month");
			String e_day = request.getParameter("e_day");
						
			String s_date = "";
			String e_date = "";
			if(s_year != null) {
				s_date = s_year + s_month + s_day;
				e_date = e_year + e_month + e_day;				
			}else {
				s_date = today;
				e_date = today;			
			}
		%>			
		
		
		
		<!-- body 시작 -->
		<TD width=549 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD width=529 valign=top>
						<TABLE border="0" cellpadding="0" cellspacing="0">
							<TR><TD><img src="../images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<TR>
								<TD background="../images/page_title_bg.gif" width=529 height=44>
									<font size=3 color="#FFFFFF"><b>&nbsp;회원 관리</b></font>
								</TD>
							</TR>
			<form  name=frm1  action=""  method="GET" >
			<input type='hidden' name='s_date' value='<%=s_date%>'> 
			<input type='hidden' name='e_date' value='<%=e_date%>'> 
			<input type='hidden' name='cmd' value=''> 

							<TR><TD><img src="../images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>

							<TR>
								<TD height=30 valign=top>
									<select name="s_year" class="form"> <!--이거는 년도선택박스입니다-->
									<%  if(s_year == null)  out.println(util.combo_yy(today));									
										else  out.println(util.combo_yy(s_date));
									%>	
									</select>
									<!--<input type=hidden name=combo1 value="null"> //고정시키기 위한 히든값2 -->
									<select name="s_month" class="form"> <!--이거는 월선택박스입니다-->
									<%  if(s_month == null) out.println(util.combo_mm(today));									
										else  out.println(util.combo_mm(s_date));
									%>	
									</select>
									<!--<input type=hidden name=combo2 value="null"> //고정시키기 위한 히든값3 -->
									<select name="s_day" class="form"> <!--이거는 월선택박스입니다-->
									<%  if(s_day == null) out.println(util.combo_dd(today));									
										else out.println(util.combo_dd(s_date));
									%>	
									</select> ~ 
									<select name="e_year" class="form"> <!--이거는 년도선택박스입니다-->
									<%  if(e_year == null) out.println(util.combo_yy(today));									
										else  out.println(util.combo_yy(e_date));
									%>	
									</select>
									<!--<input type=hidden name=combo1 value="null"> //고정시키기 위한 히든값2 -->
									<select name="e_month" class="form"> <!--이거는 월선택박스입니다-->										
									<%  if(e_month == null) out.println(util.combo_mm(today));									
										else  out.println(util.combo_mm(e_date));
									%>	
									</select>
									<!--<input type=hidden name=combo2 value="null"> //고정시키기 위한 히든값3 -->
									<select name="e_day" class="form"> <!--이거는 월선택박스입니다-->
									<%  if(e_day == null)  out.println(util.combo_dd(today));									
										else  out.println(util.combo_dd(e_date));
									%>	
									</select>&nbsp;
									
									<input type="checkbox" name="all"  value="on" <% if(all.equals("on")) out.println(" checked "); %>>전체검색
									<a href="javascript:check()"><img src="./images/button_seach.gif" width="54" height="19" alt="" border="0" align=absmiddle></a>
								</TD>
							</TR>



							<TR><TD><img src="../images/blank.gif" width="1" height="15" alt="" border="0"></TD></TR>
							<tr> <td>총 게시물수 :  <%=b_sel.getTotal()%> 개 Page : <%=b_sel.getCurrent_page()%> / <%=b_sel.getTotal_page()%> </td></tr>
							<TR>
								<TD>
									<TABLE border="0" cellpadding="0" cellspacing="0" width="529">
										<TR><TD colspan=10 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
										<TR>
										
											<TD width=20 height=30>
											<input type="checkbox" name="no_all"  value="1" 
								<%  if(cnt >= 1) { out.println(" onClick='javascript:selectall();'"); }
								%>			/>
											</TD>
											<TD align=center  width=50 font class=board>No.</TD>
											<TD width=50 font class=board>성명</TD>
											<TD width=60 font class=board>아이디</TD>
											<TD width=170 font class=board>이 &nbsp; 메 &nbsp; 일 &nbsp;</TD>
											<TD width=60 font class=board>등록일자</TD>
											<TD align=center width=100 font class=board>회원구분 </TD>
											<TD width=30 font class=board>상태</TD>
										</TR>
										<TR><TD colspan=10 bgcolor="#8E8E8E"><img src="../images/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
								<%
									int number = b_sel.getMax();
									////벡터에서 데이타 얻어 리스트 출력
									for(int i = 0; i <cnt; i++){
										Member_Entity me = (Member_Entity)list.get(i);
								%>

										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " height=25>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>
											<input type="checkbox" name="num"  value="<%=me.getNum()%>">
											</TD>
											<TD align=center><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=(number--)%></TD>
											<TD align=left><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><a href="member_view.jsp?num=<%=me.getNum()%>">
										<%	if("Y".equals(me.getState())) {  out.println(me.getName(han_yn)); }
											else { out.println("<font color=#FF0000>"+me.getName(han_yn)+"</font>"); }
										%></a></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=me.getId()%></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><a href="mailto:<%=me.getEmail()%>"><%=me.getEmail()%></a></TD>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><%=Utility.date_format1(me.getReg_date(), ".")%></TD>
										 	<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>
										 	<input type="radio" name="access1_<%=me.getNum()%>"  value="M" <% if("M".equals(me.getAccess1())){out.println(" checked");}%>>일반
											<input type="radio" name="access1_<%=me.getNum()%>"  value="S" <% if("S".equals(me.getAccess1())){out.println(" checked");}%>>특별
											</TD>
										<%	if("Y".equals(me.getState())) {   %>	
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br>정상</TD>
										<%	} else {   %>
											<TD><img src="../images/blank.gif" width="1" height="3" alt="" border="0"><br><a href="member_process.jsp?num=<%=me.getNum()%>&cmd=rec">복원</a></TD>
										<%	}  %>	
										</TR>
										<TR><TD colspan=10 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<%	} 
									if(cnt < 1 ) {	 %>
										<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=25>
											<TD colspan=10 align="center" > 해당된 데이타가 없습니다!</TD>
										</TR>
										<TR><TD colspan=10 bgcolor="#D4D0C8"><img src="../images/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								
								<%	}   %>
										<TR>
											<TD colspan=10 bgcolor="#369BD0" height=25 align=center>
												<TABLE border="0" cellpadding="0" cellspacing="0" width=529>
													<TR>
														<TD width=329 font class=boardnum align=center><%= b_sel.getPage_navi()%></TD>
														<TD width=200 font class=boardtext align=right><a href="member_write.jsp">[회원등록]</a> 
														<a href="javascript:send_del()">[삭제]</a>
														<a href="javascript:send_mod()">[수정]</a>
														<a href="member_excel.jsp">[Excel]</a></TD>
													</TR>
												</TABLE>
											</TD>
										</TR>
										
										
								<%		String  s_key = request.getParameter("s_key");
										String  s_str = request.getParameter("s_str");
										if(s_str == null) s_str="";
										else s_str = Utility.han(s_str);
								%>		
										<TR>
											<TD colspan=10 bgcolor="#035F8E" height=30>
												&nbsp;&nbsp;&nbsp;&nbsp;<select name="s_key" class="form"> 
			                                        <option value="name" <% if("name".equals(s_key)) out.println(" selected "); %>>성 명</option>
			                                        <option value="id" <% if("id".equals(s_key)) out.println(" selected "); %>>아이디</option>
			                                        <option value="email" <% if("email".equals(s_key)) out.println(" selected "); %>>이메일</option>			
												</select>
												<!--<a href="javascript:check()"><img src="images/button_seach.gif" width="54" height="19" alt="" border="0" align=absmiddle></a> -->
												&nbsp;&nbsp;<input type=text name="s_str" value='<%=s_str%>' class="form" style="width:100;height:18px;"><input type="Button" value="검색" onClick="javascript:check();" class=form>
											</TD>
										</TR>
								</form>
										
										
										<TR><TD colspan=10><img src="../images/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>									</TABLE>							
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
</center>
</body>
</html>