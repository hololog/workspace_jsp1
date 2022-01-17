<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/main.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){%>
	<script type="text/javascript">
		alert("로그인해주세요");
		location.href="loginForm.jsp";
	</script>
<%}
%>
<h1><%=id %>님이 로그인 하셨습니다.</h1>
	<input type="button" value="회원정보수정" onclick="location.href='updateForm.jsp'"><br><br>
	<input type="button" value="회원정보조회" onclick="location.href='info.jsp'"><br><br>
	<input type="button" value="회원탈퇴" onclick="location.href='deleteForm.jsp'"><br><br>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><br><br>
<%
if(id!=null){
	if(id.equals("admin")){%>
		<input type="button" value="회원목록" onclick="location.href='list.jsp'">
	<%}
}
%>	


</body>
</html>