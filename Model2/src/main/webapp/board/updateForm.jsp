<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateForm.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
BoardDAO bDAO=new BoardDAO();
BoardDTO bDTO=bDAO.getContent(num);
%>
<h2>글수정</h2>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num %>">
<table border="1">
	<tr>
		<th>이름</th><td><input type="text" name="name" value="<%=bDTO.getName() %>" ></td>
	</tr>
	<tr>
		<th>비밀번호</th><td><input type="password" name="pass"></td>
		<!-- 비밀번화 확인후 글수정 -->
	</tr>
	<tr>
		<th>제목</th><td><input type="text" name="subject" value="<%=bDTO.getSubject() %>"></td>
	</tr>
	<tr>
		<th>내용</th><td><textarea name="content" rows="10" cols="20"><%=bDTO.getContent() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글수정"></td>
	</tr>
</table>

</form>
</body>
</html>