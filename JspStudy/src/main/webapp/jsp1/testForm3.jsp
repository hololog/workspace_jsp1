<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testForm3.jsp</title>
</head>
<body>

 <form action="testPro3.jsp" name="fr" method="get">
    텍스트 상자 :  <input type="text" name="id"><br>
	비밀번호 상자 : <input type="password" name="pass"><br>
	긴텍스트 상자 : <textarea rows="10" cols="20" name="ta" placeholder="값"></textarea><br>
	라디오 상자:   <input type="radio" name="ra" value="남">남(화면)
           	    <input type="radio" name="ra" value="여">여(화면)<br>
    체크박스 상자:  <input type="checkbox" name="ch" value="여행">여행(화면)
                <input type="checkbox" name="ch" value="게임">게임(화면)<br>
    목록상자: <select name="sel">
 			<option value="빈목록">선택하세요</option>
 			<option value="목록1">목록1</option>
 			<option value="목록2">목록2</option>
 			<option value="목록3">목록3</option>
 		   </select>       
 		   <input type="submit" value="전송">   
 </form>

</body>
</html>