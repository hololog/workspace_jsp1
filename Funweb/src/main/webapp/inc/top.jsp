<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
//로그인 여부로 메뉴 변경
if(id!=null) {
%>
<div id="login"><%=id %>님 | 
                <a href="../member/logout.jsp">logout</a> | 
                <a href="../member/update.jsp">회원정보수정</a></div>
<div class="clear"></div>
<%} else {%>
<div id="login"><a href="../member/login.jsp">login</a> | 
                <a href="../member/join.jsp">join</a></div>
<div class="clear"></div>
<%}%>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
<!-- 	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li> -->
	<li><a href="../center/notice.jsp">게시판</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>