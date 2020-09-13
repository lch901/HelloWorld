package com.test.bean;

import java.sql.*;
import java.util.Enumeration;
import java.io.*;
import javax.servlet.http.*; 
import com.test.util.ServerInfo;

import com.test.util.Utility;
import com.test.db.DBManager;
import com.test.bean.Member_Entity;
import com.test.mail.MailSendBean;
                               
public class Member_Update {   

	private DBManager mgr;                 
	private boolean success 	= false;
	private boolean han_yn	 	= ServerInfo.SET_HAN;

	private String Error_msg  = "";
	private String msg				= "";

	//생성자
	public Member_Update() {   
		this.mgr = new DBManager();
   	}

	//DML을 처리 ==========================================
	public boolean execUpdate(Member_Entity data, HttpServletRequest request) throws Exception {
	 	Connection con				= null;
		PreparedStatement  pstmt 	= null;
		ResultSet  rs				= null;
		String sql 					= "";
	
		try{
			con = mgr.getConnection("oracle");
				
			// AutoCommit; false 
			if(con.getAutoCommit()) {
				con.setAutoCommit(false);
			}	
				
			if(data.getCmd().equals("insert")){//회원등록
  				
				sql  = "insert into Member1_TBL(NUM, ID, PWD, NAME, EMAIL, TEL, POST, ADDR_1, ADDR_2, COMMENT1, ACCESS1, REG_DATE, STATE) ";	
				sql += " values(COMM1_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
										  	
				pstmt = con.prepareStatement(sql);		
				int i=1;
				pstmt.setString(i++,data.getId());
				pstmt.setString(i++,data.getPwd());
				pstmt.setString(i++,data.getName(han_yn));
				pstmt.setString(i++,data.getEmail());
				pstmt.setString(i++,data.getTel());
				pstmt.setString(i++,data.getPost());
				pstmt.setString(i++,data.getAddr_1(han_yn));	
				pstmt.setString(i++,data.getAddr_2(han_yn));	
				pstmt.setString(i++,data.getComment1(han_yn));
				pstmt.setString(i++,data.getAccess1());
				pstmt.setString(i++,data.getReg_date());	
				pstmt.setString(i++,"Y");										
				pstmt.executeUpdate();					
						
				msg = sql;
				success = true;
				
				//가입 축하 메일 발송 작업 ////////////////////////////
  			/*	String url = ServerInfo.URL; 
						
				StringBuffer sb = new StringBuffer();
				File  ff = new File(request.getRealPath("./mail"));
    			RandomAccessFile   readF = new RandomAccessFile(new File(ff, "mail_member.html"), "r");
    			String  data3 = "";
				String content = "";
			    try {  
			    	readF.seek(0);
					while((data3 = readF.readLine())!=null) {	
					  sb.append(data3);
					}						
				}catch(Exception e){}	
				finally {
	    			readF.close();
				}

				content = new String(sb.toString().getBytes("8859_1"),"ksc5601");
					
				//url 및 정보 설정 					
				content = content.replaceAll("<!--url-->", url); //url 변경
				content = content.replaceAll("<!--name-->",data.getName(han_yn)); //회원 성명
				content = content.replaceAll("<!--id-->",data.getId()); //회원 아이디
				content = content.replaceAll("<!--email-->",data.getEmail()); //회원 이메일
				
				//메일 전송 정보 셋팅	
				String from_name  = ServerInfo.MAIL_FROM_NAME;
				String from_email = ServerInfo.MAIL_FROM_EMAIL;
				String subject = "「자바쌤!」회원가입 축카합니다!";
		
				//메일 발송 객체 생성
			 	MailSendBean  mail_bean = new MailSendBean(from_name, from_email, subject, content);

				String to_name = data.getName(han_yn); 
				String to_email = data.getEmail(); 
				if(mail_bean.sendMail(to_email, to_name)) {
					System.out.println("축하 메일 전송 완료!");
				}else {
					System.out.println("축하 메일 전송 실패!");
				}*/
			}
			else if(data.getCmd().equals("multi_del")) {
				//리스트에서 삭제 체크박스 체크 된것 모두 가지고 온다.
	   	        String values[] = request.getParameterValues("num");
	
	   	        if(values != null){
	   	        	sql  = "update  Member1_TBL  set  state = 'N' where NUM = ? ";	
	   	        	pstmt = con.prepareStatement(sql);		
	   	          	for(int i= 0; i < values.length; i++){
	   	          		if(values[i] == null) continue;
	   	          		int num = Integer.parseInt(values[i]);
	   	      			pstmt.setInt(1, num);
						pstmt.executeUpdate();
		            }//while_end	
		      	    success = true;
				}					
			}// multi_del  end
			
			else if(data.getCmd().equals("rec")) {
	       	   	sql  = "update Member1_TBL set state = 'Y' where NUM = ? ";	
	       	   	pstmt = con.prepareStatement(sql);		
	   	    	pstmt.setInt(1, data.getNum());
				pstmt.executeUpdate();
	      	    success = true;
			}//
			
			else if(data.getCmd().equals("update")){ // 데이타를 수정한다.
				sql = " UPDATE Member1_TBL SET PWD = ?, EMAIL = ?, TEL = ?, POST = ? , ADDR_1 = ? , ADDR_2 = ? , COMMENT1 = ? , ACCESS1 = ? "; 
				sql +=" where  NUM = ? ";			
				pstmt = con.prepareStatement(sql);		
				int i=1;
				pstmt.setString(i++,data.getPwd());
				pstmt.setString(i++,data.getEmail());
				pstmt.setString(i++,data.getTel());
				pstmt.setString(i++,data.getPost());
				pstmt.setString(i++,data.getAddr_1(han_yn));	
				pstmt.setString(i++,data.getAddr_2(han_yn));	
				pstmt.setString(i++,data.getComment1(han_yn));
				pstmt.setString(i++,data.getAccess1());
				pstmt.setInt(i++,data.getNum());
							
				pstmt.executeUpdate();					
						
				success = true;						
			}//end_modify
			else if(data.getCmd().equals("delete")) {
	   	        int num1 = data.getNum();
   	        	sql  = "update  Member1_TBL  set  state = 'N' where NUM = ? ";	
	   	        pstmt = con.prepareStatement(sql);		
	   	        pstmt.setInt(1, num1);
				pstmt.executeUpdate();
		        success = true;
									
			}// multi_del  end
			
			else if(data.getCmd().equals("multi_mod")) {
				//리스트에서 체크박스 체크 된것 모두 가지고 온다.
		        String values[] = request.getParameterValues("num");
	   	        if(values != null){
					for(int i=0; i < values.length; i++) {
						String acc = request.getParameter("access1_"+values[i]);
						sql  = "update  Member1_TBL  set  access1 = ?  where NUM = ? ";	
			        	pstmt = con.prepareStatement(sql);		
						if(values[i] == null || values[i]=="")  continue;
	           			pstmt.setString(1, acc);
	           			pstmt.setInt(2, Integer.parseInt(values[i]));
						pstmt.executeUpdate();
		            }//for_end	
				}	
				success = true;				
			}// multi_mod  end
			
	 	}//end_try
	 	catch(Exception e){
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

	// Error Check ========================================
	 public String Error_show() throws Exception {
 		return Error_msg;
	 }	
	
	// Message Check ======================================
	 public String show_msg() throws Exception {
 		return msg;
	 }		

}//end_class 