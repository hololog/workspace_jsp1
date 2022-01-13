<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/writePro.jsp</title>
</head>
<body>
<%
//한글처리 post
request.setCharacterEncoding("UTF-8");
//request 정보 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
//readcount =0, date시스템 날짜?????????????????????????????????????????????????????????????
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
//num 구하기

//1.드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2.db연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);

//num 구하기
String sql="select max(num) from board;";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();

int num=0;
if(rs.next()){
	num=rs.getInt("max(num)")+1;
} 

//3.sql 구문 작성
sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?);";
// db날짜 적용
// sql="insert into board(num, name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,now());";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, name);
pstmt.setString(3, pass);
pstmt.setString(4, subject);
pstmt.setString(5, content);
pstmt.setInt(6, readcount);
pstmt.setTimestamp(7, date);
//4.sql 구문 실행
pstmt.execute();
//list.jsp 게시판 목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>