<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String midValue =(String)request.getAttribute("midValue"); 
	if(midValue == null){
		midValue="";
	}
%>
<style>
	table,tr,td{
		
	}
</style>
<div class="main">
	<h1>User Login</h1>
	<form id="f1" action="login" method="post" onsubmit="return chk();">
		<div>
			<table class="table" id="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="mid" value="<%=midValue %>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mpw" ></td>
				</tr>
	
			</table>
			<input class="i1" type="submit" value="로그인" >
		</div>
		<a href="join"><input class="i2" type="button" value="회원가입" ></a>
		
	</form>
</div>


<%if(msg != null){
	if(msg.equals("complete")){//(한글은 response로 보내면 깨짐)%>
		<script>alert('등록완료')</script>
	<%}else{
		out.print(msg);
	}
}%>

<script>
	function chk(){
		if(f1.mid.value ===''){
			alert('아이디를 입력하세요');
			f1.mid.focus();
			return false;
		}
		if(f1.mpw.value ===''){
			alert('비밀번호를 입력하세요');
			f1.mpw.focus();
			return false;
		}
		return true;
	}
</script>