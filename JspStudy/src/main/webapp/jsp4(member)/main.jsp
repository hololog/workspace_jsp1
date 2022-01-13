<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/main.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
//세션값이 비어있으면 (null이면 ) =>loginForm.jsp 이동  //리턴 타입은 Object
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
//이거랑 로그아읏파일에서 login페이지로 이동하는거랑 차이?????로그아웃페이지이ㅔ서도 login페이지로 바로 이동 해도 되지만
// 여기에서 위 구문이 없으면 로그인 안한 상태에 메인에 들어오는걸= null로 들어오는 걸 막기휘애
%>
<%-- <%=session.getAttribute("id") %>님이 로그인 하셨습니다. --%>
<%=id %>님이 로그인 하셨습니다.
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"><br>
<a href="info.jsp">회원정보조회</a><br>
<a href="updateForm.jsp">회원정보수정</a><br>
<a href="deleteForm.jsp">회원정보삭제</a><br>
<%
//로그인 한 회원=>세션있음
//로그인 중에 admin 회원만 조회할수 있게
if(id!=null){
	if(id.equals("admin")){
// if("admin".equals(null)){
%>
		<a href="list.jsp">회원목록</a>
<%
	}	
}
%>

</body>
</html>