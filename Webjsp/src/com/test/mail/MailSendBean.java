package com.test.mail;

import java.util.Date;
import java.util.Properties;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import javax.servlet.http.*;  
import com.test.util.ServerInfo;
import com.test.util.Utility;

public class MailSendBean {   
	
	//보내는 사람 정보 & 컨테츠 설정
	String from_name ="";
	String from_email ="";
	String subject = "";
	String content = "";

	Properties props = new Properties();
	Session MailSession = null;
  	Message mailMessage = null;
	InternetAddress add= null;
	
	//디폴트 생성자
	public MailSendBean() {   }	

	//매개변수가 있는 생성자 - SMTP 셋팅 완료
	public MailSendBean(String from_name, String from_email, String subject, String content1) {   
		this.from_name= from_name;
		this.from_email = from_email;
		this.subject = subject;
		this.content = content1;
		try {	
			this.props.put("mail.smtp.host", ServerInfo.SMTP_URL);
			this.MailSession = Session.getInstance(this.props, null);
		    this.mailMessage = new MimeMessage(MailSession); 
			this.add= new InternetAddress();
			this.add.setAddress(this.from_email);  // 보내는 사람 주소 세팅
			this.add.setPersonal(this.from_name, "EUC-KR");  // 보내는 사람 이름 세팅
			this.mailMessage.setFrom(add);  //add 객체를 이용하여 세팅한다.
		}catch(Exception e) { System.out.println("메일서버 셋팅 에러 : "+ e.toString()); }
	}// method end

	
	//실질적인 메일 전송하는 부분
	public  boolean  sendMail(String to_email, String to_name) throws Exception {
		boolean  sw = false;
		try{
			// 받는 정보 셋팅 -------------------------------------------------------------
			this.mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to_email));  
			// 제목 셋팅 ------------------------------------------------------------------	
			this.mailMessage.setSubject(subject);  // 메일 제목 세팅
			//보내는 날짜  셋팅 -----------------------------------------------------------	
			this.mailMessage.setSentDate(new Date());  // 보낸 날짜 세팅
			// 내용  정보 셋팅 ------------------------------------------------------------   
		 	this.mailMessage.setContent(content,"text/html;charset=euc-kr");//한글처리 
			//메일 전송 ----- -------------------------------------------------------------	
			Transport transport = MailSession.getTransport("smtp");
			transport.send(mailMessage);
			sw =  true;
		}catch(MessagingException m)  {
			System.out.println("Mail Error = "+ m);
		}catch(Exception  e) { System.out.println("error = "+ e.toString()); }
		return sw;
	}

}		
