<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table,tr,td{
		border:none;
	}
</style>
<div class="main">
	<h1>User Join</h1>
	<form id="f1" action="join" method="post" onsubmit="return chk();">
		<table class="table1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="mpw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="mpwre"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="nm"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>여<input type="radio" name="sex" value="1" checked> 남<input type="radio" name="sex" value="2"></td>
			</tr>
			<tr>
				<td><input class="i1" type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</div>


<script>
	function chk(){
		if(f1.mid.value ===''){
			alert('아이디를 입력하시오.');
			f1.mid.focus();
			return false;
		}
		if(f1.mpw.value ===''){
			alert('비밀번호를 입력하시오.');
			f1.mpw.focus();
			return false;
		}
		if(f1.mpwre.value ===''){
			alert('확인비밀번호를 입력하시오.');
			f1.mpwre.focus();
			return false;
		}
		if(f1.mpwre.value != f1.mpw.value){
			alert('확인비밀번호가 틀렸습니다.');
			f1.mpwre.focus();
			return false;
		}
		if(f1.nm.value ===''){
			alert('이름을 입력하시오.');
			f1.nm.focus();
			return false;
		}
		return true;
	}
</script>