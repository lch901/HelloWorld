<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="application/vnd.ms-excel;charset=euc-kr" %>
<%@ page import="com.test.util.Utility" %>
<%@ page import="com.test.bean.Member_Entity" %>
<%@ page import="com.test.util.ServerInfo" %>
<jsp:useBean id="b_sel" scope="page" class="com.test.bean.Member_Query" />

<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd HH:mm:ss");
String today = formatter.format(new java.util.Date());
String todate = today.substring(0,8);

response.setHeader("Content-Disposition", "attachment; filename=Member"+todate+".xls");
response.setHeader("Content-Description", "JSP Generated Data");

boolean han_yn = ServerInfo.GET_HAN;
Vector list  = new Vector();//결과를 저장하기 위한 무한배열 생성
try{
	list = b_sel.getExcel_Data(request); //회원리스트를 얻는다.
	//out.println(b_sel.show_msg()); //빈즈를 통한 특정 메세지 얻기
	out.println(b_sel.Error_show()); //빈즈에서 발생된 에러 메세지 얻기
}catch(Exception e){	out.println("error ="+ e +"<Br>"); }	
int cnt = list.size(); //회원 인원수를 얻는다.
%>

<html>
<body bgcolor=white>
<%
	out.println("<TABLE BORDER=1>\n");
	out.println("<TR align=\"center\">");
	out.println("<TR align=\"center\"> 회원 리스트 ("+today+" 기준) </TR>");
	out.println("<TR align=\"center\"> 대상 : "+ cnt +"명 </TR>");

	out.println("<TR>");
	out.println("<TH bgcolor=\"#cccccc\">번호</TH>");
	out.println("<TH bgcolor=\"#cccccc\">성명</TH>");
	out.println("<TH bgcolor=\"#cccccc\">가입일</TH>");
	out.println("<TH bgcolor=\"#cccccc\">이메일</TH>");
	out.println("<TH bgcolor=\"#cccccc\">회원구분</TH>");
	out.println("<TH bgcolor=\"#cccccc\">상태</TH>");	
	out.println("</TR>");
	
	int no = cnt;
	//벡터에서 데이타 얻어 리스트 출력
	for(int i = 0; i <cnt; i++){
		Member_Entity me = (Member_Entity)list.get(i);

		out.println("<TR align=\"left\">");
		out.println("<TD>"+(no--)+"</TD>");
		out.println("<TD>"+me.getName(han_yn)+"</TD>");
		out.println("<TD>"+Utility.date_format1(me.getReg_date(),".")+"</TD>");
		out.println("<TD>"+me.getEmail()+"</TD>");
		if ("M".equals(me.getAccess1())) {
			out.println("<TD> 일반 </TD>");
		}else {
			out.println("<TD> 특별 </TD>");
		}
		if ("Y".equals(me.getState())) {
			out.println("<TD> 정상 </TD>");
		}else {
			out.println("<TD> 탈퇴 </TD>");
		}
		out.println("</TR>");
	}
	out.println("</TABLE>");
%>
</body> </html> 