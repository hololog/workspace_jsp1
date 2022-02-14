<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
</style>
<title>캣츠힐</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../main/main.jsp">캣츠힐</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../main/main.jsp">메인</a></li>
				<li class="active dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">게시판 메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../center/board.jsp">게시글</a></li>
						<li><a href="../fcenter/fboard.jsp">자료실</a></li>
						<li><a href="../gcenter/gboard.jsp">갤러리</a></li>
					</ul>
				</li>
			</ul>
			<%
				if(id == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">로그인</a></li>
						<li><a href="../member/join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/update.jsp">회원정보수정</a></li>
						<li><a href="../member/logout.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<%
	BoardDAO bDAO = new BoardDAO();
	int pageSize=15;
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null) {
		pageNum="1";
	}
	int currentPage=Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow=startRow+pageSize-1;
	List<BoardDTO> boardList=bDAO.getBoardList(startRow, pageSize);
	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
	%>
	<div class="container">
		<div class="row">
			<table class="table table-stripen" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th class="tno" style="background-color: #7FFFD4; text-align: center;">글번호</th>
						<th class="ttitle" style="background-color: #7FFFD4; text-align: center;">제목</th>
						<th class="twrite"style="background-color: #7FFFD4; text-align: center;">글쓴이</th>
						<th class="tdate"style="background-color: #7FFFD4; text-align: center;">날짜</th>
						<th class="tread"style="background-color: #7FFFD4; text-align: center;">조회수</th>
					</tr>
				</thead>
				<%
				    for(int i=0; i<boardList.size();i++){
						BoardDTO bDTO=boardList.get(i);
		    	%>
				<tbody>
					<tr onclick="location.href='content.jsp?num=<%=bDTO.getNum()%>'">
						<td><%=bDTO.getNum() %></td>
						<td class="left"><%=bDTO.getSubject() %></td>
						<td><%=bDTO.getName() %></td>
						<td><%=dateFormat.format(bDTO.getDate()) %></td>
						<td><%=bDTO.getReadcount() %></td>
					</tr>
				</tbody>
				<%
    				}
    			%>
			</table>
			<%
				if(session.getAttribute("id") != null){
				%>
			<input type="button" value="글쓰기" class="btn btn-primary pull-right" onclick="location.href='write.jsp'">
				<%
			}
			%>
			<div id="table_search">
				<input type="text" class="input_box" name="search" maxlength="20">
				<input type="button" class="btn btn-primary" value="검색" maxlength="20">
			</div>
		</div>
	</div>
	<div id="page_control">
	<%
	// 한화면에 보여줄 페이지 개수 
	int pageBlock=10;
	// 시작하는 페이지번호 
	// 00~09  /10    =>0 ,  10~19 /10 =>1 , 20~29/10 => 2   , 정수형/정수형 => 정수형
	// currentPage         pageBlock => startPage
	//    1~10 (00~09)       10     => (페이지-1)/10*10+1 =>0*10+1=> 0+1=>1
	//    11~20(10~19)       10     => (페이지-1)/10*10+1 =>1*10+1=>10+1=>11
	//    21~30(20~29)       10     => (페이지-1)/10*10+1 =>2*10+1=>20+1=>21
	int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	//끝나는 페이지번호
	// startPage   pageBlock  => endPage
	//    1            10     =>   10
	//    11           10     =>   20
	//    21           10     =>   30
	int endPage=startPage+pageBlock-1;
	
	//전체 글개수 구하기 => 디비에서 가져오기
	//int  리턴할형  getBoardCount() 메서드 정의
	//select count(*) from board
	int count=bDAO.getBoardCount();
	
	//전체 페이지수 구하기 
	//게시판글 50개  한화면에 보여줄 글개수 10개 => 전체페이지수 5
	//50/10 => 5   + 나머지 없으면 0페이지 추가
	//57/10 => 5   + 나머지글은  1페이지 추가
	int pageCount=count / pageSize +  (count % pageSize == 0 ?0:1);
	
	if(endPage > pageCount){
		endPage = pageCount;
	}
	//이전
	if(startPage > pageBlock){
		%><a href="board.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
	}
	
	// 1~10
	for(int i=startPage;i<=endPage;i++){
		%><a href="board.jsp?pageNum=<%=i%>"><%=i %> </a><%
	}
	
	//다음
	if(endPage < pageCount){
		%><a href="board.jsp?pageNum=<%=startPage+pageBlock%>">Next</a><%	
	}
	%>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>