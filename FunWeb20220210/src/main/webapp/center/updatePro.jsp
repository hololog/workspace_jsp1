<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
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
//한글처리
request.setCharacterEncoding("utf-8");
// num name subject content 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// BoardDTO updateDTO객체생성
BoardDTO updateDTO=new BoardDTO();
// set <= 파라미터 값 저장
updateDTO.setNum(num);
updateDTO.setName(name);
updateDTO.setSubject(subject);
updateDTO.setContent(content);

// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// 리턴할형 없음   updateBoard(BoardDTO updateDTO) 메서드 정의
// updateBoard(updateDTO) 메서드 호출
bDAO.updateBoard(updateDTO);

// notice.jsp
response.sendRedirect("notice.jsp");
%>
</body>
</html>


