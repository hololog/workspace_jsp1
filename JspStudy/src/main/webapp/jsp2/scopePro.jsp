<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/scopePro.jsp</title>
</head>
<body>
<h1>jsp2/scopePro.jsp</h1>
<%
//폼에서 들고 간 정보를 서버의 request에 저장

String id=request.getParameter("id");
String pass=request.getParameter("pass");


//페이지 정보만 저장=> 페이지가 바뀌면 기존정보는 사라지고 새로운 페이지 정보가 저장
pageContext.setAttribute("page", "pageContext value");
//요청정보를 저장 => 페이지가 바뀌면 요청정보를 들고 가면 유지, 안들고 가면 사라짐
request.setAttribute("req", "request value");
//연결정보를 저장 => 연결만 되어있으면 페이지에 상관없이 값을 유지
session.setAttribute("sess", "session value");
//서버가 start되어 있으며 페이지, 유저연결 상관없이 값유지
application.setAttribute("app", "application value");

//get 방식 : http://localhost:8080/JspStudy/jsp2/scopePro.jsp?id=kim&pass=1234

%>

아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("sess") %><br>
application 값 : <%=application.getAttribute("app") %><br>

<!-- 1 html 이동방식 -->
<!-- <a href="scopeProPro.jsp">scopeProPro.jsp로 이동</a> -->
<!-- 주소에 아이디비번 직접추가 -->
<a href="scopeProPro.jsp?id=<%=id %>&pass=<%=pass%>">scopeProPro.jsp로 이동</a>
<!-- 2 자바스크립트로 이동(하이퍼링크) -->
<script type="text/javascript">
// 	alert("scopeProPro.jsp이동");
<%-- 	location.href="scopeProPro.jsp?id=<%=id %>&pass=<%=pass%>"; --%>
	
</script>
<%
// 3 jsp로 이동방법(자바스크립트보다 우선동작)
// response.sendRedirect("scopeProPro.jsp");
//표현식안됨 변수로 변경
// response.sendRedirect("scopeProPro.jsp?id=" + id + "&pass=" + pass);

//4 jsp 다른 이동방식 : forward(내장객체X, 액션테크)이동방식 pro.jsp 페이지에 있는 request값을 전부 들고 ProPro.jsp로 이동
//                                주소줄 변경 안됨, 화면 내용만 변경
//jsp액션태그 :jsp에서 태그처럼 사용하도록 만든 문법

%>
<jsp:forward page="scopeProPro.jsp"></jsp:forward>

</body>
</html>