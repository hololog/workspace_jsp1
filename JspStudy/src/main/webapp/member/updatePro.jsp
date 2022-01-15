<%@page import="java.sql.ResultSet"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

MemberDTO mDTO=new MemberDTO();
MemberDAO mDAO=new MemberDAO();

mDTO.setId(request.getParameter("id"));
mDTO.setName(request.getParameter("name"));
mDTO.setPass(request.getParameter("pass"));
mDTO.setPass1(request.getParameter("pass1"));
mDTO.setPass2(request.getParameter("pass2"));

if(mDTO.getPass1().equals(mDTO.getPass2())) {
	
	if(mDAO.verifyPass(mDTO)) {
		mDAO.updateMem(mDTO);
		response.sendRedirect("info.jsp");
	} else {%>
		<script type="text/javascript">
			alert("기존 비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
<%  }
} else {%>
	<script type="text/javascript">
		alert("변경할 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%
}
%>
</body>
</html>