<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
// String newPass1=request.getParameter("newPass1");
// String newPass2=request.getParameter("newPass2");

MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.userCheck(id, pass);

if(mDTO!=null){
	MemberDTO updateDTO=new MemberDTO();
	updateDTO.setId(id);
	updateDTO.setName(name);
	updateDTO.setEmail(email);
	updateDTO.setAddress(address);
	updateDTO.setPhone(phone);
	updateDTO.setMobile(mobile);
	
	mDAO.updateMember(updateDTO);
	response.sendRedirect("../main/main.jsp");
}else{
%>	
	<script type="text/javascript">
		alert("비밀번호를 잘못 입력하셨습니다.");
		history.back();
	</script>
<%}%>
</body>
</html>