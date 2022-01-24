<%@page import="java.util.Iterator"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();
BoardDTO bDTO=new BoardDTO();
List<BoardDTO> list=bDAO.showList();
Iterator<BoardDTO> it=list.iterator();
%>
<table border="1">
	 <tr>
	 	<th>글번호</th><th>글쓴이</th><th>글제목</th><th>조회수</th><th>글쓴날짜</th>
	 </tr>
 <%
 while(it.hasNext()){
	 bDTO=it.next();
 %> 
	<tr> 
	 	<td><%=bDTO.getNum() %></td>
	 	<td><%=bDTO.getName() %></td>
	 	<td><a href="content.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></td>
	 	<td><%=bDTO.getReadcount() %></td>
	 	<td><%=bDTO.getDate() %></td>
	</tr> 
<%}%> 
</table>
</body>
</html>