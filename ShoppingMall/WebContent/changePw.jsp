<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<div class="mypage">
	<nav>
		<a href="basket">장바구니</a>
		<a href="changePw">비밀번호변경</a>
	</nav>
	<div>
		<h1>비밀번호 변경</h1>
		<form id="f" action="changePw" method="post" onsubmit="return chk();">
			현재 비밀번호<input type="password" name="beforeMpw"><br>
			변경 비밀번호<input type="password" name="mpw"><br>
			변경 비밀번호 확인<input type="password" name="mpwre"><br>
			<input type="submit" value="비밀번호 수정">
		</form>
	</div>
</div>
<%if(msg != null){%>
	<script>alert('<%=msg%>');</script>
<%}%>

<script>
	function chk(){
		if(f.beforeMpw.value === ''){
			alert('현재 비밀번호를 입력하시오');
			f.beforeMpw.focus();
			return false;
		}
		if(f.mpw.value === ''){
			alert('변경 비밀번호를 입력하시오');
			f.mpw.focus();
			return false;
		}
		if(f.mpwre.value === ''){
			alert('변경 비밀번호 확인을 입력하시오');
			f.mpwre.focus();
			return false;
		}
		return true;
	}
</script>