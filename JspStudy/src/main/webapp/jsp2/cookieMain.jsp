<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieMain.jsp</title>
</head>
<body>
<%
// http가 들고온 값을 서버 request에 저장 = 쿠키값 가져오기
Cookie cookie[]=request.getCookies();
// if 쿠키값이 있으면
// for 쿠키값 배열 한칸 접근
// if 쿠키값이름 비교 "clang"
// 찾은 쿠키값 출력
String language="";

if(cookie != null){
	for(int i=0; i<cookie.length; i++){
		if("clang".equals(cookie[i].getName())){
			out.println(cookie[i].getName());
			out.println(cookie[i].getValue());
			//찾은 쿠키값을 language변수에 저장
			language=cookie[i].getValue();
		}
	}
}

if("Korean".equals(language)) {
	%><h1>안녕하세요</h1><% 
} else {
	%><h1>Hello</h1><% 
}
%>



<form action="cookieMain2.jsp" method="get">
언어설정 : <input type="radio" name="lang" value="Korean"
        <% if(language.equals("Korean")){%>checked<%}%>>한국어
        <input type="radio" name="lang" value="English"
        <% if(language.equals("English")){%>checked<%}%>>영어
      <input type="submit" value="언어설정">  
</form>


</body>
</html>