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

