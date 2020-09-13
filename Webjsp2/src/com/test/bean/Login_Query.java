package com.test.bean;

import java.sql.*;
import java.io.*;
import javax.servlet.http.*;  
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.bean.Member_Entity; 
                               
public class Login_Query {   
	private DBManager mgr;                 
	private String Error_msg   	= ""; //에러 메세지 저장
	private String msg		= ""; //특정 값 보기 위함
	private String today		= "";
	 		
	//생성자
	public Login_Query() {   
		this.mgr = new DBManager();
	}
	public  int  getSys_LoginChk(String id, String pwd, HttpServletRequest request ){
			
		Connection con 				= null;
		PreparedStatement  pstmt 		= null;
		ResultSet  rs				= null;
		String sql 					= "";
		int result = 1; 

		try{
			con = mgr.getConnection("oracle");
				
			sql  = " SELECT  NUM, ID, PWD, NAME, EMAIL, ACCESS1, STATE ";
			sql += " from   Member1_TBL  where  STATE = 'Y' AND ID = ? ";
			pstmt 	= con.prepareStatement(sql);
			pstmt.setString(1, id);		
   			rs = pstmt.executeQuery();
    			
			if(rs.next()) {
				Member_Entity me= new Member_Entity();
				me.setNum(rs.getInt(1));
				me.setId(rs.getString(2));
				me.setPwd(rs.getString(3));
				me.setName(rs.getString(4));
				me.setEmail(rs.getString(5));
				me.setAccess1(rs.getString(6));
				me.setState(rs.getString(7));
				
				if (me.getPwd().equals(pwd)){
				    result = 2; //로그인 성공 확인. 
					//세션정보 설정				    
				    Utility.setSession(request, "u_num", String.valueOf(me.getNum()));//사용자고유번호
        			Utility.setSession(request, "u_id",  id); //아아디
                    Utility.setSession(request, "u_name", me.getName(false));//성명
				    Utility.setSession(request, "u_email", me.getEmail()); //이메일
				    Utility.setSession(request, "u_allow", me.getAccess1());//권한(회원구분)
				}
				else {
				    result =3;	//pass word가 틀린 경우.
				}
			}
			if(rs != null) rs.close();
			msg = sql;
		}
  		catch(Exception e){
  			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
		  if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		return result; //result =1 이면 로그인 실폐 !
  		
	}//	getId_chk end
	
	// Error Check ========================================
	public String Error_show() throws Exception {
	 	return Error_msg;
	}	
	
	//Message Error Check =================================
	public String show_msg() throws Exception {
	 	return msg;
	}
}//end_class	



