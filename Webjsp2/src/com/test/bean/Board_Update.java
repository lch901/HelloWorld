package com.test.bean;

import java.io.*;
import java.sql.*;
import javax.servlet.http.*; 
import com.test.util.ServerInfo;
import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.bean.Board_Entity;
                               
public class Board_Update {   

	private DBManager mgr;                 
		
	private String today		= "";
	private boolean success 	= false;
	private boolean han_yn	 	= ServerInfo.SET_HAN;

	private String Error_msg  = "";
	private String msg				= "";

	//디폴트 생성자========================================
	public Board_Update() {   
		this.mgr = new DBManager();
			
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
		today	= formatter.format(new java.util.Date());
   	}

	//DML을 처리===========================================
 	public boolean execUpdate(Board_Entity data, HttpServletRequest request) throws Exception {
	 	
		Connection con				= null;
		PreparedStatement  pstmt 		= null;
		ResultSet  rs				= null;
		String sql 					= "";
		String sql_where 			= "";
	
		try{
			con = mgr.getConnection("oracle");
				
			// AutoCommit; false 
			if(con.getAutoCommit()) {
				con.setAutoCommit(false);
			}	
				
		 	if(data.getCmd().equals("insert")){ //글 등록
				sql  = "insert into BOARD1_TBL(NUM, REG_NAME, TITLE, CONTENT, FILE_NAME1, DOC_GROUP, DOC_POS, DOC_STEP, IP_NUM, REG_DATE, STATE) ";	
				sql += "values(COMM1_SEQ.NEXTVAL,?,?,?,?,COMM1_SEQ.CURRVAL,0,0,?,?,'Y')";
									  	
				pstmt = con.prepareStatement(sql);		
				int i=1;
					
				pstmt.setString(i++,data.getReg_name(han_yn));
				pstmt.setString(i++,data.getTitle(han_yn));
				pstmt.setString(i++,data.getContent(han_yn));
				pstmt.setString(i++,data.getFile_name1(han_yn));
				pstmt.setString(i++,data.getIp_num()); //ip 주소 입력받는다.. 
				pstmt.setString(i++,data.getReg_date());	
				pstmt.executeUpdate();					
						
				msg = sql;
				success = true;
			}//insert end
			else if(data.getCmd().equals("multi_del")) { //일괄삭제
       	        String values[] = request.getParameterValues("no");
       	        if(values != null){
       	        	sql  = "update BOARD1_TBL set  state = 'N'  where num = ? ";	
       	        	pstmt = con.prepareStatement(sql);		
	       	        for (int i=0; i < values.length; i++){
	       	        	if(values[i] == null) continue;
           	      		pstmt.setInt(1, Integer.parseInt(values[i]));
						pstmt.executeUpdate();
	      	        }//for_end	
	      	        success = true;
				}					
			}// multi_del  end
			else if(data.getCmd().equals("recovery")) { //복원
       	        sql  = "update BOARD1_TBL set  state = 'Y' where num = ? ";	
       	        pstmt = con.prepareStatement(sql);		
   	      		pstmt.setInt(1, data.getNum());
				pstmt.executeUpdate();
      	        success = true;
			}//
			else if(data.getCmd().equals("reply")){//답글 등록
		 		int doc_step				= 0;
				int doc_pos					= 0;
				int doc_group				= 0;

				//답글의 위치와 깊이를 계산한다.===========
				sql = "select doc_step, doc_pos, doc_group from BOARD1_TBL where num = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,data.getP_num()); //부모글정보
				rs = pstmt.executeQuery();
				if(rs.next())	{
					doc_step 		= rs.getInt(1);
					doc_pos 		= rs.getInt(2);
					doc_group 	 	= rs.getInt(3);
				}
				rs.close();
   			
			    //step을 update한다.=======================
				sql = "UPDATE  BOARD1_TBL SET DOC_STEP = DOC_STEP+1  WHERE  DOC_GROUP = ? AND DOC_STEP > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,doc_group);
				pstmt.setInt(2,doc_step);
				pstmt.executeUpdate();
					
				// 답글 Data등록 ==========================
				sql  = "insert into BOARD1_TBL(NUM, REG_NAME, TITLE, CONTENT, FILE_NAME1,DOC_GROUP, DOC_POS, DOC_STEP, IP_NUM, REG_DATE, STATE) ";	
				sql += "values(COMM1_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,'Y')";
				pstmt = con.prepareStatement(sql);		

				int i=1;
				pstmt.setString(i++,data.getReg_name(han_yn));
				pstmt.setString(i++,data.getTitle(han_yn));
				pstmt.setString(i++,data.getContent(han_yn));
				pstmt.setString(i++,data.getFile_name1(han_yn));
				pstmt.setInt(i++, doc_group);
				pstmt.setInt(i++,doc_pos+1);
				pstmt.setInt(i++,doc_step+1);
				pstmt.setString(i++,data.getIp_num()); //ip 주소 입력받는다.. 
				pstmt.setString(i++,data.getReg_date());	
				pstmt.executeUpdate();					
				
				success = true;						
			}//end_reply
			
			else if(data.getCmd().equals("update")){//수정
				//첨부파일 교체 및 제거일 경우 - 기존의 파일명 얻기
				String del_file = "";
				if(data.getFile_name1(false).trim().length() > 0 || "ok".equals(data.getF_del1())) {
					sql += "select FILE_NAME1 from BOARD1_TBL where NUM = ? ";
					pstmt = con.prepareStatement(sql);	
					pstmt.setInt(1,data.getNum());
					rs = pstmt.executeQuery();
					if(rs.next()) {
						del_file = rs.getString(1);
					}
					if(rs != null) rs.close();
				}
			
				sql = " UPDATE BOARD1_TBL SET TITLE= ?, CONTENT= ?  "; 
				sql_where = " where  NUM = ? ";
				if(data.getFile_name1(false).trim().length() > 0 || "ok".equals(data.getF_del1())) {
					sql += " , FILE_NAME1 = ? ";
				}
				sql += sql_where ;
				pstmt = con.prepareStatement(sql);		

				int i=1;
				pstmt.setString(i++,data.getTitle(han_yn));
				pstmt.setString(i++,data.getContent(han_yn));
			
				if(data.getFile_name1(false).trim().length() > 0 || "ok".equals(data.getF_del1())) {
					if(data.getFile_name1(false).trim().length() > 0 ) {
						pstmt.setString(i++,data.getFile_name1(han_yn));
					}else {
						pstmt.setString(i++,"");
					}	
				}
				pstmt.setInt(i++,data.getNum());
				pstmt.executeUpdate();	
					
				success = true;	
				
				if(del_file.length() > 0) {
				   String path = request.getRealPath("/Ch09/freeboard/attach_file");
				   File file=new File(path+"/"+del_file);
				   if(file.exists()) {	
					   file.delete();
				   }
			    }
			}//end_update
			else if((data.getCmd()).equals("delete")){
 				String chk = "";	
				if("Y".equals(data.getState())){ //삭제
					chk = "N";
				}else { //복원
					chk = "Y";
				}
				sql  = "update BOARD1_TBL set state = ? where num = ? ";
				pstmt = con.prepareStatement(sql);	
				pstmt.setString(1, chk);
				pstmt.setInt(2, data.getNum());							
				pstmt.executeUpdate();
						
				msg = sql;
				success = true;
			}//end
			
					
 		}catch(Exception e){
	  		if(con != null) con.rollback();
  			Error_msg = "<br>sql : "+ sql +"<br>Error "+ e.toString();
  		}//end_catch	
		finally{
  			if(pstmt != null) try { pstmt.close(); } catch(Exception e){} 
		    //===================== AutoCommit true ==
			if(con != null && !con.getAutoCommit()) { 
				con.commit();
				con.setAutoCommit(true);
			}
			if(con != null)  try {con.close(); } catch(Exception e){}
		}//end_finally	
	 	msg=sql;
	 		
	 	return success;
	}
	
	//Error Check ==========================================
	public String Error_show() throws Exception {
		return Error_msg;
	}	
	
	//SQL문 확인 메소드 ===================================
	public String show_msg() throws Exception {
		return msg;
	}		

}//end_class 