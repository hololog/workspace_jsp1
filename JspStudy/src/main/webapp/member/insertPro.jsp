<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String id=request.getParameter("id");
// Timestamp date=Timestamp.valueOf(LocalDateTime.now()); 
Timestamp date=new Timestamp(System.currentTimeMillis());

MemberDTO mDTO=new MemberDTO();
MemberDAO mDAO=new MemberDAO();

mDTO.setId(id);
mDTO.setPass(pass);
mDTO.setName(name);
mDTO.setDate(date);
mDAO.insertMem(mDTO);

response.sendRedirect("loginForm.jsp");
%>
</body>
</html>