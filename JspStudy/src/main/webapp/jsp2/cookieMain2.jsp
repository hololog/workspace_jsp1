<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieMain2.jsp</title>
</head>
<body>
<%
// 폼에서 선택한 언어설정값 http를 통해서 서버로 전달
// 서버jsp내장객체 request에서 lang 을 태그(파라미터) 값 가져오기
String lang=request.getParameter("lang");
%>
폼에서 선택한 언어 : <%=lang%><br>
<%
// 페이지, 유저 ,서버 상관없이 값을 유지 => 쿠키값 생성
//쿠키객체 생성 쿠키이름:clang , 쿠키값 : 폼에서 선택한 언어
Cookie cookie = new Cookie("clang", lang);
//시간설정
cookie.setMaxAge(3600);
// 쿠키를 클라이언트에 전달
response.addCookie(cookie);
%>
쿠키의 유지시간 : <%=cookie.getMaxAge() %><br>
쿠키 이름 : <%=cookie.getName() %><br>
쿠키값 : <%=cookie.getValue() %><br>

<script type="text/javascript">
 alert("쿠키값 생성");
 location.href="cookieMain.jsp";
 </script> 

</body>
</html>