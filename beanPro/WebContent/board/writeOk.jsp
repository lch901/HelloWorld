<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*" %>
<%@page import="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- board에 id,name,email,addr,pwd값이 들어가있음. -->
	<jsp:useBean id="board" class="pro.BoardBean"/>
	<jsp:setProperty property="*" name="board"/>
	<%
		//파일 업로드 추가
		String uploadPath="C:\\uptest"; //"c:\\aaa" 디렉토리 생성후
		int size=10*1024*1024;
		int b_fsize=0;
		MultipartRequest multi=new MultipartRequest(request, uploadPath,
		size, "UTF-8", new DefaultFileRenamePolicy());
		
		String b_fname=multi.getFilesystemName("b_fname");
		File file=multi.getFile(b_fname);
		System.out.println(b_fname);
		System.out.println(file);
		if(file!=null)b_fsize=(int)file.length();
		board.setB_id(Integer.parseInt(multi.getParameter("b_id")));
		board.setB_name(multi.getParameter("b_name"));
		board.setB_email(multi.getParameter("b_email"));
		board.setB_title(multi.getParameter("b_title"));
		board.setB_content(multi.getParameter("b_content"));
		board.setB_pwd(multi.getParameter("b_pwd"));
		board.setB_date(new Timestamp(System.currentTimeMillis()));
		board.setB_ip(request.getRemoteAddr());
		board.setB_ref(Integer.parseInt(multi.getParameter("b_ref")));
		board.setB_step(Integer.parseInt(multi.getParameter("b_step")));
		board.setB_level(Integer.parseInt(multi.getParameter("b_level")));
		board.setB_fname(b_fname);
		board.setB_fsize(b_fsize);
		
/* 		System.out.println(multi.getParameter("b_id")+"되나?");
		System.out.println(multi.getParameter("b_name"));
		System.out.println(b_fname);
		System.out.println(b_fsize); */
		
	
//-----------------------------------------------------
//		board.setB_ip(request.getRemoteAddr());//ip값 가져오기
		//현재시간
//		board.setB_date(new Timestamp(System.currentTimeMillis()));//현재시간 가져오기
//------------------------------------------------------

		/*String b_name=request.getParameter("b_name");
		String b_email=request.getParameter("b_email");
		String b_title=request.getParameter("b_title");
		String b_content=request.getParameter("b_content");
		String b_pwd=request.getParameter("b_pwd");
		System.out.println(b_name);
		System.out.println(b_email);
		System.out.println(b_title);
		System.out.println(b_content);
		System.out.println(b_pwd); */
		
//		System.out.println(board.getB_fname());
		
		BoardDBBean db=BoardDBBean.getInstance();
		db.getConnection();
		db.writeBoard(board);
		response.sendRedirect("list.jsp");
	%>
</body>
</html>