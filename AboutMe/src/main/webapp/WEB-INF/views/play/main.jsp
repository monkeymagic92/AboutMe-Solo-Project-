<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/playMain.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	
	<div class="container">
        <div class="kakaoLoginBox">
            <img id="kakaoLogin" src="/res/img/kakaoLogin.png" onclick="show()">
        </div>
    </div>
    
	<div>	
		<a href="javascript:sendLink()"><img
			src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" /></a>
		<!--
				카카오 스토리 용 
		<a href="javascript:shareStoryWeb()"><img
			src="https://developers.kakao.com/sdk/js/resources/story/icon_small.png" /></a>
		-->
	</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
<script>
/*
 * 		카카오 로그인이 안되어 있을경우
 		따로 카카오 로그인 api 필요없이 카카오측에서 자동으로 로그인창 띄워줌
 		- 모바일은 항상 로그인 되어있으니까 바로 공유되고
 		- 웹은 로그인창이 뜸 (로그인 되어있을경우는 안뜸)
 		
 */

Kakao.init('db293b45de7fc0c3fe27836706c6dba1'); // 나의 자바스크립트 key  (이그노어 암호화 해야됨 노출 X)	
function sendLink() {
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '친구 취향 맞추기',
            description: '(서버에서 보낸값) 님의 취향을 맞춰보세요 !',
            imageUrl: 'https://blog.kakaocdn.net/dn/0mySg/btqCUccOGVk/nQ68nZiNKoIEGNJkooELF1/img.jpg',	// img (url입력해야됨)
            link: {
                mobileWebUrl: 'http://118.67.132.252/',	// 모바일에서 접속할 URL
                webUrl: 'http://118.67.132.252/'		// 웹에서 접속할 URL
            },
        },
        buttons: [
            {
                title: '공유 하기',	
                link: {
                    mobileWebUrl: 'http://118.67.132.252/',		// 모바일에서 접속할 url
                    webUrl: 'http://118.67.132.252/'			// 웹에서 접속할 url
                },
            }
        ],
    })
}

</script>
</body>
</html>