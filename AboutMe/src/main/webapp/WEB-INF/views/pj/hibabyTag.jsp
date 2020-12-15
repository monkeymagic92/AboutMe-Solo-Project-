<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hibabyTag</title>
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
            <div id="hibabyFont">HiBaby</div>
            <img class="hibabyImg" src="/res/img/HiBaby.jpg">
        </div>
        <br>
        <div>
            <div class="urlDiv">
                사이트 URL : <a id="urlA" href="http://118.67.130.227:8080/user/login" target="_blank">http://118.67.130.227:8080/user/login</a>
                <br><br>
                담당 분야 : Front-End, Back-End
            </div>
            
            <p class="infoP">
                프로젝트 내용적기<br>
                프로젝트 내용적기<br>
            </p>
        </div>

        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">1. 회원 가입 (정규화)</h2>
                <ul class="infoUl">
                    <li class="infoLi">중복확인은 Ajax통신을 이용하였으며, 중복확인후 내용이 변경된경우 다시 체크를 하도록 구성</li>
                    <br>
                    <li class="infoLi">비밀번호는 salt 암호화 기법을 사용하여 회원가입후 DB에 값 저장시 난수로 저장</li><br>
                    <li class="infoLi">아이디:영어,숫자 / 이메일:이메일형식 / 비밀번호:영어,특수문자,숫자 포함 정규화 작업</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h2>
                <ul class="infoUl">
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi">아이디찾기 또한 위와 동일한 방식으로 일치하는 ID를 메일로 발송함</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h2>
                <ul class="infoUl">
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h2>
                <ul class="infoUl">
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h2>
                <ul class="infoUl">
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                </ul>
            </div>
        </div>
        
        <div id="end">
            바쁜시간 내주시어 여기까지 읽어주셔서 감사합니다.
        </div>
        
        <div class="height">

        </div>
        
        
    </div>
</body>
</html>