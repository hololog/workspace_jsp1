<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/jdbcTest.jsp</title>
</head>
<body>

<%
//사용자웹브라우저 => 웹서버(웹애플리케이션서버) => 데이터베이스서버 접속 
//JDBC - 웹서버 디비서버 연결하는 프로그램 설치
// src - main - webapp - WEB-INF - lib 폴더안에 
// mysql-connector-java-5.1.39-bin.jar 넣기

//1단계 : 설치한 프로그램 가져오기(불러오기)
// com\mysql\jdbc폴더   Driver.class 실행(바이너리)파일
// Class 자바내장객체 java폴더 lang폴더(기본폴더= import 안해도됨) class.java 파일
Class.forName("com.mysql.jdbc.Driver");

//2단계 : 가져온 프로그램을 이용해서 디비서버 연결 => 연결정보를 저장(자바내장객체)
// java\sql 폴더 DriverManager 파일
// import="java.sql.DriverManager" (기본폴더가 아니라 import필요)
// DriverManager.getConnection(디비주소, DB접속아이디, DBpassword)
// String dbUrl="jdbc:mysql://localhost:3306/데이터 베이스 이름";
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);

//3단계 : 연결정보를 이용해서 sql구문을 만들고 실행할 준비(자바내장객체)
//4단계 : sql구문을 실행  insert,update,delete=> OK
//                   select => 실행결과 => 결과 (자바내장객체) 저장
//5단계 : select 결과를 출력하거나 배열 저장

%>
연결성공<%=con %>
</body>
</html>