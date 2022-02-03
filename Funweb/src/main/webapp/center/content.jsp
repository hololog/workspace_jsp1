<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>Insert title here</title>
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
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
// num 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체생성
BoardDAO bDAO=new BoardDAO();
//조회수 1증가  update board set readcount=readcount+1 where num=?
//리턴할값없음 updateReadcount(int num) 메서드 정의
//updateReadcount(num)메서드 호출
bDAO.updateReadCount(num);
//BoardDTO 리턴할형 getBoard(int num)메서드 정의
//BoardDTO bDTO=  getBoard(num) 메서드 호출
BoardDTO bDTO= bDAO.getBoard(num);
%>
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bDTO.getNum() %></td>
     <td>글쓴날짜</td><td><%=bDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bDTO.getName() %></td>
    <td>조회수</td><td><%=bDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bDTO.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=bDTO.getContent() %></td></tr>
</table>
<div id="table_search">
<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 
// 세션값(로그인)과  글쓴이 일치하면 
MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.getMember(id);

if(id!=null){
	if(mDTO.getName().equals(bDTO.getName())){
		%>
<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?num=<%=bDTO.getNum() %>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='delete.jsp?num=<%=bDTO.getNum() %>'">	
		<%
	}
}
%>

</div>
<div class="clear"></div>
<div id="page_control">

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