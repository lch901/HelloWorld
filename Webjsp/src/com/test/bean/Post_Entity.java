package com.test.bean;

import com.test.util.Utility;
import java.io.*;
import java.lang.reflect.*;
import java.util.Enumeration;

public class Post_Entity{
	private String zipcode;
  	private String sido;    
  	private String gugun; 
  	private String dong;
  	private String ri;
  	private String bunji;
  	
	//생성자 
	public Post_Entity() {	}

	//setter method ======================================= 
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setSido(String sido) {	this.sido = sido;	}
	public void setGugun(String gugun) {this.gugun = gugun;	}
	public void setDong(String dong) {	this.dong = dong;	}
	public void setRi(String ri) {		this.ri = ri;		}
	public void setBunji(String bunji) {this.bunji = bunji;	}

	// getter method ======================================	
	public String getZipcode() { return this.zipcode;	}
	public String getSido( boolean han_yn ) { //데이타가 한글인 경우
		if(this.sido == null) { return "";	}
		else{
			if(han_yn){	return Utility.han(this.sido);}
			else{	 return this.sido;	}
		}
	}
	public String getGugun( boolean han_yn ) { 
		if(this.gugun == null) { return "";	}
		else{
			if(han_yn){	return Utility.han(this.gugun);}
			else{	 return this.gugun;	}
		}
	}
	public String getDong( boolean han_yn ) { 
		if(this.dong == null) { return "";	}
		else{
			if(han_yn){	return Utility.han(this.dong);}
			else{	 return this.dong;	}
		}
	}	
	public String getRi( boolean han_yn ) { 
		if(this.ri == null) { return "";	}
		else{
			if(han_yn){	return Utility.han(this.ri);}
			else{	 return this.ri;	}
		}
	}
	public String getBunji( boolean han_yn ) { 
		if(this.bunji == null) { return "";	}
		else{
			if(han_yn){	return Utility.han(this.bunji);}
			else{	 return this.bunji;	}
		}
	}
}