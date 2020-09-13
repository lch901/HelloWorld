<!--
function send() {
	var	form = document.frm1;
	if(form.name.value.length < 1 ){
		alert("성명을 입력해 주세요!");
		form.name.focus();
		return; 
	}
	if(form.id.value.length < 1 ){
		alert("ID를 입력해 주세요!");
		form.id.focus();
		return; 
	}
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

function id_check()	{ //  아이디 검색 창
  	window.open('member_id.jsp',"","width=370,height=250,scrollbars=yes");
	return ;	
}	

function checkid(p_id) {	
	if(document.p_id.id.value.length < 0 || document.p_id.id.value == "" ){
		alert("ID를 입력해 주세요!");
		document.p_id.id.focus();
		return;
	}
	else {
		document.p_id.submit();
	}
}
function SendId(c_id){ 				 		
	var id = c_id;
	if(id.length<0){
		alert("ID를 입력해 주세요!");
		document.p_id.id.focus();
		return;
	}
	else { 
		opener.document.frm1.id.value = id;
		//document.write("c_id = " + id);
		window.close(); 
	}    	
}

function post_search()	{ //  우편번호 검색 창
  	window.open('member_post.jsp',"","width=370,height=350,scrollbars=yes");
	return ;	
}

function postnum(dong_name){
	if(document.dong_name.dongid.value ==""){
		alert("찾고하는 동명을 입력하세요");
		document.dong_name.dongid.focus();
		return false;
	}
	else {
		(document.dong_name.dongid.value.length > 0);
		 document.dong_name.submit();
	}
}
		
function research()		{
	location.href="member_post.jsp?key=a";
}
	
function SendAddress(zipcode,addr){ 				 		
	opener.document.frm1.post.value = zipcode;
	opener.document.frm1.addr_1.value = addr;		
	window.close();      	
}


function check() {
	var	form = document.frm1;
	form.action = "member_list.jsp";
	form.s_date.value = form.s_year.value + form.s_month.value + form.s_day.value;
	form.e_date.value = form.e_year.value + form.e_month.value + form.e_day.value;
	form.submit();
}


function selectall() {
	
    var  form = document.frm1;
    var sw = form.no_all.value;
    var tf = true;
    if(sw == "1") {
       tf = true;
       form.no_all.value = 2;
    }else  {
       tf = false;  
       form.no_all.value = 1;
    } 
   
    var cbox = form.num;
    var len = cbox.length;
    var i=0;
    
    for( i=0 ; i<len ; i++) {
      cbox.num[i].checked=tf;
    }
}


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
		alert("회원을 선택해주세요");
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

function send_mod() {
	var	form = document.frm1;
	
	form.action	= "member_process.jsp";
	form.cmd.value="multi_mod";
	var mod_cnt = 0;
	
	for( var i=0; i < form.length; i++){
		if(form.elements[i].name =="num" && form.elements[i].checked){
			mod_cnt++; //선택된 체크박스수량
		}//end_if
	}//end_for		
						
	//만일 선택을 하지 않았다면
	if(mod_cnt == 0) {
		alert("회원을 선택해주세요");
		return;
	}
	else { //선택하였다면
		if(confirm("회원구분 정보를 일괄 수정하시겠습니까?")){
			form.submit();
		}else{
			return;
		}		
	}
}			
-->

