<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>글 목록</title>
</head>
<body>
<%
BoardDAO bDAO=new BoardDAO();

%>

<div class="container mt-5">
<h2>문의글작성</h2>
<table class="table">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>글쓴날짜</td></tr>
<%
for(int i=0;i<boardList.size();i++){
	// 모든형 Object 형 저장 => BoardDTO 형변환  => 다운캐스팅
	BoardDTO bDTO=(BoardDTO)boardList.get(i);
	%>
	<tr><td><%=bDTO.getNum() %></td>
	    <td><%=bDTO.getName() %></td>
	    <td><a href="content.jsp?num=<%=bDTO.getNum()%>">
	        <%=bDTO.getSubject() %></a></td>
	    <td><%=bDTO.getReadcount() %></td>
	    <td><%=bDTO.getDate() %></td></tr>
	<%
}
%>
</table>
</div>





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>