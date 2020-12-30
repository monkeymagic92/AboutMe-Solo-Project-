<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>글등록 / 수정</title>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/res/css/reg.css">
</head>
<body>
	<div class="regContainer">
        <form id="frm" action="/board/reg" method="post" onsubmit="return chk()">
            <div class="nickPwChk">
            	<c:if test="${loginUser.nm == null}">
            		<input id="insNick" type="text" name="nm" placeholder="작성자를 입력해 주세요" value="${data.nm}">&nbsp;&nbsp;
            	</c:if>
            	<c:if test="${loginUser.nm != null}">
            		<input id="insNick" type="text" name="nm" placeholder="작성자를 입력해 주세요" value="관리자" readonly>&nbsp;&nbsp;
            	</c:if>
                <input id="insScr" type="password" name="pw" placeholder="비밀번호">
                <input type="hidden" name="scr" value="1">
              비밀 게시글<input id="scrChk" type="checkbox" name="scrCode">
            </div>
            <br>
            <input id="insTitle" type="text" name="title" placeholder="제목 입력" value="${data.title}">
            <textarea name="ctnt" id="description" th:utext="${html}">${data.ctnt}</textarea>
            
            <c:if test="${data.i_board != null}">
            	<input type="hidden" name="i_board" value="${data.i_board}">	
            </c:if>
            <div class="bottomBtns">
                <button class="bottomBtn" type="submit">${data.i_board == null ? '글등록' : '글수정'}</button>
                <button class="bottomBtn" type="button" onclick="moveToList()">나가기</button>
            </div>
        </form>
    </div>
    <div class="height">

    </div>
    
    
    
   
<script>
//id가 description인 것을 summernote 방식으로 적용하라는 의미이다.
//높이와 넓이를 설정하지 않으면 화면이 작게 나오기때문에 설정해주어야 한다.
// condeviewFilter = xss 방어
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


// 비밀게시글 체크시 비밀입력창 보여줌 , 미체크시 비밀입력창 hide
$('#scrChk').click(function() {
    if($("input:checkbox[name=scrCode]").is(":checked") == true) {
    	if(frm.pw.value.length == 0) {
    		alert('비밀번호를 입력해 주세요')
    		frm.pw.focus()
    		return false;
    	}
        frm.scr.value = 2
    } else if($("input:checkbox[name=scrCode]").is(":checked") == false) {
    	frm.scr.value = 1
    }
})

// form 유효검사
function chk() {
	var userNm = `${loginUser.nm}`
	
	if(frm.nm.value.length == 0) {
		alert('이름을 입력해 주세요')
		frm.nm.focus()
		return false;
	}
	
	if(frm.nm.value.length > 9) {
		alert('이름이 너무 깁니다')
		frm.nm.focus()
		return false;
	}
	
	
	
	if(userNm == '') {
		if(frm.nm.value == '관리자') {
			alert('작성자를 관리자로 입력할수 없습니다')
			frm.nm.value = ''
			frm.nm.focus()
			return false;
		}
	}
	
	
	if(frm.title.value.length == 0) {
		alert('제목을 입력해 주세요')
		frm.title.focus()
		return false;
	}
	
	if(frm.title.value.length > 49) {
		alert('제목이 너무 깁니다')
		frm.title.focus()
		return false;
	}
	
	if(frm.ctnt.value.length == 0) {
		alert('내용을 입력해 주세요')
		frm.ctnt.focus()
		return false;
	}
	
	if(frm.pw.value.length < 4) {
		alert('비밀번호를 4자리이상 입력해 주세요')
		frm.pw.focus()
		return false;
	}
}


window.onload = function() {
	frm.nm.focus();
}

</script>
</body>
</html>





