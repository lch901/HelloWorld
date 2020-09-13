package com.test.shopp;

import java.sql.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.http.*;  
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.shopp.Book_Info; //자료형
                               
public class Book_Info_Query {   

	private DBManager mgr;                 
	private Utility util;
	
	private String error_msg   	= ""; //에러 메세지 저장
	private String msg			= ""; //특정 값 보기 위함

	//생성자
	public Book_Info_Query() {   
		this.mgr = new DBManager();
		this.util = new Utility();  
	}
	
	
	//도서 정보 검색 ================================
	public Vector getMulti_Data(HttpServletRequest request, int div, int fix){
	 	
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		
		String sql 					= "";
		String sql_where			= ""; //검색조건..
		String order_group 			= ""; 

		int k						= 1;
		//자신의 Url주소를 설정
		String self_url = request.getRequestURI(); 
		//결과를 저정하는 벡터 변수
		Vector list = new Vector(); 

		if(div == 1 ) { //카테고리별 리스트
			sql_where = " WHERE b.num = ? AND a.category = b.num " ;		
		}else {  //일련번호 리스트
			sql_where = " WHERE a.num = ? AND a.category = b.num " ;		
		}
		order_group = " order by a.title desc "; 
		
		try{
			con = mgr.getConnection("oracle");
			
			sql = "SELECT a.num , b.name, a.title, a.author, a.company, a.c_date, a.price  FROM BOOK_INFO_TBL a, CATEGORY_TBL b "  + sql_where + order_group;
     		msg = sql;
			pstmt = con.prepareStatement(sql);	
			pstmt.setInt(1, fix); //기준 데이타 설정
			rs = pstmt.executeQuery();
			
			//해당 값을 얻는다.
			while(rs.next())	{
				k=1;
				Book_Info  data	= new Book_Info();	
				data.setNum(rs.getInt(k++));
				data.setCategory(rs.getString(k++));
				data.setTitle(rs.getString(k++));		
				data.setAuthor(rs.getString(k++));
				data.setCompany(rs.getString(k++));				
				data.setC_date(rs.getString(k++));				
				data.setPrice(rs.getInt(k++));	
				list.addElement(data);
  			}		
  			if(rs != null ) rs.close();		
		}catch(Exception e){
			error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  	if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		
		return list;
	}	
	
	//메인에 출력되는 추천도서 검색 ================================
	public Vector getMainMulti_Data(HttpServletRequest request){
	 	
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		
		String sql 					= "";
		String sql_where			= ""; //검색조건..
		String order_group 			= ""; 

		int k						= 1;
		//자신의 Url주소를 설정
		String self_url = request.getRequestURI(); 
		//결과를 저정하는 벡터 변수
		Vector list = new Vector(); 

		sql_where = " WHERE point = 'Y' " ;		
		order_group = " order by num desc "; 
		
		try{
			con = mgr.getConnection("oracle");
			
			sql = "SELECT num ,title, author, company, c_date, price  FROM BOOK_INFO_TBL "  + sql_where + order_group;
     		msg = sql;
			pstmt = con.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			//해당 값을 얻는다.
			while(rs.next())	{
				k=1;
				Book_Info  data	= new Book_Info();	
				data.setNum(rs.getInt(k++));
				data.setTitle(rs.getString(k++));		
				data.setAuthor(rs.getString(k++));
				data.setCompany(rs.getString(k++));				
				data.setC_date(rs.getString(k++));				
				data.setPrice(rs.getInt(k++));	
				list.addElement(data);
  			}		
  			if(rs != null ) rs.close();		
		}catch(Exception e){
			error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
			System.out.println("666 "+ e.toString());
  		}
  		finally{
  		  	if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		
		return list;
	}	

	public String error_show() throws Exception {
	 	return error_msg;
	}	
	public String show_msg() throws Exception {
		return msg;
	}
	 
}//end_class	