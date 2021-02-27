<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<!-- <link rel="icon" href="data:;base64,iVBORw0KGgo=">  favico 에러 제거 -->
<link rel="shortcut icon" type="image/x-icon" href="/res/img/메세지아이콘.ico">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


<c:choose>
	<c:when test="${cssResult != null}">
		<link rel="stylesheet" href="/res/css/defaultTempDark.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	</c:when>
	<c:when test="${cssResult == null}">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" href="/res/css/defaultTemp.css">
		<link rel="stylesheet" href="/res/css/chat.css">
		<link rel="stylesheet" href="/res/css/mail.css">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
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
                <li class="headerLi"><a href="/devel/main" class="headerA">개발 일지</a></li>
            </ul>
        </div>
    </header>

    <div class="headerBottomDiv">
    	<c:if test="${cssResult == null}">
    		<audio id="audioMp" class="audioMp" controls="controls" src="/res/av/aboutMe/음원1.mp3">
           		<source src="/res/av/aboutMe/음원1.mp3" type="audio/mp3">
        	</audio>
    	</c:if>
    	
    	
        <div class="dateDiv">
            <span id="homeMsg">크롬(Chrome) 기준으로 작성된 홈페이지 입니다</span> 2020.12.14　이재용
        </div>
    </div>
   
   
    <c:if test="${cssResult == null }">
    	<div class="message">
	        <img id="messageIcon" src="/res/img/메세지아이콘.png">
	    </div>
    	<div class="chatChk">
		    <div class="ourSite">
		        <div class="ourSite-1">
		           	 만남의 광장
		        </div>
		    </div>
		    <button class="chatCloseBtn">
		        <span id="exitIcon" class="material-icons" onclick="chatChk()">
		            exit_to_app
		        </span>        
		    </button>
		   
		    	<div id="chatViewId" class="chatView"></div>
		    
		    <div class="chatIns">
		        <form id="chatFrm">
		            <textarea id="chatCtnt" name="chatCtnt" placeholder="메시지를 입력해 주세요."></textarea>
		
		 
		            <input type="hidden" id="adminCode" name="adminCode" value="1">
		            <span id="sendIcon" class="material-icons" onclick="chatSend()">
		                send
		            </span>
		        </form>
		    </div>
	    </div>
	</c:if>
	<form id="chatTestFrm">
		<input type="hidden" id="chatChk" name="chatChk" value="1">
	</form>
	
	
    <img class="mailImg" src="/res/img/mailIcon.jpg" onclick="openMail()">
    <div class="mailContainer">
    	<span id="mailClo" onclick="mailClo()">X</span>
        <form id="mailFrm">
            <input id="mailId" type="email" name="mailId" placeholder="Enter Email">
            <textarea id="mailText" name="mailText" placeholder="Enter Content"></textarea>
        </form>
        <button id="sendMail" type="button" onclick="sendMail()">Send</button>
    </div>
	
    <!-- Header End -->

    
   	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
    
    <div class="footerDiv">
    
		<!-- socket 테스트 -->
		<!--  
		<input type="text" id="message" />
		<input type="button" id="sendBtnf" value="submit"/>
		<div id="messageArea"></div>
		-->
		
    </div>
    

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">

document.getElementById("audioMp").volume = 0.2;
var ws = new WebSocket("ws://localhost:8080/echo");

var isNewCmt = true;	// 채팅 입력시 스크롤바 제일 하단, 마지막 글을 보여줌

var chatValue = `${chatChk}`






function chatChk() {	// 채팅창 session 활용하여 지속적으로 on / off
	var chatChk = chatTestFrm.chatChk.value
	axios.post('/chatChk',{
		chatChk : chatChk
	})
	
}

// 첫시작시 cahtValue == '' 이거임 화면띄우기 
// 그이후 1, 0 으로 지속적으로 on / off 
if(chatValue == '' || chatValue == 1) {
	$('.chatCloseBtn').show();
    $('.chatView').show();
    $('.chatIns').show();
    $('.ourSite').show();
    $('#messageIcon').hide();
    
    
} else {
	$('.chatCloseBtn').hide();
    $('.chatView').hide();
    $('.chatIns').hide();
    $('.ourSite').hide();
    $('#messageIcon').show();
    
} 


// 메세지 아이콘 클릭시 채팅창 show
$('#messageIcon').click(function() {
	$('.chatCloseBtn').show();
    $('.chatView').show();
    $('.chatIns').show();
    $('.ourSite').show();
    $('#messageIcon').hide();
    
    chatTestFrm.chatChk.value = 1
    chatChk()
	if(isNewCmt){
    	  document.getElementById('chatViewId').scrollTop = document.getElementById('chatViewId').scrollHeight;
    }
})

// X 버튼 클릭시 닫음
$('.chatCloseBtn').click(function() {
	$('.chatCloseBtn').hide();
    $('.chatView').hide();
    $('.chatIns').hide();
    $('.ourSite').hide();
    $('#messageIcon').show();
    
    chatTestFrm.chatChk.value = 0
    chatChk()
})




//
$("#sendIcon").click(function() {
	ws.sendMessage();
	$('#chatCtnt').val('')
});

