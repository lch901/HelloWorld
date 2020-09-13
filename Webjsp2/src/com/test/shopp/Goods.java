package com.test.shopp;

import com.test.shopp.Book_Info;

public class Goods {
	
	private Book_Info book;
	private int num;

	public Goods(Book_Info book, int n) {
	    this.book = book;
	    num = n;
	}

	public Book_Info getBook() { return this.book;  }
	public int getNum()       { return this.num;	}
}