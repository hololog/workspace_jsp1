<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/updateForm.jsp</title>
</head>
<body>
<%
//수정정보 가져오기 get방식(주소로)
int num=Integer.parseInt(request.getParameter("num"));
// 1 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection connect=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3 sql 작성/ 준비
String sql="select * from board where num=?";
PreparedStatement pstmt=connect.prepareStatement(sql);
pstmt.setInt(1, num);
// 4 sql 실행
ResultSet rs=pstmt.executeQuery();
// 5 접근
if(rs.next()){
%>
<h2>글수정</h2>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num %>">
<table border="1">
	<tr>
		<th>이름</th><td><input type="text" name="name" value="<%=rs.getString("name") %>" readonly></td>
	</tr>
	<tr>
		<th>비밀번호</th><td><input type="password" name="pass"></td>
		<!-- 비밀번화 확인후 글수정 -->
	</tr>
	<tr>
		<th>제목</th><td><input type="text" name="subject" value="<%=rs.getString("subject") %>"></td>
	</tr>
	<tr>
		<th>내용</th><td><textarea name="content" rows="10" cols="20"><%=rs.getString("content") %></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글수정"></td>
	</tr>
</table>
<%} %>
</form>
</body>
</html>