<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 로그인 여부확인 => 세션값 있는지 없는지 확인
//세션값 가져오기
String id=(String)session.getAttribute("id");
// 로그인 하지 않은 경우  세션값없음 login join
// 로그인 한 경우        세션값있음       ..님   logout  update
if(id==null){
	//세션값 없음, 로그인 하지 않음 login join
	%>
<div id="login"><a href="../member/login.jsp">login</a> | 
                <a href="../member/join.jsp">join</a></div>	
	<%
}else{
	//세션값 있음, 로그인 함  ..님   logout  update
	%>
<div id="login"><%=id %>님 | 
                <a href="../member/logout.jsp">logout</a> | 
                <a href="../member/update.jsp">update</a></div>	
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">게시판</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>