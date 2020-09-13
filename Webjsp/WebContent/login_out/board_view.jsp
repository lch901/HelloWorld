<jsp:include page="./log_chk_c.jsp" flush="true" />
<%@ page contentType="text/html; charset=euc-kr" %> 
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" href="./main.css" type="text/css">
</HEAD>
<%@ include file="./get_session_c.jsp" %> 
<BODY bgcolor="#D7D7D7" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0" height=350>
<center>
<TABLE width="480" border="0" cellpadding="0" cellspacing="0" background="./img/index_page_bg.gif" bgcolor="#ffffff">
	<jsp:include page="./log_info.jsp" flush="true"/>
	<TR><TD><img src="./img/main1.jpg" width="480" border="0"></TD></TR>
	<TR><TD><img src="./im/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
	<TR>	
		<!-- 컨텐츠 시작 -->
		<TD width="100%" height=300 valign=top>
			<TABLE border="0" cellpadding="0" cellspacing="0">
				<TR>
					<TD>
					<!-- 게시물 보기 시작 -->
						<TABLE border="0" cellpadding="0" cellspacing="0" width="480">
							<TR><TD colspan=3 height=30 bgcolor="#369BD0" align=center><font size="2" color="#FFFFFF"><b>자바 데이타베이스 프로그랭밍 강좌 오픈 예정</b></font></TD></TR>
							<TR><TD colspan=3 bgcolor="#8E8E8E"><img src="./img/blank.gif" width="1" height="2" alt="" border="0"></TD></TR>
							<TR>
								<TD width=160 height=25>&nbsp;&nbsp;<b>작성자</b> : <%=Utility.han(u_name)%></TD>
								<TD width=180 font class=board><b>등록일자</b> : 2003.07.26</TD>
								<TD width=180 font class=board><b>조회</b> : 15</TD>
							</TR>
							<TR><TD colspan=3><img src="./img/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
							<TR>
								<TD width=160 height=25>&nbsp;<b> IP</b> : 61.107.23.32</TD>
								<TD width=180 font class=board><b>첨부파일1</b> : 파일 없음	</TD>
							</TR>
							<TR><TD colspan=3 bgcolor="#8E8E8E"><img src="./img/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>

							<TR onMouseOver="this.style.backgroundColor='#EFEFEF'" onMouseOut="this.style.backgroundColor='' " align=center height=150>
								<TD colspan=3 valign=top align="left">
									<TABLE border="0" cellpadding="0" cellspacing="0" width="480">
										<TR><TD colspan=3><img src="./img/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
										<TR><TD colspan=3 align="left">
										열띰이 공부할 수 있는 기회입니다.<br> 자바 기초를 마스터 하신분들을 모십니다.<br>
										시작일자: 2003.08.10(금) 09:00 ~ <br>
										교육내용: 오라클 및 JDBC, JSP 연동</TD></TR>
										<TR><TD colspan=3><img src="../img/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
									</TABLE>
								</TD>
							</TR>
							<TR><TD colspan=3 bgcolor="#D4D0C8"><img src="./img/blank.gif" width="1" height="1" alt="" border="0"></TD></TR>
								<TR><TD colspan=3 bgcolor="#369BD0" height=25 font class=boardtext align=right>
								<a href="./index2.jsp">[이전화면]</a></TD></TR>
								<TR><TD colspan=3><img src="./img/blank.gif" width="1" height="10" alt="" border="0"></TD></TR>
							</TABLE>
					<!-- 자유게시판 끝 -->
					</TD>
				</TR>
			</TABLE>
		</TD>
		<!-- 컨텐츠 끝 -->
	</TR>
	<TR><TD><img src="./img/copyright.gif" width="480" height="79" alt="" border="0"></TD></TR>
</TABLE>
</center>
</BODY>
</HTML>
