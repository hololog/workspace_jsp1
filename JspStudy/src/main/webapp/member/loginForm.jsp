<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginForm.jsp</title>
</head>
<body>
<h1>로그인</h1>
<form action="loginPro.jsp" method="post">
<fieldset>
 <legend>sign in</legend>
 	<label for="id">아이디 : </label> <input type="text" name="id" id="id"><br>
 	<label for="pass">비밀번호 : </label> <input type="password" name="pass" id="pass">
  	<input type="submit" value="로그인">
</fieldset>
</form>
</body>
</html>