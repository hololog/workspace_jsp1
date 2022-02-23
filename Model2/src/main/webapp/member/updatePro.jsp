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
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String pass1=request.getParameter("pass1");
String pass2=request.getParameter("pass2");

MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.userCheck(id, pass);

if(pass1.equals(pass2)) {
	if(mDTO!=null) {
		MemberDTO updateDTO=new MemberDTO();
		updateDTO.setId(id);
		updateDTO.setPass(pass1);
		updateDTO.setName(name);
		
		mDAO.updateMem(updateDTO);
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