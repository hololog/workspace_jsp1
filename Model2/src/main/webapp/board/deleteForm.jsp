<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/deleteForm.jsp</title>
<script>
	function del() {
		if(confirm("정말 삭제하시겠습니까?")==true){
			document.getElementById('frm').submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
<% 
int num=Integer.parseInt(request.getParameter("num"));
%>
	<form action="deletePro.jsp" method="post" id="frm">
	<input type="hidden" name="num" value="<%=num %>">
	<table border="1">
		<tr>
			<th>비밀번호</th><td><input type="password" name="pass"></td>
		</tr>
		<tr>
<!-- 			<td colspan="2"><input type="submit" value="글삭제"></td> -->
			<td colspan="2">
			<input type="button" value="글삭제" onclick="del()">
			<input type="button" value="취소" onclick="history.back()"></td>
		</tr>
	</table>

</form>
</body>
</html>