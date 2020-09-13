<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="project.*" %>
<jsp:useBean id="member" class="db.MemberDAO"/>
<jsp:setProperty property="*" name="member" />
<%
	
%>

<%
String from=request.getParameter("from_name");
String to=request.getParameter("to_name");
String title=request.getParameter("b_title");
String content=request.getParameter("b_content");
String host = "smtp.naver.com";
String port="465";
try{

Properties props = new Properties();
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.host", host);
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.port", port);
props.put("mail.smtp.auth", "true");

Authenticator auth=new Mail();
Session sess= Session.getDefaultInstance(props, auth);

Message msg = new MimeMessage(sess);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.TO, address);

msg.setSubject(title);   //제목설정
msg.setSentDate(new java.util.Date());
msg.setContent(content,"text/html;charset=euc-kr");

Transport.send(msg);  //메일보내기
%>
메일을 보냈습니다.
<%
} catch (MessagingException ex) {
out.println("mail send error 실패 : " + ex.getMessage());
}catch(Exception e){
out.println("error 실패 : " + e.getStackTrace());
}
%>