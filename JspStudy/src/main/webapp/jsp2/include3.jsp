<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/include3.jsp</title>
</head>
<body>
<h1>jsp2/include3.jsp</h1>
<table border="1" width=500 height=300>
<tr><td colspan="2"><jsp:include page="includeTop.jsp"></jsp:include></td></tr>
<tr><td>왼쪽메뉴</td>         <td>본문3</td></tr>
<tr><td colspan="2"><jsp:include page="includeBottom.jsp"/></td></tr>
</table>
</body>
</html>