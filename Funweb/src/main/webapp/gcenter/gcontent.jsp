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
<title>gceter/gcontent.jsp</title>
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
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO bDAO=new BoardDAO();
bDAO.updateReadCount(num);
BoardDTO bDTO= bDAO.getBoard(num);
%>
<article>
<h1>Gallery Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bDTO.getNum() %></td>
     <td>글쓴날짜</td><td><%=bDTO.getDate() %></td></tr>
<tr><td>글쓴이</td><td><%=bDTO.getName() %></td>
    <td>조회수</td><td><%=bDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=bDTO.getSubject() %></td></tr>
<tr><td>글내용</td><td colspan="3"><%=bDTO.getContent() %></td></tr>
<tr><td>첨부파일</td><td colspan="3"><img src="../upload/<%=bDTO.getFile() %>" alt="파일이름" width="100" height="100"></td></tr>
</table>
<div id="table_search">
<input type="button" value="글목록" class="btn" onclick="location.href='gnotice.jsp'">
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 
// 세션값(로그인)과  글쓴이 일치하면 
MemberDAO mDAO=new MemberDAO();
MemberDTO mDTO=mDAO.getMember(id);

if(id!=null){
	if(id.equals(bDTO.getName())){
		%>
<input type="button" value="글수정" class="btn" onclick="location.href='gupdate.jsp?num=<%=bDTO.getNum() %>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='gdelete.jsp?num=<%=bDTO.getNum() %>'">	
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