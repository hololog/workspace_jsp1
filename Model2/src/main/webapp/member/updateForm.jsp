<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){%>
<script type="text/javascript">
	alert("로그인해주세요");
	location.href="login.me";
</script>
<%}
MemberDTO mDTO=(MemberDTO)request.getAttribute("mDTO");

if(mDTO!=null) {%>
	<h1>회원정보수정</h1>
	<form action="updatePro.me" method="post">
	 <fieldset>
	 	<legend>수정사항</legend>
			아이디 : <input type="text" name="id" value="<%=mDTO.getId() %>" readonly><br><br>
			수정할 이름 : <input type="text" name="name" value="<%=mDTO.getName() %>"><br><br>
			기존 비밀번호 확인: <input type="password" name="pass"><br><br>
			비밀번호 변경: <input type="password" name="pass1"><br><br>
			변경 비밀번호 확인: <input type="password" name="pass2"><br><br>
		 	<input type="submit" value="수정">
		 	<input type="button" value="취소" onclick="location.href='main.me">
	 </fieldset>
	</form>
<%
}
%>
</body>
</html>	