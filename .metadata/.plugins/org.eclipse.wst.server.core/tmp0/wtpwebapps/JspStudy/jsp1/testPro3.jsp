<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro3.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String strId=request.getParameter("id");
String strPass=request.getParameter("pass");
String strTa=request.getParameter("ta");
String strRa=request.getParameter("ra");
String strCh=request.getParameter("ch");
String strSel=request.getParameter("sel");
%>
<%=request.getCharacterEncoding() %><br>
텍스트 상자 : <%=strId %><br>
비밀번호 상자 : <%=strPass%><br>
긴텍스트 상자 : <%=strTa%><br>
라디오 상자: <%=strRa%><br>  <!-- 라디오상자, 목록상자, 체크박스는 체크한 value값을 출력 -->
체크박스 상자: <%=strCh%><br> <!-- 체크박스는 여러개선택해도 맨처음값만 출력 -->
목록상자: <%=strSel%><br>
</body>
</html>