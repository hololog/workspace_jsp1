<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>글작성</title>
</head>
<body>
<!-- 세션으로 로그인 휴요성 검사 ----------------------------------------------------------------- -->
<div class="container mt-5">
	<h2>글작성</h2>
	<form action="writePro.jsp" method="post">
		<table class="table table-hover">
			<tr>
				<th>제목</th><td><input type="text" name="subject" class="form-control"></td>
			</tr>
			<div class="mb-3 mt-3">
			<tr>
				<th>내용</th><td><textarea name="content" class="form-control"></textarea></td>
			</tr>
			</div>
			<tr>
				<td colspan="2"><input type="submit" value="글쓰기" class="btn btn-primary"></td>
			</tr>
		</table>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>