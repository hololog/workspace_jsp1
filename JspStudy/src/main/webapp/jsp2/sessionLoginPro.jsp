<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/sessionLoginPro.jsp</title>
</head>
<body>
<%
//폼에서 id,pass 입력한 값이 Http가 서버에 전달
// 서버에 request내장객체 저장(자동)
// request에 저장된 id,pass 파라미터 값을 가져와서 변수에 저장 => 출력
String id=request.getParameter("id");
String pass=request.getParameter("pass");

%>
아이디 : <%=id%><br>
비밀번호 : <%=pass%><br>
<%
String dbId="Kim";  //DB가 연결되었을때 가져온 아이디 /비번
String dbPass="p123";
%>
DB에 저장된 아이디 : <%=dbId %><br>
DB에 저장되 비번 : <%=dbPass %><br>
<%-- 아이디비교 : <%=id==dbId %><br> --%>
<%-- 비밀번호비교 : <%=pass==dbPass %><br> --%>
아이디비교 : <%=id.equals(dbId) %><br>
비밀번호비교 : <%=pass.equals(dbPass)%><br>
<%
//폼입력과 db에서 가져오 자료 비교
if(id.equals(dbId) && pass.equals(dbPass)){
	//일치하면 로그인 인증 => 페이지 상관없이 값을 유지하려면 => 세션값 만들기
	session.setAttribute("id", id);	//중복되지않는 값으로 만든다 => 비밀번혼ㄴ 안됨
	//메인으로 이동
	response.sendRedirect("sessionMain.jsp"); 
} else {
	// 불일치하면 => 뒤로이동
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		histoty.back();
	</script>
	<% 	
}

%>
</body>
</html>