package com.test.util;

import java.util.*;
import java.sql.*;
import java.net.*;
import java.io.*;
import javax.servlet.http.*;
import com.test.util.ServerInfo;

public class Utility {
    
  	public Utility() {  }
  
  	//숫자인지를 체크 (대상, 디폴트값)=====================
  	public static int numChk(String num, int value1)  {
  		int value = 0;
    	try {
			value = Integer.valueOf(num).intValue();
		}catch (NumberFormatException e) {	value = value1;	}
		catch(Exception e){	value = value1;	}	
		
		return value;
  	}  
  	
  	//문자가 null 인지를 체크==============================
  	public static String stringChk(String value, String value1) {
    	try {
			if(value == null){	value = value1;	}			
		}catch(Exception e){	value = value1;	}	
    	return value;
  	}
  
  	//문자 데이타 길이만큼 잘라내기 =======================
  	public static String content_div(String value, int size){
		if(value == null) {		return "";		}
		if(value.length() > size){
			value = value.substring(0,size)+"...";
		}
		return value;
	}
  
	//날짜 데이타 포멧 설정================================
  	public static String date_format1(String data_s, String div) throws Exception {
    	if(data_s != null){
     		if(data_s.length() > 7 ){
      			data_s = data_s.substring(0,4) +div+ data_s.substring(4,6) +div+ data_s.substring(6,8);
      		}else{
      			return "";  
      		}
      	}else{
        	return "";  
      	} 
      	return data_s;  
  	} 
  
  	//날짜:시간 데이타 포멧 설정2==========================
   	public static String date_format2(String data_s) throws Exception {
    	if(data_s != null){
			if(data_s.length() > 13 ){
      			data_s = data_s.substring(0,4) +"."+ data_s.substring(4,6) +"."+ data_s.substring(6,8)+" "+data_s.substring(8,10)+":"+ data_s.substring(10,12)+":"+data_s.substring(12);
      		}else{
      			return "";  
      		}	
      	} else{
        	return "";  
      	} 
      
      	return data_s;  
  	} 
 
	//게시물 Total 페이지 얻기 ============================
  	public static int totalpage(int max_num,  int list_num ) {
  		int page_cnt = (int)(max_num / list_num);
        if (page_cnt == 0) page_cnt = 1;
    	else if (page_cnt > 0 && (max_num % list_num) > 0) page_cnt = page_cnt + 1;
    	else if (page_cnt > 0 && (max_num % list_num) ==0) page_cnt = page_cnt;
  	
  		return page_cnt;
  	}  
    
  	//페이지 네비게이션 생성 ==============================
  	public static String pageNavigation(String self_url, String queryString, int max_num, int list_num, int int_pg) {
	    StringBuffer buf  = new StringBuffer("\r\n");
	    String tmp        = "";
	    int page_size     = 10; //(이전  1 2 3 4 5 6 7 8 9 10 이후)
	    
	    //쿼리문자열의 값을 받아 들인다.
	    if(queryString == null) queryString ="";
	    queryString = queryString.trim();
	    
	    //&req_pg값을 받아서 짤라낸다.
	    int idx = queryString.indexOf("&req_pg");
	    
	    //문자열을 짤라서 뒤에 붙인다... 
	    if(idx > -1) {            
	      tmp = queryString.substring(0,idx);
	      if((idx = queryString.indexOf("&",idx+1)) > 0) {
	          queryString = tmp + queryString.substring(idx);
	      }else {
	          queryString = tmp;
	      }//end_else
	    }//end if(idx)
	    
	    //총페이지 수를 체크한다.  
	    int page_cnt = (int)(max_num / list_num);
	    
	    if (page_cnt == 0) page_cnt = 1;
	    else if (page_cnt > 0 && (max_num % list_num) > 0) page_cnt = page_cnt + 1;
	    else if (page_cnt > 0 && (max_num % list_num) ==0) page_cnt = page_cnt;
	    
	    int start_pg = ((int_pg % page_size) > 0) ? ((int)(int_pg/page_size)*page_size + 1) : (((int)(int_pg/page_size)-1)*page_size + 1);
	    int last_pg  = page_cnt;
	  
	    if (start_pg != 1) {
			buf.append("<a href='" + self_url + "?" + queryString + "&req_pg=" + (start_pg - 1) + "'>◀◀</a> /");
	    }else{
			buf.append("◀◀ /");
	    }
	    
	    for(int i=start_pg; i<= (start_pg + (page_size-1)); i++)  {
	      	if ( i > page_cnt) break;
            if(i == int_pg) {
	        	buf.append("<FONT size=2 color=red> " + i + " </font>/");
	      	} else {
	        	buf.append("<a href='" + self_url + "?"+ queryString + "&req_pg=" + i + "'><FONT size=2> " + i + " </font></a>/");
	      	}
			last_pg++;
	    }//end_for
	    
	    if ((start_pg + (page_size-1)) < page_cnt) {
			buf.append("<a href='" + self_url + "?" + queryString + "&req_pg=" + (start_pg + page_size) + "'> ▶▶</a>");
	    } else{
	      	buf.append(" ▶▶"); 
	    }
	            
	    return buf.toString();           
	          
    }//pageNavigation End Class
    
