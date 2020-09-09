<!--
function send() {
	var	form = document.frm1;
	if(form.title.value.length < 1 ){
		alert("제목을 입력해 주세요!");
		form.title.focus();
		return; 
	}
	if(form.content.value.length < 1 ){
		alert("내용을 입력해 주세요!");
		form.content.focus();
		return; 
	}
    form.action="board_process.jsp";
	form.submit();
}		

function send_del() {
	var	form = document.frm1;
	form.action	= "board_process.jsp";
	
	if(confirm("삭제하시겠습니까?")){
		form.submit();
	}else{
		return;
	}		
	
}		
//-->
