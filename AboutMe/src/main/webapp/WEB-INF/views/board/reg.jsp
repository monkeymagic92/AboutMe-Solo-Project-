<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록 / 수정</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/res/css/reg.css">

<style>
	
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
            <div class="nickPwChk">
                <input id="insNick" type="text" name="nm" placeholder="작성자를 입력해 주세요">&nbsp;&nbsp;
                <input id="insScr" type="password" name="scr" placeholder="비밀번호">
                비밀 게시글<input id="scrChk" type="checkbox" name="scr" type="password">
            </div>
            <br>
            <input id="insTitle" type="text" name="title" placeholder="제목 입력">
            <textarea name="ctnt" id="description"></textarea>
            <div class="bottomBtns">
                <button class="bottomBtn" type="submit">전송</button>
                <button class="bottomBtn" type="button" onclick="moveToList()">나가기</button>
            </div>
        </form>
    </div>
    <div class="height">

    </div>
    
<script>
//id가 description인 것을 summernote 방식으로 적용하라는 의미이다.
//높이와 넓이를 설정하지 않으면 화면이 작게 나오기때문에 설정해주어야 한다.
$(function(){
  $("#description").summernote({
      height : 540,
      width : 800,
      codeviewFilter: false,
      codeviewIframeFilter: true,
      placeholder: '내용을 입력해 주세요'
  });
});

function moveToList() {
    if(confirm('입력된 내용은 저장되지 않습니다 작성을 종료 하시겠습니까 ?')) {
        location.href="/board/list"
    }
}


$('#insScr').hide();

$('#scrChk').click(function() {
    if($("input:checkbox[name=scr]").is(":checked") == true) {
        $('#insScr').show();
    } else if($("input:checkbox[name=scr]").is(":checked") == false) {
        $('#insScr').hide();
    }
})


window.onload = function() {
	frm.nm.focus();
}

</script>
</body>
</html>





