<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertPro.jsp</title>
</head>
<body>
<%
//post 한글처리
request.setCharacterEncoding("utf-8");
//폼에서 입력한 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
//시스템날짜시간 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());
//----------------------------------------------------------------
//저장할 여러개 데이터를 하나의바구니 저장 => 자바파일로
//                             MemberDTO.java (data transfer object)
MemberDTO mDTO=new MemberDTO();
mDTO.setId(id);
mDTO.setPass(pass);
mDTO.setName(name);
mDTO.setDate(date);

//                  폴더(패키지), 자바파일 마들기
//src/main/java 안에    member, MemberDAO.java (data access object)
//자바파일에 메서드 만들기(멤버함수)=> 1~5단계 반복작업 함수화

// 자바파일을 객체생성을 해야함 -> 즉 기억장소 할당해야 멤버사용가능(메서드)
MemberDAO mDAO=new MemberDAO();
// 자바파일 안의 메서드 호출(매개변수로 값전달)
// mDAO.insertMem(id,pass,name, date);
// mDAO.insertMem(바구니주소);
mDAO.insertMem(mDTO);


//-------------자바파일로------------------------------------------------------
// //1단게 jdbc 프로그램 가져오기
// Class.forName("com.mysql.jdbc.Driver");
// //2단계 DB연결
// String dbId="root";
// String dbPass="1234";
// String dbUrl="jdbc:mysql://localhost:3306/jspdb1?useSSL=false";
// Connection con=DriverManager.getConnection(dbUrl,dbId, dbPass);
// //3단계 sql 구문 생성 insert
// String sql="insert into member(id,pass,name,date) values(?, ?, ?,?);";
// //member2테이블은 db에서 디폴트로date설정
// // String sql="insert into member2(id,pass,name) values(?, ?, ?);";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// pstmt.setString(2, pass);
// pstmt.setString(3, name);
// pstmt.setTimestamp(4, date);
// //4단계 sql구문 실행
// pstmt.executeUpdate();
// // 로그인 성공 페이지 이동
response.sendRedirect("loginForm.jsp");
%>
<%-- 회원가입 성공<%=pstmt %> --%>
</body>
</html>