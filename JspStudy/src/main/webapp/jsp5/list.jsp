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
<title>jsp5/list.jsp</title>
</head>
<body>
<%
//회원목록
//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2 db 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3. sql 만들기
String sql="select num,name, subject, readcount, date from board;";
PreparedStatement pstmt=con.prepareStatement(sql);
//4. sql 실행
ResultSet rs=pstmt.executeQuery();
//5. 다음행 -> 열접근 id
//6.글번호로 글검색하는 링크 글제목에 걸기 get 방식 3가지 알기(주소줄에직접)
%>
<table border="1">
 <tr>
 	<th>글번호</th><th>글쓴이</th><th>글제목</th><th>조회수</th><th>글쓴날짜</th>
 </tr>
 <%
 while(rs.next()){
	 %>
	 <tr>
	 	<td><%=rs.getInt("num") %></td>
	 	<td><%=rs.getString("name") %></td>
	 	<td><a href="content.jsp?num=<%=rs.getInt("num") %>"><%=rs.getString("subject") %></a></td>
	 	<td><%=rs.getInt("readcount") %></td>
	 	<td><%=rs.getTimestamp("date") %></td>
	 </tr>
	 <%
 }
 %>
</table>

</body>
</html>