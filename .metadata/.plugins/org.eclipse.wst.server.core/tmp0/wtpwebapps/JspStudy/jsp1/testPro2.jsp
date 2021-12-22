<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro2.jsp</title>
</head>
<body>
<h1>testPro2.jsp 출력 </h1>

<%
//get방식에서는 한글처리가 기본제공
//post방식의 데이터 전송에서는 한글처리가 필수
request.setCharacterEncoding("UTF-8");
//폼에서 입력한 정보를 http가 서버에 전달
//서버에서 기억장소 request를 만들어서 http가 들고온 요청정보를 request 저장

//requser에서 변수저장 후 출력하기
String sNickName=request.getParameter("nickName");//매개변수는 폼태그안에서 네임속성
// int sAge=Integer.parseInt(request.getParameter("age"));
int sAge=Integer.valueOf(request.getParameter("age"));

%>
별명 : <%=sNickName %><br>
나이 : <%=sAge %> 
<%
if(sAge<20){%>
	<p><%=sAge%>세 미성년입니다.</p>
<%} else {%>
	<p><%=sAge%>세 성인입니다.</p>
<%}%>
</body>
</html>