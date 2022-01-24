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
<title>jsp5/deletePro.jsp</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
//삭제정보 가져오기 get방식(주소로)
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
// 1 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection connect=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3 sql 작성/ 비빌번화 확인
String sql="select * from board where num=? && pass=?";
PreparedStatement pstmt=connect.prepareStatement(sql);
pstmt.setInt(1, num);
pstmt.setString(2, pass);
// 4 sql 실행
ResultSet rs=pstmt.executeQuery();
// 5 접근
if(rs.next()){
	// 3 sql 작성/ 준비
		sql="delete from board where num=?";
		pstmt=connect.prepareStatement(sql);
		pstmt.setInt(1, num);
		// 4 sql 실행
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
			alert("게시글을 삭제하였습니다.")
			location.href="list.jsp";
		</script>
<% } else {%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
<%} %>
</body>
</html>