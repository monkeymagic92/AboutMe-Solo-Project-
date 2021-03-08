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
	<c:if test="${Guest == null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=7df9e62642f4d75b1c20fb1b0be4450d&redirect_uri=http://localhost:8080/play/login&response_type=code">
            <img src="/res/img/kakaoLogin.png">
        </a>
    </c:if>
    <c:if test="${Guest != null}">
        <h1>로그인 성공입니다</h1>
        <div>${Guest.nickname}</div>
        <img src="${Guest.profile_image}">
        <div>${Guest.email}</div>
        <div>${Guest.gender}</div>
        <div>${Guest.token}</div>
        <input type="button" value="로그아웃" onclick="location.href='/play/logout'">
    </c:if>



<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
<script>
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