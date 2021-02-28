<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aboutMe</title>
<link rel="stylesheet" href="/res/css/tag.css">
</head>
<body>
	<div class="container">
        <div class="alert">본 영상들에는 BGM이 깔려있습니다<br>
            조용한 곳에서 영상을 보시는분들은 음소거를 하시고 영상을 시청해주시기 바랍니다
            <br>
            영상화질이 흐릴경우 전체화면으로 시청해 주세요
            <br>
        </div>
        <div class="hibabyContainer">
            <div id="hibabyFont">AboutMe</div>
            <img class="hibabyImg" src="/res/img/Main.png">
        </div>
        <br>
        <div>
            <div class="urlDiv">
                <ul>
                    <li>URL : <a id="urlA" href="http://118.67.132.252:8080/" target="_blank">http://118.67.132.252:8080/</a></li>
                    <li>담당 분야 : <span id="span1">Font-End, Back-End</span></li>
                </ul>
                                
            </div>
            <p class="infoP">
                저의 개인프로젝트 와 팀프로젝트를 한번에 쉽게 볼수있게 나타내었으며 그외<br>
               	저의 프로젝트 및 학습한 내용들을 기록하기 위한 사이트 입니다.<br>
               	2020.12.14 날짜로 사이트 제작이 시작되었으며 추후 계속 사이트를 업데이트 할 예정입니다.<br>
            </p>
        </div>

        <div class="movieInfo">
            <video id="mv" src="/res/av/aboutMe/aboutMeIntro.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">1. 개발자 소개</h2>
                <ul class="infoUl">
                    <li class="infoLi">다른 페이지와 다르게 어두운 css 조성</li>
                    <br>
                    <li class="infoLi">개발자 소개, 이력서, 자기소개를 한눈에 볼수있는 페이지</li>
                    <br>
                    <li class="infoLi">개발자 소개 페이지에서는 채팅창을 띄우지 않음</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video id="mv" src="/res/av/aboutMe/aboutMeNewChat.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 만남의 광장</h2>
                <ul class="infoUl">
                    <li class="infoLi">웹소켓 통신을 활용하여 관리자와 일반유저들 간에 익명성 채팅</li>
                    <br>
                    <li class="infoLi">관리자와 일반유저간에 좌우측 구분지어 대화</li>
                    <br>
                    <li class="infoLi">HttpSession을 활용하여 채팅창을 닫았을시 페이지 이동시에도 닫힘 유지</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video id="mv" src="/res/av/aboutMe/newBoard.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">3. 게시글 CRUD</h2>
                <ul class="infoUl">
                    <li class="infoLi">글 등록시 summernote 에디터를 사용</li>
                    <br>
                    <li class="infoLi">비로그인 사이트이므로 비밀번호를 활용하여 모든 권한을 부여</li>
                    <br>
                    <li class="infoLi">일반유저는 비밀번호를 입력하여 접근이 가능하지만, 관리자는 모든 게시글 접근가능</li>
                    <br>
                    <li class="infoLi">XSS 공격을 대비하여 lucy-xss-servlet 라이브러리를 사용</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video id="mv" src="/res/av/aboutMe/devel.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">4. 개발일지</h2>
                <ul class="infoUl">
                    <li class="infoLi">한 블럭당 글은 5개까지 등록 가능</li>
                    <br>
                    <li class="infoLi">앞으로 해야할 일을 등록하며, 마무리 지었을시 수정을 통해 완료를 함으로 써<br>
                        해야할 일, 완료된 일을 구분지어 통일함
                    </li>
                    <br>
                    <li class="infoLi">개발 일지 페이지는 모든권한이 관리자에게만 허락됨</li>
                </ul>
            </div>
        </div>
        <br><br>
        
        <div id="end">
            여기까지 읽어주셔서 감사합니다.
        </div>
        
        <div class="height">

        </div>
        
        
    </div>
    
<script>
	document.getElementById("mv").volume = 0.3;
</script>

</body>
</html>