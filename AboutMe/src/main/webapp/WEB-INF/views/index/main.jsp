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
    	<!-- 
        <div class="indexSpeak">
            <p class="speak">
                '노력은 배신하지 않는다'<br><br>
                저는 29년간 살면서 '노력은 배신하지 않는다' 라는 말을 수도없이 들었습니다<br>
                여태껏 저와는 관련 없는, 그저 흘러가는 말 뿐이였습니다<br>
                하지만 지금와서 그말의 참뜻을 깨닳았습니다<br>
                기본적인 반복문조차 어려워하던 제가 지금은 제가 원하는 작은 프로그램을 만들기까지<br>
                그리고 앞으로 더 성장할 제자신을 기약하며<br>
                여러분들께서 저의 성장과정을 지켜봐 주십시오<br>
                - 2020. 12. 14 -<br>
            </p>
        </div>
        -->
       
 
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
                <h1 id="infoH1">개발자 <span id="spanGithub">tistory</span></h1>
                <h3 id="infoH3">　<a class="infoA" href="https://monkeydvl.tistory.com/" target="_blank">바로가기</a></h3>
                <a href="https://monkeydvl.tistory.com/" target="_blank"><img class="infoImg" src="/res/img/T.png" alt=""></a>
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
        
        
        <!-- 팝업 -->
        <div id="layerPopId" class="layerPopup">
            <div class="layerBox">
                <h1 class="title">aboutMe 소개영상</h1>
                <div class="cont">
                    <video id="stopVideo" class="introMovie" src="/res/av/aboutMe/introMovie.mp4" controls></video>
                </div>
                <a href="javascrfipt:;" class="btnClose">닫기</a>
                <a href="javascript:;" class="btnTodayHide">오늘 하루 보지 않기</a>
            </div>
        </div>
	        
        
        <div class="footerDiv">
			<!--  공백용   -->
    	</div>
    	
        
    </div>
    
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>

    // 아작스 글입력 만들기
    function chatSend() {
        chatCtnt.value = ''
        alert('아작스 글입력 만들기 \nㄹㄹㄹ');
    }

    /* DDmarket 연결 */
    function moveToDDmarket() {
        location.href="/pj/ddmarketTag"
    }

    /* HiBaby 연결*/
    function moveToHiBaby() {
        location.href="/pj/hibabyTag"
    }

    function moveToIndex() {
        location.href="/"
    }

    /* Javascript */
    var $layerPopup = document.querySelector('.layerPopup');
    var $btnLayerPopupClose = document.querySelector('.layerPopup .btnClose');
    var $btnLayerPopupTodayHide = document.querySelector('.layerPopup .btnTodayHide');

    //최초 레이어팝업 노출
    if($.cookie('popupMovie') == undefined){
        layerPopupShow();
    }
    //레이어팝업 닫기 버튼 클릭
    $btnLayerPopupClose.addEventListener('click', function(){
        layerPopupHide(0);
    });

    //레이어팝업 오늘 하루 보지 않기 버튼 클릭
    $btnLayerPopupTodayHide.addEventListener('click', function(){
        layerPopupHide(1);
    });

    //레이어팝업 노출
    function layerPopupShow(){
        $layerPopup.style.display = 'block'
    }
    //레이어팝업 비노출
    function layerPopupHide(state){
        //닫기버튼 오늘하루보지않기 버튼 무관하계 레이어팝업은 닫는다.
        $layerPopup.style.display = 'none'

        //오늘하루보지않기 버튼을 누른 경우
        if(state === 1){
            //'testCookie' 이름의 쿠키가 있는지 체크한다.
            if($.cookie('popupMovie') == undefined){
                //쿠키가 없는 경우 testCookie 쿠키를 추가
                $.cookie('popupMovie', 'Y', { expires: 1, path: '/' });
                /**
                    설명 :
                    임의로 testCookie라는 이름에 Y라는 값을 넣어주었고,
                    expires값으로 1을 주어 1일 후 쿠키가 삭제되도록 하였다.
                    path값을 '/'로 주면 해당사이트 모든페이지에서 유효한 쿠키를 생성한다.
                    특정페이지에서만 작동하려면 페이지 경로를 작성하면 된다.
                **/
            }        
        }
    }

    // 닫기 or 오늘 하루 안보기 누를경우 영상 재생까지 멈추게 하기
    $('.btnClose').click(function() {
        $("#layerPopId").remove();
    })

    $('.btnTodayHide').click(function() {
        $("#layerPopId").remove();
    })
</script>
</body>
</html>