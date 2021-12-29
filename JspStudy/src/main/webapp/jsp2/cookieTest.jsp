<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieTest.jsp</title>
</head>
<body>
<%
//쿠키 :                            페이지, 서버, 사용자 상관없이 값을 유지
//    : 클라이언트(사용자 컴퓨터) 하드디스크에 파일로 저장
//      서버의 부하를 줄이고자 할때 사용, 보안상 중요치 않은 데이터 ,아이디 저장 체크
//      자바 내장객체
//세션 : 서버와 클라이언트의 연결정보를 저장 / 페이지 상관없이 값을 유지
//    : 서버에 저장(메모리), 보안상의 중요한 데이터 (로그인 인증)
//      jsp 내장객체 : 자바내장객체 서버 객체를 생성

//쿠키값 가져오기
// - 사용자가 브라우저에 주소 localhost:8080/JspStudy/jsp2/cookieTest.jsp 요청
// 서버에 요청하러 갈때 태그정보, 서버정보, 클라이언트정보, 세션정보, 쿠키값을 http가 들고 서버로 감
// 웹서버에서 http가 들고온 정보를 받아서 처리를 하기위해 was에 전달
//   => 1. request(http가 들고온 모든정보), response 내장객체 생성
//		2. 처리담당자(서블릿)지정
//		3. 처리결과 response에 저장 => 웹서버 =>  http 전달 => 사용자 컴퓨터에 전달

// 사용자 컴퓨터에 있는 모든 쿠키값을 가져오기 => cookie배열 변수 저장
Cookie cookies[]=request.getCookies();
//쿠키값이 있으면 
if(cookies!=null) {
	for(int i=0; i<cookies.length; i++){
		//i번째 쿠키이름 cook쿠키이름 비교해서 일치하면 쿠키값 출력
		if(cookies[i].getName().equals("cook")){
			out.println("찾은 쿠키이름 : "+cookies[i].getName());
			out.println("찾은 쿠키값 : "+cookies[i].getValue());
			out.println("<br>");
		}
	}
}
%>
<input type="button" value="쿠키값 생성" onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값 삭제" onclick="location.href='cookieDel.jsp'">
</body>
</html>