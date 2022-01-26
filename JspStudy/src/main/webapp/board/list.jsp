<%@page import="org.apache.jasper.compiler.Node.GetProperty"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>board/list.jsp</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();

int pageSize=10;
//페이지번호가 없으면 1로
//http://localhost:8080/JspStudy/board/list.jsp
//페이지 번호가 있으면 페ㅇ이지번호로 설정
//http://localhost:8080/JspStudy/board/list.jsp?pageNum=2
//페이지번호 가져오기
String pageNum=request.getParameter("pageNum");

if(pageNum==null){
//페이지번호가 없으면 1로
	pageNum="1";
	
}
//시작하는 행번호 구하기
//pageNum pageSize => startRow
//   1        10   =>   1~10
//   2        10   =>   11~20
//   3        10   =>   21~30
//



BoardDTO bDTO=new BoardDTO();
List<BoardDTO> list=bDAO.showList();
Iterator<BoardDTO> it=list.iterator();
%>
<table border="1" class="table">
	 <tr>
	 	<th>글번호</th><th>글쓴이</th><th>글제목</th><th>조회수</th><th>글쓴날짜</th>
	 </tr>
 <%
 while(it.hasNext()){
	 bDTO=it.next();
 %> 
<div class="container mt-3">
	<tr> 
	 	<td><%=bDTO.getNum() %></td>
	 	<td><%=bDTO.getName() %></td>
	 	<td><a href="content.jsp?num=<%=bDTO.getNum() %>"><%=bDTO.getSubject() %></a></td>
	 	<td><%=bDTO.getReadcount() %></td>
	 	<td><%=bDTO.getDate() %></td>
	</tr> 
<%}%> 
	</table>
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>