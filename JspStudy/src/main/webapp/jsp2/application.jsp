<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/application</title>
</head>
<body>
<%
//application 내장객체 : 웹서버, 웹 애플리케이션 서버 정보를 저장
//                  : 서버가 Strt 되면 기억장소 만들어짐
//                  : 서버가 stop되면 기억장소가 사라짐
//                  : 사용이유- 페이지 상관없이 , 유져상관없이 값을 유지하기 위해

%>
서버정보 : <%=application.getServerInfo() %><br>  
서버의 물리적 경로 : <%=application.getRealPath("/") %><br>

<%
// pageContext 내장객체 : 현페이지 정보를 저장하는 내장객체
// out 내장객체 : 출력정보를 저장하는 내자객체
out.println("출력");
//출력마감
out.close(); 
out.println("마감후 출력");//동작안함 에러발생
%>
</body>
</html>