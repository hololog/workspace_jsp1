<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieDel.jsp</title>
</head>
<body>
<%
//쿠키값 삭제
//사용자 컴퓨터에 있는 모든 쿠키값 가져오기 => cookie배열변수 저장
Cookie cookies[]=request.getCookies();
// if 쿠키값이 있으면=cookies배열이 null값이 아니면
// for 쿠키값 하나씩 접근
// if i번째 쿠키이름 cook쿠키이름 비교 해서 일치하면
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		if("cook".equals(cookies[i].getName())) {
			// 찾은 쿠키값 cookies[i]시간을 0으로 설정
			cookies[i].setMaxAge(0);
			// 0으로 설정된 cookies[i] 찾은 쿠키값을 사용자 컴퓨터에 저장
			response.addCookie(cookies[i]);
		}
	}
}

%>
<script type="text/javascript">
 alert("쿠키값 삭제");
 location.href="cookieTest.jsp"
</script>
</body>
</html>