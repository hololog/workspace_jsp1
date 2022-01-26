<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDTO" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

BoardDAO bDAO=new BoardDAO();

bDTO.setNum(bDAO.getNextNum());

bDAO.insertBoard(bDTO);
response.sendRedirect("list.jsp");
%>
</body>
</html>