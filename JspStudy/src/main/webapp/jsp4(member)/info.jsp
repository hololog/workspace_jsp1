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
<title>jsp4/info.jsp</title>
</head>
<body>
<%
//세션값에 저장된 아이디 가져오기. 문자열로 저장안됨
String id=(String)session.getAttribute("id");//??? 형변환 이유알기
//1단게 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2단게 db연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단게 sql구문 만들기 select * from member where id=?
String sql="select * from member where id=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
//4단계 sql 구문 실행 -> 결과 저장
ResultSet rs=pstmt.executeQuery();
//5단게 결과가 있으면(아이디 일치)(=다음행으로 이동했응때 값이 있다) -  - 열접근 - 출력
if(rs.next()){
	//if문이 없어도 rs.next()만 있으면 실행 가능 하지만 로그아웃후에 info 페이지에 접근하면 에러화면이 뜸 
// 	rs.next();
	//첫행에 데이터 있으면 ture
	%>
	아이디 : <%=rs.getString("id") %><br>
	비밀번호 : <%=rs.getString("pass") %><br>
	이름 :<%=rs.getString("name") %><br>
	가입날짜 :<%=rs.getTimestamp("date") %> <br>
	<% 
}


%>

<a href="main.jsp">메인화면으로</a>
</body>
</html>