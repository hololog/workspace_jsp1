<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
BoardDAO bDAO=new BoardDAO();
bDAO.updateReadCount(num);

BoardDTO bDTO=bDAO.getContent(num);
%>
<table border="1">
	<tr>
	 <th>글번호</th><td><%=bDTO.getNum()%></td>
	 <th>글쓴날짜</th><td><%=bDTO.getDate() %></td>
	</tr>
	<tr>
	 <th>글쓴이</th><td><%=bDTO.getName() %></td>
	 <th>조회수</th><td><%=bDTO.getReadcount() %></td>
	</tr>
	<tr>
	 <th>글제목</th><td colspan="3"><%=bDTO.getSubject() %></td>  
	</tr>
	<tr>
	 <th>글내용</th><td colspan="3"><%=bDTO.getContent() %></td>  
	</tr>
	<tr>
	 <td colspan="5">
	 <input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bDTO.getNum() %>'">
	 <input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bDTO.getNum() %>'">
	 <input type="button" value="글목록" onclick="location.href='list.jsp'"></td>
	</tr>
</table>
</body>
</html>