<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/deletePro.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//1단계 driver가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단가ㅖ db연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단계 sql구문
String sql="select * from member where id=? and pass=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,id);
pstmt.setString(2, pass);
//4단게 sql 실행
ResultSet rs=pstmt.executeQuery();
//5단계 결과 다음행으로 이동 => 데이터 있으면 (true) => 아이디 비밀번호 일치
//=> 삭제작업 3단계 delete구문만들기 delete from member where id=?  
//        4단계 sql구문 실행 
//        세션값 초기화
//        main.jsp 이동 		
//                      없으면 (false) => 아이디 비밀번호 틀림
//=? "입력하신 정보가 틀림"  뒤로이동
if(rs.next()){
	sql="delete from member where id=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.executeUpdate();
	response.sendRedirect("main.jsp");
} else{
	%>
	  <script type="text/javascript">
	  	alert("입력정보 틀림");
	  	history.back();
	  </script>	
	<%
}
%>
</body>
</html>