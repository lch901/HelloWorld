<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
		
		String b_id=request.getParameter("b_id");
		int i_b_id=0;
//		System.out.println(b_id);
		
		
		String b_name="",b_title="";
		int b_ref=0,b_step=0,b_level=0;
		if(b_id!=null){
			i_b_id=Integer.valueOf(request.getParameter("b_id"));
			
			BoardDBBean db=BoardDBBean.getInstance();
			BoardBean board =db.getBoard(b_id, false);
			b_name=board.getB_name();
			b_title=board.getB_title();
			b_ref=board.getB_ref();
			b_step=board.getB_step();
			b_level=board.getB_level();
		}
	%>
	<h1>글올리기</h1>
<!-- <form action="writeOk.jsp" method="get"> -->
	<form action="writeOk.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="b_id" value="<%=i_b_id %>">
		<input type="hidden" name="b_ref" value="<%=b_ref%>">
		<input type="hidden" name="b_step" value="<%=b_step%>">
		<input type="hidden" name="b_level" value="<%=b_level%>">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_name"  value="<%=b_name%>"></td>
				<td>이메일</td>
				<td><input type="email" name="b_email"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td colspan="3">
					<%if(b_id!=null){%>
						<input type="text" name="b_title" value="[답변]<%=b_title%>">
					<%}else{ %>
						<input type="text" name="b_title" >
					<%} %>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" cols="50" name="b_content" ></textarea>
				</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="3"><input type="file" name="b_fname"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td colspan="2"><input type="text" name="b_pwd"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시입력">
					<input type="button" value="글목록" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>