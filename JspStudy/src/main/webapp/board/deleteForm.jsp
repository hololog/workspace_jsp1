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
<title>jsp5/deleteForm.jsp</title>
<script>
	function del() {
		if(confirm("정말 삭제하시겠습니까?")==true){
			document.getElementById('frm').submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
<% 
//삭제정보 가져오기 get방식(주소로)
int num=Integer.parseInt(request.getParameter("num"));
// 1 드라이버 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection connect=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3 sql 작성/ 준비
String sql="select * from board where num=?";
PreparedStatement pstmt=connect.prepareStatement(sql);
pstmt.setInt(1, num);
// 4 sql 실행
ResultSet rs=pstmt.executeQuery();
// 5 접근
if(rs.next()){
%>
	<form action="deletePro.jsp" method="post" id="frm">
	<input type="hidden" name="num" value="<%=rs.getInt("num") %>">
	<table border="1">
		<tr>
			<th>비밀번호</th><td><input type="password" name="pass"></td>
		</tr>
		<tr>
<!-- 			<td colspan="2"><input type="submit" value="글삭제"></td> -->
			<td colspan="2">
			<input type="button" value="글삭제" onclick="del()">
			<input type="button" value="취소" onclick="history.back()"></td>
		</tr>
	</table>
<%} %>
</form>
</body>
</html>