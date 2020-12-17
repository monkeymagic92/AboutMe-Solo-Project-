<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자 소개</title>

<link rel="stylesheet" href="/res/css/intro.css">
</head>
<body>
	<div class="container">
        <div class="introTopDiv">
            <button id="ib1" class="introBtns">이력서 보기</button>
            <button id="ib2" class="introBtns">자기소개 보기</button>
            <button id="ib3" class="introBtns">아무개 보기</button>
        </div>
        <div class="downloadIntro">
            이력서 다운로드
            <a href="download/이력서~1.docx" download="이재용 이력서.docx">
                다운로드
            </a>
            
        </div>

        <div class="introContainer">
            <h2 class="introH2">1. 성장과정</h2>
            <div class="intro">
                <p class="introP">
                    제가 좋아하는 음식은 바나나 입니다
                    그이유는 원숭이이기 때문입니다
                </p>
            </div>
        </div>

        <div class="introContainer">
            <h2 class="introH2">1. 본인의 성장과정을 기술해 주세요</h2>
            <div class="intro">
                <p class="introP">
                    저는 진짜 잘합니다
                </p>
            </div>
        </div>

        <div class="introContainer">
            <h2 class="introH2">1. 본인의 성장과정을 기술해 주세요</h2>
            <div class="intro">
                <p class="introP">
                    하하핰ㅋ;;
                </p>
            </div>
        </div>

        <div class="introContainer">
            <h2 class="introH2">1. 본인의 성장과정을 기술해 주세요</h2>
            <div class="intro">
                <p class="introP">
                    하하핰ㅋ;;
                </p>
            </div>
        </div>

        <div class="height">

        </div>
        <button id="TopBtn"><span class="iconify icon-TopBtn" data-inline="false" data-icon="uim:angle-double-up"></span><span class="TOP">TOP</span></button>
        
    </div>
	
	
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script>
let Top = document.querySelector('#TopBtn')
let ib1 = document.querySelector('#ib1')
let ib2 = document.querySelector('#ib2')
let ib3 = document.querySelector('#ib3')

window.addEventListener('scroll', function(){
    if(this.scrollY > 1){
        Top.classList.add('on')
    }else{
        Top.classList.remove('on')
    }
})

Top.addEventListener('click', function(el){
    el.preventDefault()
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    })
})

/* 이력서보기 버튼 */
ib1.addEventListener('click', function(el) {
    el.preventDefault()
    window.scrollTo({
        top: 300,
        behavior: 'smooth'
    })
})

/* 자기소개 보기 버튼*/
ib2.addEventListener('click', function(el) {
    el.preventDefault()
    window.scrollTo({
        top: 1200,
        behavior: 'smooth'
    })
})

/* 아무개 보기 버튼 */
ib3.addEventListener('click', function(el) {
    el.preventDefault()
    window.scrollTo({
        top: 2000,
        behavior: 'smooth'
    })
})
</script>
</body>
</html>