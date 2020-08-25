<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>Admin Login</h1>
<form id="f" action="login" method="post" onsubmit="return chk();">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw"></td>
		</tr>
		<tr>
			<td><input type="submit" value="관리자로그인"></td>
		</tr>
	</table>
</form>

<script>
	function chk(){
		var f = document.getElementById('f');
		if(f.mid.value === ''){
			alert('아이디를 입력하세요.');
			f.mid.focus();
			return false;
		}
		if(f.mpw.value === ''){
			alert('비밀번호를 입력하세요.');
			f.mpw.focus();
			return false;
		}
		return true;
	}
</script>