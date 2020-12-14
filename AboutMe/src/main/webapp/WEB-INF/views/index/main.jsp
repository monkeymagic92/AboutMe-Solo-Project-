<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/index.css">
</head>
<body>
	<!-- Index -->
    <div class="container">
        <div class="indexSpeak">
            <p class="speak">
                '노력은 배신하지 않는다'<br><br>
                저는 29년간 살면서 '노력은 배신하지 않는다' 라는 말을 수도없이 들었습니다<br>
                여태껏 저와는 관련 없는, 그저 흘러가는 말 뿐이였습니다<br>
                하지만 지금와서 그말의 참뜻을 깨닳았습니다<br>
                기본적인 반복문조차 어려워하던 제가 지금은 제가 원하는 작은 프로그램을 만들기까지<br>
                그리고 앞으로 더 성장할 제자신을 기약하며<br>
                여러분들께서 저의 성장과정을 지켜봐 주십시오.<br>
                - 2020. 12. 14 -<br>
            </p>
        </div>

        <div class="infoURLDiv">
            <div class="infoImgDiv">
                <h1 id="infoH1">개발자 <span id="spanBlog">블로그</span></h1>
                <h3 id="infoH3">　<a class="infoA" href="https://blog.naver.com/ddw0099" target="_blank">바로가기</a></h3>
                <a href="https://blog.naver.com/ddw0099" target="_blank"><img class="infoImg" src="/res/img/naver.png" alt=""></a>
            </div>

            <div class="infoImgDiv">
                <h1 id="infoH1">개발자 <span id="spanGithub">깃허브</span></h1>
                <h3 id="infoH3">　<a class="infoA" href="https://github.com/monkeymagic92" target="_blank">바로가기</a></h3>
                <a href="https://github.com/monkeymagic92" target="_blank"><img class="infoImg" src="/res/img/github.png" alt=""></a>
            </div>

            <div class="infoImgDiv">
                <h1 id="infoH1">팀 프로젝트　</h1>
                <h3 id="infoH3">　<a class="infoA" onclick="moveToDDmarket()">바로가기</a></h3>
                <a onclick="moveToDDmarket()"><img class="infoImg" src="/res/img/DDmarket.jpg" alt=""></a>
            </div>

            <div class="infoImgDiv">
                <h1 id="infoH1">개인 프로젝트</h1>
                <h3 id="infoH3">　<a class="infoA" onclick="moveToHiBaby()">바로가기</a></h3>
                <a onclick="moveToHiBaby()"><img class="infoImg" src="/res/img/HiBaby.jpg" alt=""></a>
            </div>
        </div>
        
        
        <div class="footerDiv">
			<!--  공백용   -->
    	</div>
        
    </div>
    
    
<script>
	/* DDmarket 연결 */
	function moveToDDmarket() {
	    location.href="DDmarket"
	}
	
	/* HiBaby 연결*/
	function moveToHiBaby() {
	    location.href="HiBaby"
	}
</script>
</body>
</html>