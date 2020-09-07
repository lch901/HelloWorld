<%@page import="com.sun.jmx.snmp.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String pageNUM=request.getParameter("pageNUM");
		if(pageNUM==null)pageNUM="1";
	
		BoardDBBean db=BoardDBBean.getInstance();
		ArrayList<BoardBean> list=db.listBoard(pageNUM);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh-mm");//7
		Calendar cal = Calendar.getInstance();
		String s_sdf=null;
		s_sdf=sdf.format(cal.getTime());
		//Timestamp t_sfd=Timestamp.valueOf(s_sdf);
		//System.out.println(s_sdf);

	%>
	<h1>게시판</h1>
	<a href="write.jsp">글쓰기</a>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
			<%if(list!=null){ %>
				<%for(BoardBean board:list){ %>
					<tr>
						<td><%=board.getB_id() %></td>
						<td>
							<%if(board.getB_level()>0){ %>
								<%for(int i=0;i<board.getB_level();i++){ %>
									<img src="../images/AnswerLine.gif" alt=""/>
								<%} %>
							<%} %>
							<a href="view.jsp?b_id=<%=board.getB_id()%>&pageNUM=<%=pageNUM%>"><%=board.getB_title() %></a>
						</td>
						<td><a href="mail.jsp?email=<%=board.getB_email()%>"><%=board.getB_name() %></a></td>
						<td><%=board.getB_date() %></td>
						<td><%=board.getB_hit() %></td>
					</tr>
				<%} %>
			<%} %>
	</table>
	<%=BoardBean.pageNumber(4)%>
</body>
</html>