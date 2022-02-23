<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginForm.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id!=null){%>
	<script type="text/javascript">
		alert("이미 로그인한 사용입니다.");
		location.href="main.jsp";
	</script>
<%}%>
<h1>로그인</h1>
<form action="loginPro.me" method="post">
<fieldset>
 <legend>sign in</legend>
 	<label for="id">아이디 : </label> <input type="text" name="id" id="id"><br>
 	<label for="pass">비밀번호 : </label> <input type="password" name="pass" id="pass"><br>
  	<input type="submit" value="로그인">
  	<input type="button" value="회원가입" onclick="location.href='insert.me'">
  	
</fieldset>
</form>
</body>
</html>