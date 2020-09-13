<%@ page contentType="text/html; charset=euc-kr" %> 
<HTML>
<HEAD>
<TITLE>로그인/아웃/응용예제</TITLE>
<link rel="stylesheet" href="./main.css" type="text/css">
</HEAD>

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
					<!-- 공지사항 시작 -->
					<jsp:include page="./index_notice.jsp" flush="true" />
					<!-- 공지사항 끝 -->
					</TD>
				</TR>
				<TR>
					<TD>
					<!-- 자유게시판 시작 -->
					<jsp:include page="./index_board.jsp" flush="true" />
					<!-- 자유게시판 끝 -->
					</TD>
				</TR>
			</TABLE>
			<!-- 컨텐츠 끝 -->
		</TD>
	</TR>
	<TR><TD><img src="./img/copyright.gif" width="480" height="79" alt="" border="0"></TD></TR>
</TABLE>
</center>
</BODY>
</HTML>
