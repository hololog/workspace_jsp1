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
<title>board/updatePro.jsp</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();

BoardDTO bDTO=bDAO.numcheck(bean.getNum(), bean.getPass());

if(bDTO==null) {%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
<%} else {
int upResult=bDAO.updateBoard(bean);

	if(upResult==1){
%>
		<script type="text/javascript">
			alert("글수정 성공");
			location.href="content.jsp?num=<%=bean.getNum() %>";
		</script>
<%	}  else {%>
		<script type="text/javascript">
			alert("업데이트에 실패하였습니다.");
			history.back();
		</script>
<%	}
}%>
</body>
</html>