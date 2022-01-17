<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

MemberDAO mDAO=new MemberDAO();

MemberDTO mDTO=mDAO.userCheck(id, pass);
if(mDTO!=null){
	out.print("일치");
	session.setAttribute("id",mDTO.getId());
	response.sendRedirect("main.jsp");
} else {
	out.print("틀림");%>
	<script type="text/javascript">
		alert("회원정보가 일치하지 않습니다.");//아이디는 일치하는 경우 생각해보기
		history.back();
	</script>
<%}%>
</body>
</html>