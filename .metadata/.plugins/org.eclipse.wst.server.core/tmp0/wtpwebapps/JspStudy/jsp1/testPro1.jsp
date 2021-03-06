<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro1.jsp</title>
</head>
<body>
<h1>jsp1/testPro1.jsp</h1>
<% 
/*
사용자 웨브라우저 주소입력
http://localhost:8080/JspStudy/jsp1/testPro1.jsp?name=kim&num=8
 => http가 요청정보(testPro1.jsp?name=kim&num=8)를 가지고 localhost:8080 서버를 찾아감  
 => 웹 서버에 도착 => testPro1.jsp를 찾음 (html이면 이면 바로 http에 전달) =>처리작업필요
 => 처리서버인 웹 애플리케이션 서버가 전달받아서 처리
   1. 요청정보를 서버에 저장=> 저장공간 만들기 
     -request내장객체가 객체생성 : 사용자 요청정보 저장공간
     -response내장객체가 객체생성 : 서버 처리결과정보 저장공간
   2. web.xml 참조 (처리담당자 지정 : 서블릿자동으로 지정)                            
 => 처리담당자가 request정보를 이용하여 처리하고 html로 변경해서 response에 저장
 => 처리담당자가 response정보를 웹서버에 전달
 => 웹서버가 찾은 파일을 http에 전달
 => http는 사용자 컴퓨터에 전달

 request객체(멤버변수, 멤버함수) 정의
 request안에 name=kim&num=8 저장
 request에서 출력하기 위해서 가지고 옴
 
 request에는 모두 문자열로 저장
*/
%>
이름 : <%=request.getParameter("name")%><br>
좋아하는 숫자 : <%=request.getParameter("num")%><br>
<%
String sname=request.getParameter("name");
int snum=Integer.parseInt(request.getParameter("num"));
%>
변수에 저장한 이름 : <%=sname%><br>
변수에 저장한 좋아하는 숫자 : <%=snum%><br>
변수에 저장한 좋아하는 숫자+100 : <%=snum+100%><br>
<%
//참조형을 기본형으로 형변환
%>

</body>
</html>