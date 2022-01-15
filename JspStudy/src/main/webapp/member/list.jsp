<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/list.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");

if(id==null){%>
	<script type="text/javascript">
		alert("로그인해주세요");
		location.href="loginForm.jsp";
	</script>
<%}

MemberDAO mDAO=new MemberDAO();

ResultSet rs=mDAO.showList();
%>
<table border="1">
	<tr>
		<th>아이디</th><th>비밀번호</th><th>이름</th><th>가입일</th>
	</tr>
	<%while(rs.next()){%>
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("pass") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getDate("date") %></td>
	</tr>
	<%}%>
	<tr>
		<td colspan="4"><input type="button" value="메인으로" onclick="location.href='main.jsp'"></td> 
	</tr>
</table>


</body>
</html>