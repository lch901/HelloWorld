<!-- 

function send() {
	var	form = document.frm1;
	
	if(form.reg_name.value.length < 1  ){
		alert("작성자를 입력해 주세요!");
		form.reg_name.focus();
		return; 
	}
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

function rep_send() {
	var	form = document.frm1;
	if(form.reg_name.value.length < 1 ){
		alert("작성자 성명을 입력해 주세요!");
		form.reg_name.focus();
		return; 
	}

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

function check() {
	var	form = document.frm1;
	form.action = "board_list.jsp";
	form.submit();
}	

function selectall(val) {
    var  form = document.frm2;
    var sw = form.no_all.value;
    var tf = true;
    if(sw == "1") {
       tf = true;
       form.no_all.value = 2;
    }else  {
       tf = false;   
       form.no_all.value = 1;
    }  
    
	var cbox = document.frm2.no;
 	len = cbox.length;
 	var i=0;
 	for( i=0 ; i<len ; i++) {
 		//if (val == 0) cbox.no[i].checked=false;
 		cbox.no[i].checked=tf;
 	}
} 

function multi_del() {
	var	form = document.frm2;
	
	form.action	= "board_process.jsp";
	//form.cmd.value="multi_del";
	var del_cnt = 0;
	
	for( var i=0; i<form.length; i++){
		if(form.elements[i].name =="no" && form.elements[i].checked){
			del_cnt++; //선택된 체크박스수량
		}//end_if
	}//end_for		
						
	//만일 선택을 하지 않았다면
	if(del_cnt ==0) {
		alert("삭제할 게시물을 선택해주세요");
		return;
	}
	else { //선택하였다면
		if(confirm("선택한 모든 게시물을 삭제하시겠습니까?")){
			form.submit();
		}else{
			return;
		}		
	}
}		
//-->
