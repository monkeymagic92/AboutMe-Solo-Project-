<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pjList</title>
<link rel="stylesheet" href="/res/css/pjList.css">
</head>
<body>
	<div class="container">
        <!-- 팀 -->
        <h1 id="pjH1">팀 프로젝트</h1>
        <div class="pjList">
            <div class="imgItem">
                <img class="logoImg" src="/res/img/DDmarket.jpg" alt="">                
            </div>
            <ul class="pjUl">
                <li class="pjLi">프로젝트 명 : DDmarket (단디마켓) (2020.10.08 ~ 2020.11.20)</li>
                <li class="pjLi">개발 도구 : Maria DB, Spring Tool Suite, Apache Tomcat9, Eclips IDE</li>
                <li class="pjLi">프로젝트 주제 : <br>
                    각 지역별 판매자 구매자 1:1방식 중고거래 
                </li>
                <li class="pjLi">담당 분야 : Back-End</li>
            </ul>
        </div>
        <button id="pjBtn" onclick="ddmarketTag()">상세 내용 보기</button>
        
        <br><br><br><br><br>
        <!-- 개인 -->
        <h1 id="pjH1">개인 프로젝트</h1>
                
        <div class="pjList">
            <div class="imgItem">
                <img id="MainPng" class="logoImg" src="/res/img/Main.png" alt="">                
            </div>
            <ul class="pjUl">
                <li class="pjLi">프로젝트 명 : AboutMe (2020.12.13 ~ 2021.1.10)</li>
                <li class="pjLi">개발 도구 : MySQL, Spring Tool Suite, Apache Tomcat9, Eclips IDE</li>
                <li class="pjLi">프로젝트 주제 : <br>
                    나의 소개와 동시에 일반인과 관리자의 실시간 채팅 및 접근가능 권한, 커뮤니티, 앞으로 해야될 목록을 기록하는 사이트
                </li>
                <li class="pjLi">담당 분야 : Front-End, Back-End</li>
            </ul>
        </div>
        <button id="pjBtn" onclick="aboutMeTag()">상세 내용 보기</button>
        
        <br><br><br><br>
        
        <div class="pjList">
            <div class="imgItem">
                <img class="logoImg" src="/res/img/HiBaby.jpg" alt="">                
            </div>
            <ul class="pjUl">
                <li class="pjLi">프로젝트 명 : HiBaby (2020.11.21 ~ 2021.1.29)</li>
                <li class="pjLi">개발 도구 : MySQL, Spring Tool Suite, Apache Tomcat9, Eclips IDE</li>
                <li class="pjLi">프로젝트 주제 : <br>
                    아동을 대상으로 공부기능, 커뮤니티, 실시간 채팅, 포인트환급, 미니게임등을 활용한 프로그램
                </li>
                <li class="pjLi">담당 분야 : Front-End, Back-End</li>
            </ul>
        </div>
        <button id="pjBtn" onclick="hibabyTag()">상세 내용 보기</button>

        <div class="space">

        </div>
    </div>
    
<script>

// DDmarket 태그
function ddmarketTag() {
    location.href="/pj/ddmarketTag"
}

// HiBaby 태그
function hibabyTag() {
    location.href="/pj/hibabyTag"
}

// aboutMe 태그
function aboutMeTag() {
    location.href="/pj/aboutMeTag"
}

</script>
</body>
</html>