<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/scopeProPro.jsp</title>
</head>
<body>
<h1>jsp2/scopeProPro.jsp</h1>
<%
//폼에서 들고 간 정보를 서버의 request에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("sess") %><br>
application 값 : <%=application.getAttribute("app") %><br>
</body>
</html>