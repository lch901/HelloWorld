package com.test.shopp;

import com.test.util.Utility;

public class Category {
    private int num; //고유번호
    private String name; //카테고리명
    
    private Utility util ;
    
    public Category() { 
    	util = new Utility();	
    }
    public Category(int num, String name) {
    	this.num = num;
    	this.name = name;
  	}
    
    //getter method
    public int getNum() {  return this.num;   }
    public String getName(boolean han_yn) { 
    	if(this.name == null) { return "";	}
		else{
			if(han_yn){	return util.han(this.name);}
			else { return this.name;	}
		}
	}
    
    //setter method
    public void setNnum(int num) {
		this.num = num;
    }
    public void setName(String name) {
		this.name = name;
    }
}
