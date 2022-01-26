<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="bean" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty name="bean" property="*" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/deletePro.jsp</title>
</head>
<body>
<% 
BoardDAO bDAO=new BoardDAO();
int num=bean.getNum();
String pass=bean.getPass();
BoardDTO bDTO=bDAO.numcheck(num, pass);

if(bDTO!=null){
	bDAO.deleteBoard(num);
%>
	<script type="text/javascript">
		alert("게시글을 삭제하였습니다.")
		location.href="list.jsp";
	</script>
<%} else {%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
<%} %>
</body>
</html>