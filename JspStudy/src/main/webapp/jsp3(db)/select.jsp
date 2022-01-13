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
<title>jsp3/select.jsp</title>
</head>
<body>
<%
//1단계 JDBC프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 DB연결 => 연결정보 저장 Connection
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection c=DriverManager.getConnection(dbUrl,dbId, dbPass);
//3단계 sql구문 만들기 PreparedStatement
String sql="select * from student";
PreparedStatement pstmt = c.prepareStatement(sql);
//4단계 sql구문 실행후 실행결과 저장 ResultSet : select의 결과값을 저장하는 내장객체=> update, delete, insert와 차이
ResultSet rs=pstmt.executeQuery();
//5단계 rs 저장된 내용을 접근해서 행, 열 데이터를 가져와서 출력
//rs.next() 다음행으로 접근 => 데이터가 있으면 true/ 없으면 false
// out.println("첫번째 next() : "+rs.next());
// out.println("두번째 next() : "+rs.next());
// out.println("세번째 next() : "+rs.next());
// out.println("네번째 next() : "+rs.next());
// out.println("다섯번째 next() : "+rs.next());  //많은양의 데이터 => 반복문으로 처리
//-----------------------------------------
//           반복문방법1
//-----------------------------------------
// while(rs.next()){ //행접근
// 	//true 데이터가 있으면 행있음=> 열접근
// // 	out.println(rs.getInt(1));
// 	out.println(rs.getInt("num"));
// // 	out.println(rs.getString(2));
// 	out.println(rs.getString("name"));
// 	out.println("<br>");//println으로 줄바꿈 안됨
// }
//-----------------------------------------
//   반복문방법2 out.println말고 다른 방법
//-----------------------------------------
while(rs.next()){
	%>
	<%=rs.getInt("num") %> : <%=rs.getString("name")+"<br>"%>
	<%
}
%>

</body>
</html>