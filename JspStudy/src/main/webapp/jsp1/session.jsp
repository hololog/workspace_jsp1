<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<%
//session 내장객체 : 연결정보를 저장하는 내장객체
//               : 연결이 되어지면 sid부여 됨-
//               : session내장객체만 있으면 연결유지
//session 내장객체 삭제 1.브라우저 종료(만료기간에 상관없이 삭제됨)
//                  2.만료기간 (기본값30분) 동안 미사용시
//                  3.로그아웃시
//로그인시 session내장객체 사용 (session내장객체 안에 값을 저장)
%>
세션아이디 : <%=session.getId() %><br>
세션생성시간 : <%=session.getCreationTime() %><br>
세션마지막접근시간 : <%=session.getLastAccessedTime() %><br>
세션유지시간 : <%=session.getMaxInactiveInterval() %><br>
세션유지시간변경 : 
<%
//1초로 변경
session.setMaxInactiveInterval(1800);
%><br>
세션유지시간 : <%=session.getMaxInactiveInterval() %><br>
로그아웃(세션내장객체 기억장소 전체삭제)<br>
<%
//세션전체삭제
// session.invalidate();
%>
<%
//세션내장객체 안에 하나의 값을 저장
//session.setAttribute(name, value)
session.setAttribute("sname", "svalue");
%><br>
세션내장객체 안에 하나의 저장된 값 가져오기
<%=session.getAttribute("sname")%><br>
세션내장객체 안에 하나의 저장된 값 삭제하기
<%
//JSP 표현식에선(<%=  세미콜론 자동생성 
session.removeAttribute("sname");%>
</body>
</html>