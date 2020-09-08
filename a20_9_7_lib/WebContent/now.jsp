<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="xx" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- WEB-INF - now.tag -->
1.오늘의 날짜는<mylib:now/>입니다<br/>
2.헤드라인 연습<br/>
<xx:header title="헤드라인 연습1" level="1"/>
<xx:header title="${'헤드라인 연습2'}" level="2"/>
<xx:header title='<%="헤드라인 연습3" %>' level="3"/>
<xx:header title="헤드라인 연습4" level="4"/>
<xx:header title="sibar" level="6"/>
<br/>

3.select연습<br/>
<form action="result.jsp" method="get">
	기존 태그<select name="code">
		<option value="rgb">RGB모드</option>
		<option value="wb">흑백모드</option>
	</select><br/>
	만든 태그<xx:select name="code2" rgb="RGB모드" wb="흑백모드" rgba="RGBa모드" wba="흑백a모드"/><br/>	
	kinds<xx:select name="fuck" eu="유럽" america="아메리카" russia="러시아" japanese="일본" chinese="짱깨" korea="국산"/><br/>
	<input type="submit" value="전송">
</form><br/><br/>

4.multiple연습<br/>
<c:set var="num" value="1"/>
<xx:multiple count="5">
	${num}
	<c:set var="num" value="${num+1+2 }"/>
</xx:multiple><br/><br/>


4.sum연습
<xx:sum begin="1" end="10">
	${sum}
	${num}
</xx:sum><br/>


5.out연습
<xx:out>
	
</xx:out>
</body>
</html>