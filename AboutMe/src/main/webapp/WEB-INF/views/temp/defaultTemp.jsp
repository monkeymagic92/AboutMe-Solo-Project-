<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<c:choose>
	<c:when test="${cssResult != null}">
		<link rel="stylesheet" href="/res/css/defaultTempDark.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	</c:when>
	<c:when test="${cssResult == null}">
		<link rel="stylesheet" href="/res/css/defaultTemp.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	</c:when>
</c:choose>
</head>
<body>
	<!-- Header -->
    <header>
        <div class="headerDiv1">
            <br><br>
            <div class="headerDiv2"><a id="mainA" href="/">Monkey Developer</a></div>
            <div class="headerDiv3">Daily coding</div>
            <ul class="headerUl">
                <li class="headerLi1"><a href="/intro" class="headerA">개발자 소개</a></li>
                <li class="headerLi"><a href="/pj/pjList" class="headerA">프로젝트 소개</a></li>
                <li class="headerLi"><a href="/board/list" class="headerA">개발자 문의</a></li>
                <li class="headerLi"><a href="#" class="headerA" onclick="wait()">응원메세지</a></li>
            </ul>
        </div>
    </header>

    <div class="headerBottomDiv">
    	<c:if test="${cssResult == null}">
    		<audio class="audioMp" controls="controls" loop src="/res/sound/음악테스트01.mp3">
           		<source src="sound/음악테스트01.mp3" type="audio/mp3">
        	</audio>
    	</c:if>
    	
    	
        <div class="dateDiv">
            <span id="homeMsg">크롬(Chrome) 기준으로 작성된 홈페이지 입니다</span> 2020.12.14　이재용
        </div>
    </div>
    
    <!-- chatStart -->
    <div class="message">
        <img id="messageIcon" src="/res/img/메세지아이콘.png">
    </div>

    <div class="ourSite">
        <div class="ourSite-1">
            만남의 광장
        </div>
        
        <div class="ourSite-2">
            익명보장!!
        </div>
    </div>
    <button class="chatCloseBtn">
        X        
    </button>

    <!--  -->
    <div class="chatView">
        
        <!-- 내용 ajax 처리하기-->

        <!-- 일반 -->
        <div id="chatViewBoxList">
            <div class="userChat">
                나는 유저
                입니다.<br>
            </div>            
            <div class="userDate">2020.12.25 09:25AM</div>
        </div>
        
        <!-- 관리자 -->
        <div id="chatViewBoxList">
            <div class="adminNm">관리자</div>
            <div class="adminChat">
                나는 관리자
                입니다.ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ<br>
            </div>
            <div class="adminDate">2020.12.25 09:25AM</div>
        </div>


    </div>
    
    <div class="chatIns">
        <form id="chatFrm">
            <textarea id="chatCtnt" type="text" name="chatCtnt" placeholder="메시지를 입력해 주세요."></textarea>

            <!-- adminCode = 1 유저    = 2 관리자 -->
            <input type="hidden" id="adminCode" name="adminCode" value="1">
            <span id="sendIcon" class="material-icons" onclick="chatSend()">
                send
            </span>
        </form>
    </div>

    <!-- chatEnd -->
    <!-- Header End -->

    
   	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
    
    <div class="footerDiv">
		
    </div>
    


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//첫 실행시 채팅창은 hide
	$('.chatCloseBtn').hide();
	$('.chatView').hide();
	$('.chatIns').hide();
	$('.ourSite').hide();
	
	// 메세지 아이콘 클릭시 채팅창 show
	$('#messageIcon').click(function() {
		$('.chatCloseBtn').show();
	    $('.chatView').show();
	    $('.chatIns').show();
	    $('.ourSite').show();
	    $('#messageIcon').hide();
	    
	})
	
	// X버튼 클릭시 닫음
	$('.chatCloseBtn').click(function() {
		$('.chatCloseBtn').hide();
	    $('.chatView').hide();
	    $('.chatIns').hide();
	    $('.ourSite').hide();
	    $('#messageIcon').show();
	    chatCtnt.focus();
	})
	
	
    // 아작스 글입력 만들기
    function chatSend() {
        chatCtnt.value = ''
        alert('아작스 글입력 만들기');
    }


	function wait() {
		alert('서비스 준비중입니다.')
	}

</script>
</body>
</html>