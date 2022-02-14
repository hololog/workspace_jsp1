<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test1.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		alert("동작1");
	});
	$(document).ready(function(){
		alert("동작2");
	});
	$(function(){
		alert("동작3");
	});
</script>
</head>
<body>

</body>
</html>