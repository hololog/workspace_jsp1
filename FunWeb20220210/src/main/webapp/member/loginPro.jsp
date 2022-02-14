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
//request에 저장 id pass 폼에서 입력한 값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// MemberDAO 객체생성
MemberDAO mDAO=new MemberDAO();
// MemberDTO 리턴할형  userCheck(String id, String pass) 메서드 정의
// MemberDTO mDTO   =  userCheck(id,pass) 호출
MemberDTO mDTO=mDAO.userCheck(id, pass);
// mDTO != null  세션값생성 "id",id    ../main/main.jsp이동
// mDTO == null        입력하신정보 틀림   뒤로이동
if(mDTO!=null){
	//아이디 비밀번호 일치
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else{
	//아이디 비밀번호 틀림	
	%>
	<script type="text/javascript">
		alert("입력하신정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>

