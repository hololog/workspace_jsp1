<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/list.jsp</title>
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
String sql="select * from member;";
PreparedStatement pstmt=con.prepareStatement(sql);
//4. sql 실행
ResultSet rs=pstmt.executeQuery();
//5. 다음행 -> 열접근 id
// while(rs.next()){
// 	out.println(rs.getString("id"));
// 	out.println(rs.getString("pass"));
// 	out.println(rs.getString("name"));
// 	out.println(rs.getTimestamp("date"));
// 	out.println("<br>");	
// }
%>
<table border=1>
<tr>
	<td>아이디</td><td>비밀번호</td><td>이름</td><td>날짜</td>
</tr>
	<%
	while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("pass") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("date") %></td>
		</tr> 
		<%
	}
	%>

</table>
</body>
</html>