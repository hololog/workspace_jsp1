<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// userCheck(id, pass)
MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.userCheck(id, pass);
// 리턴갑으로 비교
if(mDTO!=null) {
	//세션 생성
	session.setAttribute("id", id);
	//메인페이지 이동
	response.sendRedirect("../main/main.jsp");
}else{//틀리면 뒤로이동
%>	
	<script type="text/javascript">
		alert("로그인 정보가 일치하지 않습니다.");
		history.back();
	</script>
<%}%>

</body>
</html>