	//<br> tag 생성========================================
  	public static  String getBrStr(String str) { 
    	if(str == null) {   return new String("");   }
    	StringBuffer buff = new StringBuffer(1024);   
    	for (int k = 0; k < str.length(); k++) {                  
      		char one = str.charAt(k);                 
      		if ('\n' == one ) {
      	 		buff.append("<br>");                  
      		}else if(' ' == one) {
      	 		buff.append("&nbsp;");                  
      		}else{ 
         		buff.append(one);   
      		} 
    	}       
    	return buff.toString(); 
  	}
  
  	// hanEncoding=========================================
  	public static String hanEncode(String src) {
    	if(src == null) {   return "";   }
        String result = null;
    	try {
      		result = URLEncoder.encode(ksc(src));
    	}catch(Exception e) {
      		result = null;
    	}
    	return result;  
  	}
  
  	// hanDecoding ========================================
  	public static String hanDecode(String src) {
		if(src == null) {  return "";   }
        String result = null;
    	try {
      		result = han(URLDecoder.decode(src));
    	}catch(Exception e) {
      		result = null;
    	}
    	return result;    
  	}
  
  	// KSC ================================================
  	public static String han(String str)  {
    	if(str == null) {  return new String("");    }
        try{  
      		str = new String(str.getBytes("8859_1"),"KSC5601");
    	}catch(Exception e){  }
    	return str;
  	} 

	// ISO ================================================
  	public static String ksc(String str)  {
    	if(str == null) { return new String("");  }
        try{
      		str = new String(str.getBytes("KSC5601"),"8859_1");
    	}catch(Exception e){    }
    	return str;
  	}  
  	
  	// Year ===============================================
  	public static String combo_yy(String today){
		StringBuffer buff = new StringBuffer(1024);
		today = today.substring(0,4);
		int startday = Integer.parseInt(today)-2;
  	
		for( ; startday < Integer.parseInt(today)+3 ; startday++ ){
			buff.append("<option value='"+ startday +"' ");
			if( today.equals(""+startday) ) {
				buff.append("	selected ");  
			}
			buff.append(" > "+ startday +"년  </option>\n");	
		}
		return buff.toString();
	}
	
  	// To_Day Month =======================================
  	public static String combo_mm(String today){
		StringBuffer buff = new StringBuffer(1024);
	
		for(int i=1; i<13; i++){
			if(i >= 10){
				buff.append("<option value='"+ i +"' ");
				if(( today.substring(4,6)).equals(""+i)) {
					buff.append(" selected ");  
				}	
			}
			else{
				buff.append("<option value='0"+ i +"' ");
				if(( today.substring(4,6)).equals("0"+i)) {
					buff.append(" selected ");  
				}	
			}	
			buff.append(" > "+ i +"월  </option>\n");
		}
		return buff.toString();
  	}

  	// To_Day Day =========================================
  	public static String combo_dd(String today){
		StringBuffer buff = new StringBuffer(1024);
	
		for(int i=1; i<32; i++){
			if(i <= 9) {  
				buff.append("<option value='0"+ i +"' ");
				if(( today.substring(6,8)).equals("0"+i)) {
					buff.append(" 	selected ");  
				}
				buff.append(" > "+ i +"일  </option>\n");
			}
			else{
				buff.append("<option value='"+ i +"' ");
				if(( today.substring(6,8)).equals(""+i)) {
					buff.append(" 	selected ");  
				}
				buff.append(" > "+ i +"일  </option>\n");
			}
		}
		return buff.toString();
	}
  
  
  	// Cookie를 설정 ======================================
	public static void setCookie(HttpServletResponse response, String name, String value) {
    	value = java.net.URLEncoder.encode(value);
    	Cookie cookie = new Cookie(name, value);
    	cookie.setMaxAge(60*60*24);
    	response.addCookie(cookie);
  	}
  
