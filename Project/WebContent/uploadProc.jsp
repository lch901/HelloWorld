<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
String uploadPath="c:\\"; //"c:\\aaa" 디렉토리 생성후
int size=10*1024*1024;
String username="";
String filename="";
try {
	MultipartRequest multi=new MultipartRequest(request, uploadPath,
	size, "euc-kr", new DefaultFileRenamePolicy());
	username=multi.getParameter("username");
	Enumeration files=multi.getFileNames();
	String file=(String) files.nextElement();
	filename=multi.getFilesystemName(file);
}
catch(Exception e){
	e.printStackTrace();
}
out.println("작성자:" + username + "<br>");
out.println("업로드파일:"+ filename + "<br>");
