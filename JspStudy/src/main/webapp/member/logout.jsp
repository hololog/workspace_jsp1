<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
session.invalidate();
// response.sendRedirect("login.jsp");
%>
<script type="text/javascript">
	alert("๋ก๊ทธ์์");
	location.href="loginForm.jsp";
</script>
</body>
</html>