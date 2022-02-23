<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test7.jsp</title>
<script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#fr').submit(function(){
			//alert("전송");
			//아이디 제어 return false;
			if($('#myid').val()==""){
				alert("아이디입력하세요");
				$('#myid').focus();
				return false;
			}
			//비밀번호 제어 return false;
			if($('#mypass').val()==""){
				alert("비밀번호입력하세요");
				$('#mypass').focus();
				return false;
			}
			//$대상.is()
			if($('#gender1').is(":checked")==false && 
			   $('#gender2').is(':checked')==false){
				alert("성별체크하세요");
				return false;
			}
			if($('#mygrade').val()==""){
				alert("등급을 선택하세요");
				$('#mygrade').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
<form action="a.jsp" method="get" id="fr">
	아이디: <input type="text" name="id" id="myid"><br>
	비밀번호: <input type="password" name="pass" id="mypass"><br>
	성별: <input type="radio" name="gender" id="gender1" value="남">남자
	    <input type="radio" name="gender" id="gender2" value="여">여자<br>
	등급: <select name="grade" id="mygrade">
			<option value="">선택하세요</option>
			<option value="1">1등급</option>
			<option value="2">2등급</option>
			<option value="3">3등급</option>
		</select>	    
		<input type="submit" value="로그인" id="btn"><br>
</form>
</body>
</html>