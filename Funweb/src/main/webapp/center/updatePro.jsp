<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/updatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

BoardDTO bDTO=new BoardDTO();
bDTO.setNum(num);
bDTO.setName(name);
bDTO.setSubject(subject);
bDTO.setContent(content);
BoardDAO bDAO= new BoardDAO();

bDAO.updateBoard(bDTO);
response.sendRedirect("notice.jsp");
%>
</body>
</html>