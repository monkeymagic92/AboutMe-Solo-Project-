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
               	2020.12.14 날짜로 사이트를 제작했으며 추후 제가 실력이 상승함에 따라 계속 사이트를<br>
               	업데이트 할 예정입니다.
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
            <video src="/res/av/HiBaby/findPw.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">2. 비밀번호 찾기 (이메일 발송)</h1>
                <ul class="infoUl">
                    <li class="infoLi">JavaMailSender를 활용하여 회원가입시 입력한 이메일로 인증코드 6자리를 보내어 인증번호가 서로 일치하면 OK</li>
                    <br>
                    <li class="infoLi">아이디찾기 또한 위와 동일한 방식으로 일치하는 ID를 메일로 발송함</li>
                </ul>
            </div>
        </div>
        <br><br>
    </div>
</body>
</html>