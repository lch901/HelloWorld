<%@ page import="com.test.util.Utility" %>
	<!-- login menu 등 시작 -->
	<TR>
		<TD width="480">
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD background="./img/loginmenu_bg.gif" width="240"></TD>
					<TD background="./img/loginmenu_bg.gif" width="240" height="23" align=right>
						<TABLE border="0" cellpadding="0" cellspacing="0">
							<tr>
								<TD widht=56><a href="./index2.jsp"><img src="./img/menu_home.gif" border="0"></a></TD>
								<TD widht=72><a href="#"><img src="./img/menu_notice.gif" border="0"></a></TD>
							<% if(Utility.getSession(request, "u_id") == null)	{  %>
								<TD widht=85 align=center><a href="./login.jsp"><img src="./img/menu_login.gif" border="0"></a><!-- login 후에 menu_logout.gif 로 바뀜 --></TD>
								<TD widht=85><a href="#"><img src="./img/menu_join.gif" border="0"></a><!-- login 후에 menu_modify.gif 로 바뀜 --></TD>
							<%  }else { %>
								<TD widht=85><a href="./logout.jsp"><img src="./img/menu_logout.gif" border="0"></a><!-- login 후에 menu_modify.gif 로 바뀜 --></TD>
								<TD widht=85><a href="#"><img src="./img/menu_modify.gif" border="0"></a></TD>
							<% } %>	
								<TD widht=70><a href="#"><img src="./img/menu_sitemap.gif" border="0"></a></TD>
								<TD width=1><img src="/images/blank.gif" width="1" height="23" alt="" border="0"></TD>
							</tr>
						</table>
					</TD>
					<TD width=3><img src="./img/blank.gif" width="3" height="23" alt="" border="0"></TD>					
				</TR>
			</TABLE>
		</TD>
	</TR>
	<!-- login menu 등 끝 -->



	

