<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 프로세스</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();
//게시물번호 업데이트
bean.setNum(bDAO.getNextNum());
//조회수 0
bean.setViews(0);

bDAO.insertBoard(bean);//수정하기----------------------------------세션 아이디
response.sendRedirect("list.jsp");//목록으로
%>
</body>
</html>
