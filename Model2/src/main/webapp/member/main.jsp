<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("login.me");
}
%>
<h1><%=id %>님이 로그인 하셨습니다.</h1>
	<input type="button" value="회원정보수정" onclick="location.href='update.me'"><br><br>
	<input type="button" value="회원정보조회" onclick="location.href='info.me'"><br><br>
	<input type="button" value="회원탈퇴" onclick="location.href='delete.me'"><br><br>
	<input type="button" value="로그아웃" onclick="location.href='logout.me'"><br><br>
<%
if(id!=null){
	if(id.equals("admin")){%>
		<input type="button" value="회원목록" onclick="location.href='list.me'">
	<%}
}
%>	


</body>
</html>