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
<title>jsp4/loginPro.jsp</title>
</head>
<body>
<%
// 폼 입력한 id, pass => 서버 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// 1단계 드라이버 불러오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결 
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
// 3단계 sql 구문 만들기 select * from member where id=? and pass=?
String sql="select * from member where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
// 4단계 sql 구문 실행 => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 다음행으로 이동 데이터 있으면(true) => 아이디 비밀번호 일치
//                         없으면 false => 아이디 비밀번호 틀림 
if(rs.next()){
	//true 일치  => 로그인인증 => 세션값 생성(중복되지 않는 값) => 페이지 상관없이 값유지 => main.jsp 이동
	out.println("일치");
	session.setAttribute("id", id);//////////////////???
	response.sendRedirect("main.jsp");
}else{
	//false 틀림 => "입력하신 정보 틀림"  뒤로이동
// 	out.println("틀림");
	%>
	<script type="text/javascript"><!--????-->
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	
	<%
}
%>
</body>
</html>

