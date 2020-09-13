<!--
function send_mod() {
	var	form = document.frm1;
	if(form.pwd.value.length < 1 ){
		alert("비밀번호를 입력해 주세요!");
		form.pwd.focus();
		return; 
	}
	if(form.email.value.length < 1 ){
		alert("Email를 입력해 주세요!");
		form.email.focus();
		return; 
	}
	if(form.tel.value.length < 1 ){
		alert("전화번호를 입력해 주세요!");
		form.tel.focus();
		return; 
	}
	if(form.post.value.length < 1 ){
		alert("우편번호를 입력해 주세요!");
		form.post.focus();
		return; 
	}
	if(form.addr_1.value.length < 1 ){
		alert("주소를 입력해 주세요!");
		form.addr_1.focus();
		return; 
	}
	if(form.addr_2.value.length < 1 ){
		alert("주소를 입력해 주세요!");
		form.addr_2.focus();
		return; 
	}

	form.action="member_process.jsp";

	form.submit();
}		
