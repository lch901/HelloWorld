package com.test.bean;

import java.io.*;
import java.lang.reflect.*;
import java.util.Enumeration;
import javax.servlet.http.*;
import com.test.util.Utility;

public class Member_Entity {
	private Utility util;
	private String cmd = "";
	
	private int 	num ;		//일련번호
	private String 	id;			//아이디
	private String 	pwd;		//비밀번호
	private String 	name;		//이름
	private String 	email;		//이메일
	private String 	tel;		//전화번호
	private String 	post;		//우편번호
	private String 	addr_1;		//주소1
	private String 	addr_2;		//주소2
	private String 	comment1;	//남기는글
	private String 	access1;	//접근권한(회원구분)
	private String 	reg_date;	//등록일자
	private String 	state;		//상태 

	private String 	queryStr;	//queryString 값 얻기	
		
	//디폴트 생성자 ======================================= 
	public Member_Entity() {
		 this.util = new Utility();
	}

	//setter 메소드 ======================================= 
	public void setCmd(String cmd) { this.cmd = cmd;  }

	public void setNum(int num) {	 this.num = num;  }
	public void setId(String id) {	 this.id = id; 	  }
	public void setPwd(String pwd) { this.pwd = pwd;  }
	public void setName(String name) {	this.name = name;	}
	public void setEmail(String email) {this.email = email;	}
	public void setTel(String tel) {    this.tel = tel;     }
	public void setPost(String post) {	this.post = post;	}
	public void setAddr_1(String addr_1) {	this.addr_1 = addr_1;	}
	public void setAddr_2(String addr_2) {	this.addr_2 = addr_2;	}
	public void setComment1(String comment1) {
		this.comment1 = comment1;
	}
	public void setAccess1(String access1) {this.access1 = access1;	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public void setState(String state) {  this.state = state;	}
	public void setQueryStr(String str) { this.queryStr = str;	}


	//getter 메소드 =======================================
	public String getCmd() {
		 if(this.cmd == null) {	return ""; }
		 else {	return this.cmd; }
	}
	public int getNum() {    return this.num; 	}
	public String getId() {  return this.id;	}
	public String getPwd() { return this.pwd;	}
	public String getName( boolean han_yn ) { //데이타가 한글인 경우
		if(this.name == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.name);}
			else{	 return this.name;	}
		}
	}
	public String getEmail() {	return this.email;	}
	public String getTel() {	return this.tel;	}
	public String getPost() {	return this.post;	}
	public String getAddr_1( boolean han_yn ) { 
		if(this.addr_1 == null) { return "";  }
		else{
			if(han_yn){	return util.han(this.addr_1);}
			else{	 return this.addr_1;	}
		}
	}
	public String getAddr_2( boolean han_yn ) { 
		if(this.addr_2 == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.addr_2);}
			else{	 return this.addr_2;	}
		}
	}
	public String getComment1( boolean han_yn ) { 
		if(this.comment1 == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.comment1);}
			else{	 return this.comment1;	}
		}
	}
	public String getAccess1() {  return this.access1;	}
	public String getReg_date() { return this.reg_date;	}
	public String getState() {	  return this.state;	}
	
	public String getQueryStr(boolean han_yn) {
		if(this.queryStr == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.queryStr);}
			else{	 return this.queryStr;	}
		}
	}
	
	//=====================================================
	//객체의 상태 정보를 외부에서 사용할 수 있게 출력 메소드 제공
	public String toInfoString() {
		StringBuffer buf = new StringBuffer();
		String[] fields = getPropertyNames();
		for(int i=0; i<fields.length; i++) {
			
			try {
				buf.append("<br>\n");
				buf.append(fields[i] + "=" + getValue(fields[i]));
				buf.append("\n<br>\n");
			}catch(Exception e) {
			
			}
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

}