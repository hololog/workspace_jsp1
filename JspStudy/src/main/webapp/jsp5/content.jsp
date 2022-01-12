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
<title>jsp5/content.jsp</title>
</head>
<body>
<%
//http://localhost:8080/JspStudy/jsp5/content.jsp?num=1
//http://localhost:8080/JspStudy/jsp5/content.jsp?num=2
//서버 request에 저장
//글내용보기 - 글번호로 검색
int num=Integer.parseInt(request.getParameter("num"));
///왜 형변환? getParameter메서드의 반환값은 String 이라서
//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2 db 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//자습 readcount추가
int count=0;
String sql="select readcount from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1,num);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	count=rs.getInt("readcount");
	count++;
}
//readcount 업데이트
sql="update board set readcount=? where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1,count);
pstmt.setInt(2,num);
pstmt.executeUpdate();

//3.sql 작성
sql="select num, name, date, readcount, subject, content from board where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1,num);
//4 sql 실행 저장
rs=pstmt.executeQuery();

if(rs.next()){
%>
<table border="1">
	<tr>
	 <th>글번호</th><td><%=rs.getInt("num") %></td>
	 <th>글쓴날짜</th><td><%=rs.getTimestamp("date") %></td>
	</tr>
	<tr>
	 <th>글쓴이</th><td><%=rs.getString("name") %></td>
	 <th>조회수</th><td><%=rs.getInt("readcount") %></td>
	</tr>
	<tr>
	 <th>글제목</th><td colspan="3"><%=rs.getString("subject") %></td>  
	</tr>
	<tr>
	 <th>글내용</th><td colspan="3"><%=rs.getString("content") %></td>  
	</tr>
<tr>
 <td colspan="4">
 <input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num") %>'">
 <input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=rs.getInt("num") %>'">
 <input type="button" value="글목록" onclick="location.href='list.jsp'"></td>
</tr>
</table>
<%} %>











</body>
</html>