ws.onmessage = ws.onMessage;
ws.onclose = ws.onClose;
//chatViewId.innerHTML = ''

// 연결 되었을때
ws.onopen = function() {
	var i = 0;
	i++
	console.log('연결 성공a' + i)
}

// 1. 메시지 전송
/*
ws.onMessage = function(event) {
	console.log(event.data+'\n')
	console.log('1111111')
}
*/

// 2.
ws.sendMessage = function() {
	ws.send($("#chatCtnt").val());
}

// 3. 서버로부터 메시지를 받았을 때
ws.onmessage = function(event) {
	var data = event.data;
	$("#chatViewId").append(data + "<br/>");
	chatViewId.innerHTML = ''
	if(isNewCmt){
    	  document.getElementById('chatViewId').scrollTop = document.getElementById('chatViewId').scrollHeight;
    }
	ajaxSelChat()
}	

ajaxSelChat() // 기본창에서 챗 뿌리기



// 서버와 연결을 끊었을 때
ws.onClose = function(evt) {
	$("#chatViewId").append("연결 끊김");
}


//챗 입력
function chatSend() {
	isNewCmt = true;
	
	var chatCtnt = chatFrm.chatCtnt.value
	var userNm = `${loginUser.nm}`
	var adminCode = '';
	
	if(chatCtnt == '') {
		alert('글자를 입력해 주세요')
		return
	}
	
	console.log(userNm)
	
	if(userNm == '관리자') { // 관리
		adminCode = '2'
			
	} else { // 일반
		adminCode = '1'
	}
	
	axios.post('/chat/insChat',{
		
		chatCtnt : chatCtnt,
		adminCode : adminCode
		
		
	}).then(function(res) {
		if(res.data == 1) {
			
			chatFrm.chatCtnt.value = ''
			chatFrm.chatCtnt.focus()
			//ajaxSelChat()
			
			
		} else {
			alert('챗 전송중 오류가 발생하였습니다. 잠시후 다시 시도해 주세요')
		}
	})
}

// 챗 뿌리는 메소드
function ajaxSelChat() {
	
	axios.get('/chat/selChat', {
		
	}).then(function(res) {
	
		refreshMenuChat(res.data)
		
	})
}

function refreshMenuChat(arr) {
	chatAlert()
	
	for(let i=0; i<arr.length; i++) {
		makeChatList(arr[i])
	}
}

function chatAlert() {
	var chatViewAlert = document.createElement('div')
	chatViewAlert.setAttribute('class', 'chatViewAlert')
	chatViewAlert.innerHTML = '익명성이 보장되는 공간입니다<br>관리자와 유저들끼리 자유로운 대화를 나누세요'
	chatViewId.append(chatViewAlert)
}

function makeChatList(arr) {
	
	if(arr.adminCode == '1') {	// 일반인
		var userChat = document.createElement('div')
		userChat.setAttribute('class', 'userChat')
		userChat.append(arr.chatCtnt)
		
		chatViewId.append(userChat)
		
		var userDate = document.createElement('div')
		userDate.setAttribute('class', 'userDate')
		userDate.append(arr.r_dt)
		
		chatViewId.append(userDate)
	
		
	} else {	 // 관리자
		console.log('arr.adminCode : ' + arr.adminCode)
		var adminNm = document.createElement('div')
		adminNm.setAttribute('class', 'adminNm')
		adminNm.append('관리자')
		
		
		var adminChat = document.createElement('div')
		adminChat.setAttribute('class', 'adminChat')
		
		chatViewId.append(adminChat)
		adminChat.append(adminNm)
		adminChat.append(arr.chatCtnt)
		
		var adminDate = document.createElement('div')
		adminDate.setAttribute('class', 'adminDate')
		adminDate.append(arr.r_dt)
		
		chatViewId.append(adminDate)
	}
	
	if(isNewCmt){
    	  document.getElementById('chatViewId').scrollTop = document.getElementById('chatViewId').scrollHeight;
    }
	
}

// mail modal창 열기
function openMail() {
	$('.mailContainer').show();
}

// 메일 전송
function sendMail() {

	var email = mailFrm.mailId.value
	var mailText = mailFrm.mailText.value
	
	// 이메일 정규화 
	if (mailFrm.mailId.value.length > 0) {
		const emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!emailJ.test(mailFrm.mailId.value)) {
			alert('올바른 이메일을 입력해 주세요');
			mailFrm.mailId.focus();
			return false
		}
	}
	
	if (mailFrm.mailId.value.length == 0) {
		alert('이메일을 입력해 주세요')
		mailFrm.mailId.focus()
		return false
	}
	
	if (mailFrm.mailText.value.length == 0) {
		alert('내용을 입력해 주세요')
		mailFrm.mailText.focus()
		return false
	}
	
	axios.post('/mail/mailSend',{
		
		email : email,
		mailText : mailText
	}).then(function(res) {
		
		if(res.data == 1) {
			alert('이메일을 성공적으로 발송하였습니다')	
			$('.mailContainer').hide();
		}
	})
}

function mailClo() {
	$('.mailContainer').hide();
}

</script>
</body>
</html>