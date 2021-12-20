<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- jsp 환경설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testForm1</title>
</head>
<body>
    <!-- html주석 -->
	<%-- jsp주석 --%>
	<%//자바, JSP명령
	int a = 10;
	int b = 20;
	//콘솔창에 출력o 웹으로 실행x
	System.out.println(a+b);
	%>
	<%=a+b %><br>
	<form action="testPro1.jsp" method="get">
	이름:<input type="text" name="name"><br>
	좋아하는 숫자:<input type="text" name="num"><br>
	<input type="submit" value="전송">
	</form>
</body>
</html>