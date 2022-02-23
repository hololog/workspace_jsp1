<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){%>
	<script type="text/javascript">
		alert("로그인해주세요");
		location.href="login.me";
	</script>
<%}


MemberDTO mDTO = (MemberDTO)request.getAttribute("mDTO");

if(mDTO!=null) {%>
	<h1>회원정보</h1>
	 <fieldset>
	 	<legend>상세정보</legend>
			아이디 : <%=mDTO.getId() %><br><br>
			이름 : <input type="text" name="name" value="<%=mDTO.getName() %>" readonly><br><br>
			비밀번호 : <input type="text" name="pass" value="<%=mDTO.getPass() %>" readonly><br><br>
			가입일 : <%=mDTO.getDate() %><br><br>
	 		<input type="button" value="메인으로" onclick="location.href='main.me'">
	 		<input type="button" value="회원정보 수정" onclick="location.href='update.me'">
	 </fieldset>
<%	
}
%>
<%
// mDTO.setId(id);
// ResultSet rs=mDAO.getInfo(mDTO);
// ResultSet rs=mDAO.getInfo(mDTO);
//if(rs.next()) {
%>
<!-- 	<h1>회원정보</h1> -->
<!-- 	 <fieldset> -->
<!-- 	 	<legend>상세정보</legend> -->
<%-- 			아이디 : <%=rs.getString("id") %><br><br> --%>
<%-- 			이름 : <input type="text" name="name" value="<%=rs.getString("name") %>" readonly><br><br> --%>
<%-- 			비밀번호 : <input type="text" name="pass" value="<%=rs.getString("pass") %>" readonly><br><br> --%>
<%-- 			가입일 : <%=rs.getDate("date") %><br><br> --%>
<!-- 	 		<input type="button" value="메인으로" onclick="location.href='main.jsp'"> -->
<!-- 	 		<input type="button" value="회원정보 수정" onclick="location.href='updateForm.jsp'"> -->
<!-- 	 </fieldset> -->
<%	
//}
%>


</body>
</html>