  	// Cookie값을 얻기 ====================================
  	public static String getCookie(HttpServletRequest request, String cookieName) throws Exception {
    	Cookie [] cookies = request.getCookies();
    	if (cookies==null) return "";
    	String value = "";
    	for(int i=0;i<cookies.length;i++) {
      		if(cookieName.equals(cookies[i].getName())) {
        		value = java.net.URLDecoder.decode(cookies[i].getValue());
        		break;
      		}
    	}
    	return value;
  	}
          
  	// Session 값을 정 ====================================
  	public static void setSession(HttpServletRequest req, String name, String value) {
    	//value = java.net.URLEncoder.encode(value);
    	HttpSession session   = req.getSession(true);
    	session.setAttribute(name, value);
  	}
  
  	// Session 값을 얻기 ==================================
  	public static String getSession(HttpServletRequest req, String name) {
	    HttpSession session   = req.getSession(true);
	    return (String)session.getAttribute(name);
 	}
  
 	//첨부 파일 아이콘 설정 ==============================
 	public static String file_ImgSel(String file_name) {
	    if(file_name == null) {
    	  return "";  
    	}
	    file_name = file_name.toLowerCase();
  
    	int i = file_name.lastIndexOf(".");
    	String file_format = file_name.substring(i+1);
    	if(file_format == null) file_format ="";
    
    	String img_format = "";
    
	    if(file_format.equals("doc")){
    	    img_format = "icon_doc.gif";
    	}else if(file_format.equals("hwp")){
        	img_format = "icon_hansoft.gif";
    	}else if(file_format.equals("pdf")){
        	img_format = "icon_pdf.gif";
    	}else if(file_format.equals("ppt")){
        	img_format = "icon_ppt.gif";
    	}else if(file_format.equals("xls")){
        	img_format = "icon_xls.gif";
    	}else if(file_format.equals("txt")){
        	img_format = "icon_txt.gif";
    	}else if(file_format.equals("gif")){
        	img_format = "icon_gif.gif";
    	}else if(file_format.equals("zip")){
        	img_format = "icon_zip.gif";
    	}else if(file_format.equals("jpg")){
        	img_format = "icon_jpg.gif";
    	}else{
        	img_format = "icon_etc.gif";
    	}
    
    	return img_format;
	}//end_getPath 
  
  	//Url Parsing==========================================
  	public static String paramToString(String param) {
		if(param == null) return "";
		param = param.replace('&', '|');
		param = param.replace('=', '*');
		return param;
  	}
	
  	public static String stringToParam(String str) {
		if(str == null) return "";
		str = str.replace('|', '&');
		str = str.replace('*', '=');
		return str;
  	}

	//날짜비교 체크(시작일,종료일,오늘날짜)================  
  	public static String date_compare(String s_d,String f_d,String to_day){
		String full_s_day=s_d.substring(0,4) + s_d.substring(4,6) + s_d.substring(6,8);
		String full_e_day=f_d.substring(0,4) + f_d.substring(4,6) + f_d.substring(6,8);
		String full_to_day=to_day.substring(0,4) + to_day.substring(4,6) + to_day.substring(6,8);
	
		int full_sday=Integer.parseInt(full_s_day);
		int full_eday=Integer.parseInt(full_e_day);
		int full_today=Integer.parseInt(full_to_day);
	
		String str = "";
		if ((full_today>=full_sday) && (full_today<=full_eday))	{
			return "진행";
		}else if(full_today>full_eday)	{
			return "종료";
		}else if(full_today<full_eday)	{
			return "예정";
		}else	{
			return "";
		}
	}

	//넘겨온 두개의 데이터를 확인하여 width값으로 돌려줌 ==
	public static int img_width_chk(int tot_val, int sub_val){
		if(tot_val>0){
			return Math.round(sub_val*100/tot_val);
		}else{
			return 0;
		}
	}
 
}//End Class
        