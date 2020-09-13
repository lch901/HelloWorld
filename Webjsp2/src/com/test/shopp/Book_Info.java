package com.test.shopp;

import java.lang.reflect.*;
import com.test.util.Utility;

public class Book_Info {
	
    private int    num;     //고유번호
    private String category;//분류
    private String title;   //책제목
    private String author;  //저자
    private String company; //출판사
    private String c_date;  //출간일자
    private int    price;   //가격
	
	private Utility util ;
	
    public Book_Info() {  
    	util = new Utility();	
    }//디폴트 생성자

	//getter method
    public int getNum()        { return this.num;      }
    public String getCategory(){ return this.category; }
    
    public String getTitle( boolean han_yn)   { 
		if(this.title == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.title);}
			else { return this.title;	}
		}
	}
    public String getAuthor( boolean han_yn)  { 
    	if(this.author == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.author);}
			else { return this.author;	}
		}
	}
    public String getCompany( boolean han_yn) { 
    	if(this.company == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.company);}
			else { return this.company;	}
		}
    }
    public String getC_date()    { return this.c_date;     }
    public int getPrice()      { return price;         }

	//setter method
    public void setNum(int num){ this.num = num;       }
    public void setCategory(String category) {
		this.category = category;
    }
    public void setTitle(String title) {
		this.title = title;
    }
    public void setAuthor(String author) {
		this.author = author;
    }
    public void setCompany(String company) {
		this.company = company;
    }
    public void setC_date(String date) {
		this.c_date = date;
    }
    public void setPrice(int price) {
		this.price = price;
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
