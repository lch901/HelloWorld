package com.test.db;

import java.sql.*;
import javax.sql.*;
import javax.sql.DataSource;
import javax.naming.*;

public class DBManager{

	public DBManager() {}
	/*
	public Connection getConnection(String div) throws Exception{
	
		Connection con = null;	//연결
		
	    try	{
	    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	    }
	    catch(Exception e)	{	throw e;  }
	
	   try 	{
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","1234"); 			    	
	   }
	   catch(Exception e){	throw e;   }

	   return con;
	
	}
	*/
	//jdcp 기능 사용할시 ====================================
	public Connection getConnection(String div) throws Exception{
		
		Connection conn = null;
		
		try{
 			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
		
 			if(envCtx != null ){ 
		 		DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle");
		 		if (ds != null) {
  	 				conn = ds.getConnection();
   	 			}
   	 		}
 		}catch(Exception e){}
 		
		return conn;
	}
	

}