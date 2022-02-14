<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
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
//한글처리
request.setCharacterEncoding("utf-8");
// name subject content 파라미터 가져오기
// pass = "1111" 로그인 게시판 비밀번호 필요없음
// readcount=0, date 시스템날짜 시간 설정
String name=request.getParameter("name");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String pass="1111";
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
//num구하기
//리턴할형 int  getMaxNum()메서드 정의

// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
// BoardDTO 객체생성
BoardDTO bDTO=new BoardDTO();
// set메서드 호출 <= 파라미터값 저장
// setNum(getMaxNum()+1)
bDTO.setNum(bDAO.getMaxNum()+1);
bDTO.setName(name);
bDTO.setPass(pass);
bDTO.setSubject(subject);
bDTO.setContent(content);
bDTO.setReadcount(readcount);
bDTO.setDate(date);

// 리턴할형없음 insertBoard(BoardDTO 주소받을변수) 메서드 정의
// insertBoard(BoardDTO 주소) 메서드호출
bDAO.insertBoard(bDTO);
// notice.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>

