<%@page import="java.util.Iterator"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
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
<a href="writeForm.jsp">글쓰기</a>
<%
BoardDAO bDAO=new BoardDAO();
//한페이지에 보여줄 글 개수 설정
int pageSize=1;
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
//mysql방법
//pageNum pageSize => startRow 
//   1        10   =>   1~10
//   2        10   =>   11~20
//   3        10   =>   21~30
//  (페이지넘버-1) *페이지 사이즈+1
//오라클은 다른방법
//startRow pagesizw => endRow
//시작행 + 페이지사이즈 -1 = 끝행
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
// System.out.println("시작하는 행번호 : "+startRow);
//끝나는 행번호 구하기
//startRow  pageSize => endRow
//  1        10       =>   1+10-1=>10
//  11       10       =>  11+10-1=>20
//  21       10       =>  21+10-1=>30
int endRow = startRow+pageSize-1;
// System.out.println("끝나는 행번호 : "+endRow);

//자바내장객체 API List : 배열형태로 데이터 저장
//List 리턴할형   getBoardList() 메서드 정의 
//String sql="select * from board order by num desc limit 시작하는행번호-1,몇개";
//String sql="select * from board order by num desc limit startRow-1,pageSize";
//List boardList = getBoardList() 메서드 호출
BoardDTO bDTO=new BoardDTO();
List<BoardDTO> list=bDAO.showList(startRow, pageSize);
Iterator<BoardDTO> it=list.iterator();
%>
<div class="container mt-3">
	<table class="table table-striped">
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
<%
//한화면에 보여줄 페이지 개수설정
int pageBlock=10;
//시작하는 페이지 번호
//currentPage pageBlock => start페이지번호
//    1~10       10개       =>  1 = 0+1 =0*10+1
//    11~20      10개	    =>  11 =10+1=1*10+1
//    21~30      10개	    =>  21 =20+1=2*10+1
// (currentPage-1)/10*10+1
//끝나는 페이지 번호
//currentPage pageBlock => start페이지번호
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//    1~10       10개       =>  10 =1*10
//    11~20      10개	    =>  20 =2*10
//    21~30      10개	    =>  30 =3*10
// ((currentPage-1)/10+1)*10
int endPage=startPage+pageBlock-1;
//전체페이지수가 페이징수보다 적을때 
// if(endPage>전체페이지수){
// 	endPage=전체헤이지수
//전체글 수 
//sql = "SELECT count() from board";
int count = bDAO.getBoardCount();
//전체페이지수??
//게시판 전체 글수50개  한화면의 보여줄 글개수10개 => 전체페이지수 5개 
// 나머지가 있으면 1페이지를 더함
// int pageCount=전체글 개수 / pageSize + (전체글 개수%pageSize==0 ? 0:1);
int pageCount= count/pageSize + (count % pageSize==0 ? 0:1);

if(endPage>pageCount){
	endPage=pageCount;
}
%>
</table>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
<%
		if(startPage > pageBlock){//이전페이지가 있음
%>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?pageNum=<%=startPage-1 %>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
<%		} 
		
		for(int i=startPage; i<=endPage; i++){
%>
	    	<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a></li>
<%		} 
		
		if(endPage < pageCount){
%>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?pageNum=<%=startPage+pageBlock %>" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
<%       }%>
	  </ul>
	</nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>