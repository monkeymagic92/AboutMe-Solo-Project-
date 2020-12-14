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
                    주소API활용으로 지역별 판매자,구매자 1:1 대화방식으로 중고물품 거래 
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
                <img class="logoImg" src="/res/img/HiBaby.jpg" alt="">                
            </div>
            <ul class="pjUl">
                <li class="pjLi">프로젝트 명 : HiBaby (2020.11.21 ~ ing)</li>
                <li class="pjLi">개발 도구 : MySQL, Spring Tool Suite, Apache Tomcat9, Eclips IDE</li>
                <li class="pjLi">프로젝트 주제 : <br>
                    아동을 대상으로 공부기능, 커뮤니티, 웹소켓 채팅을 활용한 프로그램
                </li>
                <li class="pjLi">담당 분야 : Front-End, Back-End</li>
            </ul>
        </div>
        <button id="pjBtn" onclick="hibabyTag()">상세 내용 보기</button>

        <div class="space">

        </div>
    </div>
    
<script>
function ddmarketTag() {
    location.href="/pj/ddmarketTag"
}

function hibabyTag() {
    location.href="/pj/hibabyTag"
}

</script>
</body>
</html>