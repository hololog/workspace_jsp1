<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testForm4.jsp</title>
</head>
<body>
<form action="testPro4.jsp" method="post" name="fr" onsubmit="return f1()">
		<!-- submit버튼으로 리턴 여기서는 f1()의 리턴값인 false가 리턴되어 submit이 멈춤 -->
			<fieldset style="width: 50%">
				<legend>ITWILL 회원가입</legend>
				<label>아이디 : </label><input type="text" name="id" id="id"><br>
				<label>비밀번호 : </label><input type="password" name="pass" id="pass"><br>
				<label>비밀번호 확인 : </label><input type="password" name="pass1" id="pass1"><br>
				<label>이름 : </label><input type="text" name="name" id="name"><br>
				<label>주민번호 : </label><input type="text" name="snum1" id="snum1">-
										<input type="text" name="snum2" id="snum2"><br>
				<label>성별 : </label>
							남<input type="radio" name="gender" id="gender" value="남">
							여<input type="radio" name="gender" id="gender" value="여"><br>
				<label>취미 : </label>
							<input type="checkbox" name="hobby" id="hobby1" value="여행">여행
							<input type="checkbox" name="hobby" id="hobby2" value="독서">독서
							<input type="checkbox" name="hobby" id="hobby3" value="게임">게임<br>
				<label>좋아하는 과목 : </label>
							<select name="select" id="select">
								<option value="">선택하세요</option>
								<option value="국어">국어</option>
								<option value="영어">영어</option>
								<option value="수학">수학</option>
							
							</select><br>
				<label>한마디 : </label>
							<textarea rows="5" cols="10" name="textarea"></textarea><br>
				<hr>
				<input type="submit" value="회원가입"> 
				<input type="reset" value="처음으로">
		</fieldset>
		</form>
</body>
</html>