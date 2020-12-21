<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록 / 수정</title>
<link rel="stylesheet" href="/res/css/reg.css">
<script src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script>
<style>
	.aa {
		width: 800px;
		margin: 0 auto;
		height: 600px;
	}
</style>
</head>
<body>
<!-- 
	관리자 글 권한 설정하는법
	
	jstl로 로그인유저가 != null  이면  loginUser.nm 값을 글쓴이에 박고
	
	일반인이 글쓴이에다가  밸류값에 '관리자' 라고 쓸경우 자바스크립트로 검사해서
	loginUser == null 이라면 해당 이름은 사용 못합니다 라는 문구를 띄우고
	
	loginUser != null 이라면 그냥 글쓴이로 사용하게 하면 됨 
	
 -->
<div class="regContainer">

	<form id="frm" action="/board/reg" method="post" onsubmit="return chk()">
		<input id="insTitle" type="text" name="title" placeholder="제목 입력">
		<div class="aa">
			<textarea name="ctnt" id="smartEditor" rows="6"></textarea>
		</div>
		<button id="subBtn" type="submit">전송</button>
	</form>
</div>

<script src="/res/js/ckeditor.js"></script>
</body>
</html>





