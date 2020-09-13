<!--
function send_del() {
	var	form = document.frm1;
	
	form.action	= "member_process.jsp";
	form.cmd.value="multi_del";
	var del_cnt = 0;
	
	for( var i=0; i < form.length; i++){
		if(form.elements[i].name =="num" && form.elements[i].checked){
			del_cnt++; //선택된 체크박스수량
		}//end_if
	}//end_for		
						
	//만일 선택을 하지 않았다면
	if(del_cnt == 0) {
		alert("게시물을 선택해주세요");
		return;
	}
	else { //선택하였다면
		if(confirm("삭제하시겠습니까?")){
			form.submit();
		}else{
			return;
		}		
	}
}		
//-->
