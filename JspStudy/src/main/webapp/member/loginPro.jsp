<%@page import="java.sql.ResultSet"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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

MemberDTO mDTO=new MemberDTO();
MemberDAO mDAO=new MemberDAO();

mDTO.setId(id);
mDTO.setPass(pass);
ResultSet rs=mDAO.loginMem(mDTO);

if(rs.next()){
	session.setAttribute("id", mDTO.getId());
	response.sendRedirect("main.jsp");
} else {%>
	<script type="text/javascript">
		alert("회원정보가 일치하지 않습니다.");//아이디는 일치하는 경우 생각해보기
		history.back();
	</script>
<%}%>
</body>
</html>