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
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
//request에 저장 id pass name 폼에서 입력한 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
//시스템날짜시간 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());
//1단게 jdbc 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 DB연결
String dbId="root";
String dbPass="1234";
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
Connection con=DriverManager.getConnection(dbUrl,dbId, dbPass);

//3단계 sql 구문 생성 insert
String sql="insert into member(id,pass,name,date) values(?, ?, ?,?);";
//member2테이블은 db에서 디폴트로date설정
// String sql="insert into member2(id,pass,name) values(?, ?, ?);";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4, date);
//4단계 sql구문 실행
pstmt.executeUpdate();
// 로그인 성공 페이지 이동
response.sendRedirect("loginForm.jsp");
%>

회원가입 성공<%=pstmt %>
</body>
</html>