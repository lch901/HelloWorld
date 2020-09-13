package com.test.shopp;

import java.sql.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.http.*;  
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.shopp.Category; //자료형
                               
public class Category_Query {   

	private DBManager mgr;                 
	private Utility util;
	
	private String error_msg   	= ""; //에러 메세지 저장
	private String msg			= ""; //특정 값 보기 위함
	 		
	//생성자
	public Category_Query() {   
		this.mgr = new DBManager();
		this.util = new Utility();  
	}
	
	//카테고리 select ================================
	public Vector getMulti_Data(HttpServletRequest request){
	 	
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		
		String sql 					= "";
		//자신의 Url주소를 설정
		String self_url = request.getRequestURI(); 
		//결과를 저정하는 벡터 변수
		Vector list   	= new Vector(); 
		
		try{
			con = mgr.getConnection("oracle");
			
			sql = "select num, name from CATEGORY_TBL order by name desc ";
			msg = sql;
			pstmt 	= con.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			//해당 값을 얻는다.
			while(rs.next())	{
				Category  data	= new Category(rs.getInt(1), rs.getString(2));	
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

	public String error_show() throws Exception {
	 	return error_msg;
	}	
	public String show_msg() throws Exception {
		return msg;
	}
	 
}//end_class	