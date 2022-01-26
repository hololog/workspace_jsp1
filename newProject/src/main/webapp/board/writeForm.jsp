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
		<h2>문의글작성</h2>
		<form action="writePro.jsp" method="post">
			<table class="table table-hover">
				<tr>
					<td><input type="text" name="subject" class="form-control" placeholder="제목"></td>
				</tr>
				
				<tr>
					<div class="mb-3 mt-3">
						<td><textarea name="content" class="form-control" rows="20" placeholder="여기에 내용을 적어주세요"></textarea></td>
					</div>
				</tr>
				<tr>
					<td><input type="file" name="file" class="form-control" ></td>
				</tr>
				<tr>
				<td>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="private" id="inlineRadio1" value="공개">
					  <label class="form-check-label" for="inlineRadio1">공개</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="private" id="inlineRadio2" value="비공개" checked="checked">
					  <label class="form-check-label" for="inlineRadio2">비공개</label>
					</div>
				</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="돌아가기" class="btn btn-primary" onclick="histoy.back()">
						<input type="submit" value="글쓰기" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>