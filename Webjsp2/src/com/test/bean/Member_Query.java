package com.test.bean;

import java.sql.*;
import java.io.*;
import java.util.Vector;
import javax.servlet.http.*;  
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.bean.Member_Entity; 
                               
public class Member_Query {   

	private DBManager mgr;                 
	private String Error_msg   	= ""; //에러 메세지 저장
	private String msg			= ""; //특정 값 보기 위함

	private String page_navi 	= ""; //페이지 네비게이션(html)
	private int max 			= 0; //게시물 총 개수
	private int total 			= 0; //총 게시물
	private int total_page		= 0; //총 페이지
	private int current_page	= 0; //현재 페이지

	private String today		= "";
	 		
	//생성자
	public Member_Query() {   
		this.mgr = new DBManager();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
		today = formatter.format(new java.util.Date());
	}
	// Id 중복검사
	public boolean getIdcheck(String id){
		Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		String sql 					= "";
		boolean  succ  				= false;
		
		try{
			con = mgr.getConnection("oracle");

			sql  =	"SELECT  COUNT(NUM) FROM Member1_tbl where ID = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();	
			rs.next();		
			if(rs.getInt(1) < 1) {
				succ  = true;
			}
			if(rs != null) rs.close();				
		}catch(Exception e){
  			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
		  if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		return  succ;
  	}
	
	
	
	//단일값 Select==================================
	public void getSin_Data(Member_Entity data){
		Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		String sql 					= "";
		int k = 1;	
		try{
			con = mgr.getConnection("oracle");
				
			//SQL 정의 
			sql  = " SELECT  NUM, ID, NAME, EMAIL, TEL, POST, ADDR_1,ADDR_2, COMMENT1,ACCESS1, REG_DATE, STATE ";
			sql += " from   Member1_TBL  where  NUM = ? ";

			pstmt 	= con.prepareStatement(sql);
			pstmt.setInt(1, data.getNum());
    		rs = pstmt.executeQuery();    		
			if(rs.next()) {
				data.setNum(rs.getInt(k++));
				data.setId(rs.getString(k++));
				data.setName(rs.getString(k++));
				data.setEmail(rs.getString(k++));
				data.setTel(rs.getString(k++));
				data.setPost(rs.getString(k++));
				data.setAddr_1(rs.getString(k++));
				data.setAddr_2(rs.getString(k++));
				data.setComment1(rs.getString(k++));
				data.setAccess1(rs.getString(k++));
				data.setReg_date(rs.getString(k++));
				data.setState(rs.getString(k++));
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
	}//	getSin_Data end
	
	
	//다중값 select ================================
	public Vector getMulti_Data(HttpServletRequest request){
		
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		
		String sql 					= "";
		String sql_where			= ""; //검색조건..

		int k						= 1;
		//자신의 Url주소를 설정
		String self_url = request.getRequestURI(); 
			
		//Page설정 변수
		int int_pg					= 0;
		int max_num					= 0; // 총수량
		int list_num		  		= 5;// List에 출력할 수량
		
		//결과를 저정하는 벡터 변수
		Vector list   	= new Vector(); 
		
		//Search 조건을 세팅하는 부분1`
		String s_date	= request.getParameter("s_date");
		String e_date	= request.getParameter("e_date");
		
		if(s_date == null) {
			s_date = today;
			e_date = today;
		}	
		
		String all		= request.getParameter("all"); //전체검색
		
		String s_key	= request.getParameter("s_key");//검색 키
		String s_str  	= request.getParameter("s_str"); //검색 문자열
		try {
		   if(s_str != null && s_str.length() > 0) { s_str = Utility.han(s_str); }
	  }catch(Exception ee) {}	
	   System.out.println("s_str = " + s_str);
		//Page파라미터를 받는다.
		int_pg 	= Utility.numChk(request.getParameter("req_pg"), 1); 
  		current_page = int_pg;

		sql_where = "";
		
		int sw1 = 0;
		int sw2 = 0;

  	  	//검색조건을 설정한다.
 	  	if(all == null ) {
			sql_where += " where ( reg_date >= ?  and  reg_date <= ? ) " ;
			sw1 = 1;
		}
		if(s_str != null && s_str.trim().length() > 0 ) {
			if(sw1 == 1) sql_where += " and ";
			else sql_where += " where ";
			sql_where += s_key + " like  ? ";
			sw2 = 1;
		}

		try{
			con = mgr.getConnection("oracle");

			sql = "select count(NUM) from Member1_TBL " + sql_where;
			pstmt 	= con.prepareStatement(sql);	

			if(sw1 == 1) {
				pstmt.setString(k++, s_date);
				pstmt.setString(k++, e_date);
			}
			if(sw2 == 1 ) {
				pstmt.setString(k++, "%"+s_str+"%");
			}	

			rs = pstmt.executeQuery();
			if(rs.next())	{
				max_num = rs.getInt(1);
				this.total = max_num;
			}
			if(rs != null) rs.close();
			
			//page natigation 생성 및 Page설정.
			page_navi  = Utility.pageNavigation(self_url, ((request.getQueryString() == null)?"":request.getQueryString()), max_num, list_num, int_pg);
			total_page = Utility.totalpage(max_num, list_num ); 
			this.max = max_num - ((int_pg-1)*list_num);

			sql  = " SELECT NUM, ID, NAME, EMAIL, REG_DATE, ACCESS1, STATE " ;		
			sql += " FROM (SELECT NUM,ID,NAME,EMAIL,REG_DATE,ACCESS1,STATE,CEIL( ROWNUM / ? ) as page ";
			sql += "       FROM  Member1_TBL  ";
			if(sw1 == 1 || sw2 == 1 ) {
      			sql +=  sql_where ;
			}			
			sql += " order by num desc ) a ";
			sql += " where a.page = ?   ";

      		pstmt 	= con.prepareStatement(sql);
			k = 1;
      		pstmt.setInt(k++, list_num);

			if(sw1 == 1) {
				pstmt.setString(k++, s_date);
				pstmt.setString(k++, e_date);
			}	
			if(sw2 == 1 ) {
				pstmt.setString(k++, "%"+s_str+"%");
			}	

			pstmt.setInt(k++, int_pg);
			msg = sql;

			rs = pstmt.executeQuery();

			//해당 화면을 보여준다.
			while(rs.next())	{
				Member_Entity  data	= new Member_Entity();	
				data.setNum(rs.getInt(1));
				data.setId(rs.getString(2));
				data.setName(rs.getString(3));
				data.setEmail(rs.getString(4));
				data.setReg_date(rs.getString(5));
				data.setAccess1(rs.getString(6));
				data.setState(rs.getString(7));		
				list.addElement(data);
  			}		
  			if(rs != null ) rs.close();		
		}//end_try
  		catch(Exception e){
			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  	if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		
		return list;
	}//getMulti_Data end
	
	
	//Excel 파일로 저장하기위함 다중값 select ==============
	public Vector getExcel_Data(HttpServletRequest request){
		
	 	Connection con 				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		String sql 					= "";
		int k						= 1;
		Vector list   	= new Vector(); 

		try{
			con = mgr.getConnection("oracle");

			sql  = " SELECT NAME, EMAIL, REG_DATE, ACCESS1, STATE " ;		
			sql += " FROM  Member1_TBL  ORDER BY REG_DATE DESC ";
      		pstmt 	= con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			msg = sql;

			while(rs.next())	{
				Member_Entity  data	= new Member_Entity();	
				k=1;
				data.setName(rs.getString(k++));
				data.setEmail(rs.getString(k++));
				data.setReg_date(rs.getString(k++));
				data.setAccess1(rs.getString(k++));
				data.setState(rs.getString(k++));		
				list.addElement(data);
  			}		
  			if(rs != null ) rs.close();		
		}//end_try
  		catch(Exception e){
			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}
  		finally{
  		  	if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
			if(con != null)  try { con.close(); } catch(Exception e){}
  		}
  		
		return list;
	}//getExcel_Data end
	

	// Get Metthod 
	public String getPage_navi() {
	 	if(this.page_navi == null) {
			return "";
	 	}
	 	else {
			return this.page_navi;
		}
	}
	
	public int getMax() {
		return this.max;
	}

	public int getTotal() {
		return this.total;
	}
	
	public int getTotal_page() {
		return this.total_page;
	}
	
	public int getCurrent_page() {
		return this.current_page;
	}

	// Error Check ========================================
	 public String Error_show() throws Exception {
	 	return Error_msg;
	 }	
	
	// Message Check ======================================
	 public String show_msg() throws Exception {
	 	return msg;
	 }
	 
}//end_class	