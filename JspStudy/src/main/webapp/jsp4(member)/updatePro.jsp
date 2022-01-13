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
<title>jsp4/updatePro.jsp</title>
</head>
<body>
<%
// 폼에 입력한 내용을 들고 
//  post-> 한글처리
request.setCharacterEncoding("utf-8");
// request에 저장된 id pass name 파라미터 가져와서 변수저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("namd");
//1단계 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
String dbId="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbId, dbPass);
//3단게 sql구문 만들기  //회원수정전 비번 다시 확인( 비번만 확인할순 없을까???????)비번만 입력하는 거 맞음 폼 다시보기
String sql="select * from member where id=? and pass=?"; 
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
//4단계 sql 구문 실행 
ResultSet rs=pstmt.executeQuery();
//5단계 결과 다음행으로 이동 => 데이터가 있으면 (true) ==> 아이디 비번 일치
//     => 수정작업 다시 3단계 update구문 만들기
//              4단계 sql 구문 실행
//               main.jsp로 이동
//                    => 데이터가 없으면 (false)==> 아이디 비번 틀림
//     => "입력하신 정보가 틀립니다." 뒤로이동
if(rs.next()){
	sql="update member set name=? where id=?";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, name);//??????????????????????????수정내용 어디서?updateForm에서 수정
			///비번 수정은 아님 비번 수정 어떻할깨 생각해볼것
	pstmt.setString(2, id);
	
	pstmt.executeUpdate();//
	response.sendRedirect("main.jsp");
} else {
	%>	
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>