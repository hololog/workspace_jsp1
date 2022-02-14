<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/delete.jsp</title>
</head>
<body>
<%
// num  파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
//BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
//리턴할형 없음   deleteBoard(int num) 메서드 정의
//deleteBoard(num) 메서드 호출
bDAO.deleteBoard(num);

//notice.jsp
response.sendRedirect("notice.jsp");
%>
</body>
</html>
