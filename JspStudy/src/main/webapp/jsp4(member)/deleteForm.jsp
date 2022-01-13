<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/deleteForm.jsp</title>

<script>
	function f1() {
		if(comfirm("정말삭제하시겠습니까?") == true){
			documetn.form.submit;
		} else {
			return;
		}
	}
</script>
</head>
<body>
<%
//세션값에 저장된 id 가져오기
String id=(String)session.getAttribute("id");
%>

<form action="deletePro.jsp" method="post">
아이디 :<input type="text" name="id" value="<%=id %>" readonly><br>
비밀번호 :<input type="password" name="pass"><br>
  <input type="button" value="회원정보삭제" onclick="f1()" >
<!--   <input type="submit" value="회원정보삭제"> -->

</form>
</body>
</html>