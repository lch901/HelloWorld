package com.test.bean;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*; 
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.util.ServerInfo;
import com.test.bean.Post_Entity;
                               
public class Post_Query {   
	private DBManager mgr;                 
	private boolean han_yn	 	= ServerInfo.GET_HAN;
	private String Error_msg    = "";
	private String msg		    = "";

	//생성자
	public Post_Query() {   
		this.mgr = new DBManager();
	}

	// 우편번호 검색 처리한다.
	public Vector getMul_Data(HttpServletRequest request) throws SQLException{
	 	Connection con 		= null;		
		PreparedStatement pstmt = null;
		ResultSet  rs		= null;
		String sql 		    = "";
		String sql_where	= "";			
				
		//결과를 저정하는 변수
		Vector temp   	    = new Vector(); 
		
		//동명 이름을 얻는다.		
  		String search_val = request.getParameter("dongid");		
		if(search_val == null) search_val ="";
		search_val = Utility.han(search_val);
 		try{     
			con = mgr.getConnection("oracle");
			
			sql  = "select ZIPCODE, SIDO, GUGUN, DONG, RI, BUNJI from tbl_postcode  ";
			sql += "WHERE DONG LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,"%"+search_val+"%");
			rs = pstmt.executeQuery();	
				
			//해당 데이타를 얻는다.	
			while(rs.next()){			
				Post_Entity me= new Post_Entity();
				me.setZipcode(rs.getString(1));	
				me.setSido(rs.getString(2));
				me.setGugun(rs.getString(3));
				me.setDong(rs.getString(4));
				me.setRi(rs.getString(5));
				me.setBunji(rs.getString(6));
					
				temp.addElement(me);
			}// while end
				
			if(rs != null ) rs.close();		
			
		}catch(Exception e){
	  			if(con != null) con.rollback();
  				Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}//end_catch	
		finally{
  		 		if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			    //AutoCommit true =========================
				if(con != null && !con.getAutoCommit()) { 
					con.commit();
					con.setAutoCommit(true);
				}
				if(con != null)  try {con.close(); } catch(Exception e){}
		}//end_finally	
 		msg=sql;
	 		
 		return temp;
	}//

	// Error Check ========================================
	public String Error_show() throws Exception {
		return Error_msg;
	}	
	
	// Message Check ======================================
	public String show_msg() throws Exception {
		return msg;
	}		

}//end_class 