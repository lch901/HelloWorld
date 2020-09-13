package com.test.bean;

import com.test.util.Utility;
import com.test.util.ServerInfo;
import javax.servlet.http.*;
import java.io.*;
import java.util.Enumeration;
import java.lang.reflect.*;


//파일 업로드 빈 - MultipartRequest =======================
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//========================================================

public class Board_Entity {
	private Utility util;

	//디폴트 생성자 ======================================
	public Board_Entity() {
		 this.util = new Utility();
	}
	
	//기본 정보 관리 =====================================
	private String cmd = "";    //요청작업 구분	
	
	private int 	num; 		//게시물 일련번호
	private String 	reg_name;	//작성자 
	private String 	title;		//제목 
	private String 	content;	//내용
	private String 	file_name1;	//파일이름1
	private int 	hit_cnt;	//조회수
	private int 	doc_group;	//글그룹
	private int 	doc_pos;	//포지션 
	private int 	doc_step;	//스탭 
	private String 	ip_num; 	//IP주소 
	private String 	reg_date;	//등록일
	private String 	state;		//상태 
	
	//작업에 따른 기타 정보관리 ========================
	private String 	queryStr;	//queryString 값 얻기
	private int 	p_num;		//부모글번호
	private String f_del1;		//파일1
	
	//setter 메소드 정의 =================================
	public void setCmd(String cmd) { 	this.cmd = cmd;	}
	public void setNum(int num) {	this.num = num;	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFile_name1(String file_name1) {
		this.file_name1 = file_name1;
	}
	public void setHit_cnt(int hit_cnt) {
		this.hit_cnt = hit_cnt;
	}
	public void setDoc_group(int doc_group) {
		this.doc_group = doc_group;
	}
	public void setDoc_pos(int doc_pos) {
		this.doc_pos = doc_pos;
	}
	public void setDoc_step(int doc_step) {
		this.doc_step = doc_step;
	}
	public void setIp_num(String ip_num) {
		this.ip_num = ip_num;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public void setState(String state) {
		this.state = state;
	}
	//----------------------------------------------------	
	public void setQueryStr(String str) {
		this.queryStr = str;
	}
	public void setP_num(int p_num) { 
		this.p_num = p_num;
	}	
	public void setF_del1(String f_del1) {
		this.f_del1 = f_del1;
	}

	
	//getter 메소드 정의 =================================
	public String getCmd() {
		if(this.cmd == null) {	return ""; }
		else {	return this.cmd; }
	}
	public int getNum() {
		return this.num;
	}
	public String getReg_name( boolean han_yn ) { //데이타가 한글인 경우
		if(this.reg_name == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.reg_name);}
			else { return this.reg_name;	}
		}
	}
	public String getTitle( boolean han_yn ) { 
		if(this.title == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.title);}
			else { return this.title;	}
		}
	}	
	public String getContent( boolean han_yn ) { 
		if(this.content == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.content);}
			else {	return this.content;	}
		}
	}
	public String getFile_name1( boolean han_yn ) { 
		if(this.file_name1 == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.file_name1);}
			else { return this.file_name1;	}
		}
	}
	public int getHit_cnt() {	return this.hit_cnt;	}
	public int getDoc_group() {	return this.doc_group;	}
	public int getDoc_pos() {	return this.doc_pos;	}
	public int getDoc_step() {	return this.doc_step;	}
	public String  getIp_num(){	return this.ip_num;		}
	public String  getReg_date() {return this.reg_date;	}
	public String  getState() {	return this.state;		}

	//----------------------------------------------------
	public String getQueryStr(boolean han_yn) {
		if(this.queryStr == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.queryStr);}
			else{	 return this.queryStr;	}
		}
	}
	public int getP_num() {		return this.p_num;		}
	public String getF_del1() {	return this.f_del1;		}
	
			
	//====================================================
	//클라이언트 요청을 받아서 객체에 세팅하는 메소드(파일 업로드 용도)
	public void setParser(HttpServletRequest request ) throws Exception {
		try{
			String file_path  = request.getRealPath("/") + "attach_file/" ;//"d:\\home\\Ch09\\freeboard\\attach_file\\";
	 		MultipartRequest up = new MultipartRequest(request, file_path , 10*1024*1024 ,"euc-kr", new DefaultFileRenamePolicy());//new DefaultFileRenamePolicy());
 			
//	 		System.out.println(up.getParameter("reg_name"));
//	 		System.out.println(up.getParameter("title"));
//	 		System.out.println(up.getParameter("content"));
//	 		System.out.println(up.getParameter("file_name1"));
	 		
			this.cmd		= up.getParameter("cmd");
					    
		    this.num 		= Utility.numChk(up.getParameter("num"), 0);		//일련번호(number)
	 		this.reg_name	= up.getParameter("reg_name"); 						//작성자
			this.title	    = up.getParameter("title"); 						//제목
			this.content	= up.getParameter("content");						//내용
			this.hit_cnt	= Utility.numChk(up.getParameter("hit_cnt"),0); 	//조회수(number)
			this.doc_group	= Utility.numChk(up.getParameter("doc_group"),0);	//글그룹(number)
			this.doc_pos    = Utility.numChk(up.getParameter("doc_pos"),0); 	//글위치(number)
			this.doc_step 	= Utility.numChk(up.getParameter("doc_step"),0);	//스탭 (number)
			this.ip_num	    = up.getParameter("ip_num"); 						//ip주소
			this.reg_date	= up.getParameter("reg_date"); 						//등록일
			this.state		= up.getParameter("state");							//상태
		
			this.queryStr	= up.getParameter("queryStr");						//queryString 
			this.p_num	   	= Utility.numChk(up.getParameter("p_num"),0);		//부모글번호 
			this.f_del1		= up.getParameter("f_del1");						//파일 1

			for (Enumeration e = up.getFileNames();e.hasMoreElements();) {
				 String strName = (String)e.nextElement();
				 if("file_name1".equals(strName)){// 첨부파일 1
				 	File f = up.getFile(strName);
					if(f != null ) {
						this.file_name1= f.getName();
					}
	 			 }				 
			}//end_while
				 		
		 }//end_try
		 catch(Exception e){throw e;}
	}
	
	//====================================================	
	//객체의 상태 정보를 외부에서 사용할 수 있게 출력 메소드 제공
	public String toInfoString() {
		StringBuffer buf = new StringBuffer();
		String[] fields = getPropertyNames();
		for(int i=0; i<fields.length; i++) {
			try {
				buf.append("<br>\n");
				buf.append(fields[i] + "=" + getValue(fields[i]));
				buf.append("\n<br>\n");
			}catch(Exception e) {	}
		}
		return buf.toString();
	}

	//객체가 가지고 있는 메버필드 정보 얻기
	public String[] getPropertyNames() {
		Field[] fs = getClass().getDeclaredFields();
		String[] names = new String[fs.length];
		for(int i=0; i<fs.length; i++) {
			names[i] = fs[i].getName();	
		}
		return names;
	}

	//객체가 가지고 있는 메버필드의 값 얻기
	public Object getValue(String prop_name) throws Exception {
		Field fd = getClass().getDeclaredField(prop_name);
		try {
			return fd.get(this);
		}catch(Exception e) {
			throw new Exception(e.toString() + "\nprop_name=" + prop_name);
		}
	}
	//----------------------------------------------------	
}
	