<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fnotice.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="../fcenter/fnotice.jsp">자료실</a></li>
<li><a href="../gcenter/gnotice.jsp">갤러리</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// 폴더 board 파일이름 BoardDAO
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();

// pageSize 한화면에 보여줄 글개수 설정
int pageSize=15;
// pageNum 페이지번호 가져오기
String pageNum=request.getParameter("pageNum");
// pageNum없으면 1페이지 설정 
if(pageNum==null){
	pageNum="1";
}
// startRow 시작하는 행번호 구하기
// pageNum  pageSize  => startRow 
//     1        5     =>   (1-1)*5+1=>0*5+1=>0+1=>1 ~5
//     2        5     =>   (2-1)*5+1=>1*5+1=>5+1=>6 ~10
//     3        5     =>   (3-1)*5+1=>2*5+1=>10+1=>11 ~15
int currentPage=Integer.parseInt(pageNum);
int startRow = (currentPage-1)*pageSize+1;
// endRow 끝나는 행번호 구하기
int endRow=startRow+pageSize-1;

// 리턴할형 List  getBoardList(int startRow, int pageSize) 메서드 정의
// List boardList = getBoardList(startRow, pageSize) 메서드 호출

// List boardList=bDAO.getBoardList(startRow, pageSize);
List<BoardDTO> boardList=bDAO.getBoardList(startRow, pageSize);
//날짜 => 모양변경 => String 문자열 변경
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>
<article>
<h1>File Notice</h1>
<table id="notice">
	<tr>
		<th class="tno">No.</th>
	    <th class="ttitle">Title</th>
	    <th class="twrite">Writer</th>
	    <th class="tdate">Date</th>
	    <th class="tread">Read</th>
	</tr>
<%
    for(int i=0; i<boardList.size();i++){
		BoardDTO bDTO=boardList.get(i);
%>
	<tr onclick="location.href='fcontent.jsp?num=<%=bDTO.getNum() %>'">
		<td><%=bDTO.getNum() %></td>
	    <td class="left"><%=bDTO.getSubject() %></td>
	    <td><%=bDTO.getName() %></td>
	    <td><%=dateFormat.format(bDTO.getDate())%></td>
	    <td><%=bDTO.getReadcount() %></td>
	</tr>    	
<%
    }
%>
</table>
<div id="table_search">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){
%>
	<input type="button" value="글쓰기" class="btn" onclick="location.href='fwrite.jsp'">	
<%
}
%>
</div>
<div id="table_search">
	<input type="text" name="search" class="input_box">
	<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">
<%
int pageBlock=5;
int count=bDAO.getBoardCount();
int pageCount=count/pageSize+(count%pageSize==0? 0:1);
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;

if(endPage>pageCount){
	endPage=pageCount;
}
	if(startPage > pageBlock){
%>
		<a href="fnotice.jsp?pageNum=<%=startPage-1 %>">Prev</a>
<%	}
	for(int i=startPage; i<=endPage; i++){
%>
		<a href="fnotice.jsp?pageNum=<%=i %>"><%=i %></a>
<%	}
	if(endPage < pageCount){
%>	
		<a href="fnotice.jsp?pageNum=<%=endPage+1 %>">Next</a>
<%	}
%>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>