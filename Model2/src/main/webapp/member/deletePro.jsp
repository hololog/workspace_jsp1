<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deletePro.jsp</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");


MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.userCheck(id, pass);

if(mDTO!=null){
	mDAO.deleteMem(mDTO);
	session.invalidate();
	%>
	  <script type="text/javascript">
	  	alert("정상적으로 탈퇴처리 되었습니다.");
	  	location.href="loginform.jsp";
	  </script>	
	<%
} else{
	%>
	  <script type="text/javascript">
	  	alert("입력정보 틀림");
	  	history.back();
	  </script>	
	<%
}
%>
</body>
</html>