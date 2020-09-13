package com.test.shopp;

import com.test.shopp.*;
import java.util.Vector;

public class Shopp_Cart {

    Vector list = new Vector();

    public Shopp_Cart() {  } //디폴트 생성자

	//장바구니에 상품 추가
    public void addGoods(Book_Info book) {
    	System.out.println("1");
    	
		for (int i = 0; i < list.size(); i++) {
		    Goods item = (Goods)list.elementAt(i);
			System.out.println("2");    
		    Book_Info  data = item.getBook();
		    
		    if(data.getNum() == book.getNum()) {
				int num = item.getNum();
				list.setElementAt(new Goods(data, num + 1), i);
				return;
		    }
		    
		}
		list.add(new Goods(book, 1));
		
    }
	//장바구니에서 상품 삭제
    public void removeGoods(int num1) {
		for (int i = 0; i < list.size(); i++) {
		    Goods item = (Goods)list.elementAt(i);
		    Book_Info data = item.getBook();
		    if(data.getNum() == num1) {
			   	int num = item.getNum();
				if (num > 1) {
			    	list.setElementAt(new Goods(data, num - 1), i);
			    	return;
				}else {
			    	list.remove(i);
		    	}
			}
    	}
	}

    public int getSize() {	return list.size();    }
    
    public Book_Info getBook(int i) {
		return ((Goods) list.elementAt(i)).getBook();
    }

    public int getNum(int i) {
		return ((Goods) list.elementAt(i)).getNum();
    }
}
