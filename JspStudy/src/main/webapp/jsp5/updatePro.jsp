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
<title>jsp5/updatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
//request 정보 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
//1
Class.forName("com.mysql.jdbc.Driver");
//2 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection connect=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3 sql 작성/ 준비 비밀번화 확인후 글수정 
String sql="select * from board where pass=? && num=?";
PreparedStatement pstmt=connect.prepareStatement(sql);
pstmt.setString(1,pass);
pstmt.setInt(2,num);
//4 sql 실행
ResultSet rs=pstmt.executeQuery();
//5.열 접근
if(rs.next()){
	//3 sql 작성/ 준비
	sql="update board set subject=?, content=? where num=?";
	pstmt=connect.prepareStatement(sql);
	pstmt.setString(1,subject);
	pstmt.setString(2,content );
	pstmt.setInt(3, num);
	//4 sql 실행
	pstmt.executeUpdate();
	//execute()차이
// 	response.sendRedirect("list.jsp");
%>
	<script type="text/javascript">
		alert("글수정 성공");
		location.href="content.jsp?num=<%=num %>";
		//그냥 num이랑 rs.getInt("num")차이는???
	</script>
<%} else {%>

	<script type="text/javascript">
		alert("입력하신 정보 없음");
		history.back();
	</script>
<%} %>




</body>
</html>