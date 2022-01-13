<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updatePro.jsp</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("UTF-8");
// 사용자 폼에서 http를 통해서 서버에 
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");

//1단게 설치프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");

//2단계 db서버 연결 -> 연결정보 저장 (자바 내장객체)
String dbId = "root";
String dbPass = "1234";
String dbUrl = "jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
Connection con=DriverManager.getConnection(dbUrl,dbId, dbPass);
//3단계 연결정보 이용 sql구문 만들고 실행준비
String sql="update student set name=? where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,name);
pstmt.setInt(2,num); 

//update 테이블 이름 set 수정열=수정값, 수정열=수정값
//where 기준열 값

//4단계 sql 구문 실행
pstmt.executeUpdate();
%>
학생정보 수정<%=pstmt %>
</body>
</html>