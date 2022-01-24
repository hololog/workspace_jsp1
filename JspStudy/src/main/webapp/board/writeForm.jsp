<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/wirteForm.jsp</title>
</head>
<body>
<h2>글작성</h2>
<form action="writePro.jsp" method="post">
<table border="1">
	<tr>
		<th>이름</th><td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>비밀번호</th><td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<th>제목</th><td><input type="text" name="subject"></td>
	</tr>
	<tr>
		<th>내용</th><td><textarea name="content" rows="10" cols="20"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글쓰기"></td>
	</tr>
</table>
</form>
</body>
</html>