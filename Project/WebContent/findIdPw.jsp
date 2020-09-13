<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br>
<%
	String type=(String)request.getParameter("type");
	if(type==null){
		type="id";
	}
%>
<form id="f" action="findIdPw_result.jsp" method="get" onsubmit="return chk()">
	<%if(type.equals("id")){ %>
		<input type="button" value="아이디 찾기" onclick="type_id()">
		<input type="button" value="비밀번호 찾기" onclick="type_pw()">
		<input type="hidden" name="find_type" value="id">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="아이디 찾기"></td>
			</tr>
		</table>
	<%}else if(type.equals("pw")){%>
		<input type="button" value="아이디 찾기" onclick="type_id()">
		<input type="button" value="비밀번호 찾기" onclick="type_pw()">
		<input type="hidden" name="find_type" value="pw">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="비밀번호 찾기"></td>
			</tr>
		</table>
	<%} %>
</form>
<script>
//함수명 == id (x)
	var f=document.getElementById('f');

	function type_id(){
		location.href='index.jsp?view=findIdPw.jsp&type=id';
	}
	function type_pw(){
		location.href='index.jsp?view=findIdPw.jsp&type=pw';
	}
	function chk(){
		if(f.email.value===''){
			alert('이메일을 입력하시오.');
			f.email.focus();
			return false;
		}
		if(f.nm.value===''){
			alert('이름을 입력하시오.');
			f.nm.focus();
			return false;
		}
		return true;
	}
	
</script>
