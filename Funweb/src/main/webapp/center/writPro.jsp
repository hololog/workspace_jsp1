<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/writePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String pass=request.getParameter("1234");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());

BoardDAO bDAO=new BoardDAO();
BoardDTO bDTO=new BoardDTO();

bDTO.setNum(bDAO.getMaxNum()+1);
bDTO.setName(name);
bDTO.setPass(pass);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setDate(date);

bDAO.insertBoard(bDTO);
response.sendRedirect("notice.jsp");
%>
</body>
</html>