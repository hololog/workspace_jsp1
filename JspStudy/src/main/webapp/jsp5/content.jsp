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
int num=Integer.parseInt(request.getParameter("num"));///왜 형변환??????????
//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2 db 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3.sql 작성
String sql="select from board where no=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1,num);
//4 sql 실행 저장
ResultSet rs=pstmt.executeQuery();



%>
<table border="1">
<tr>
 <th>글번호</th><th></th><th>글쓴날짜</th><td></td>
</tr>
<tr>
 <th>글쓴이</th><td></td><th>조회수</th><td></td>
</tr>
<tr>
 <td>글제목</td><td colspan="3"></td>  
</tr>
<tr>
 <td>글내용</td><td colspan="3"></td>  
</tr>
<tr>
 <td colspan="4"><input type="button" 
 </td>
</tr>
</table>












</body>
</html>