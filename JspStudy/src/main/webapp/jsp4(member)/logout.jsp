<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/logout.jsp</title>
</head>
<body>
<%
//세션 초기화 방법(세션내장객체 삭제)
//1.브라우저 닫기
//2.30분이상 작업이 없을때
//3.로그아웃 (세션내장객체전체 삭제 명령)
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="main.jsp";
// 	location.href="loginForm.jsp";
</script>
</body>
</html>