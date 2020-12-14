<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="/res/css/defaultTemp.css">
</head>
<body>
	<!-- Header -->
    <header>
        <div class="headerDiv1">
            <br><br>
            <div class="headerDiv2">Monkey Developer</div>
            <div class="headerDiv3">Daily coding</div>
            <ul class="headerUl">
                <li class="headerLi1"><a href="#" class="headerA">개발자 소개</a></li>
                <li class="headerLi"><a href="#" class="headerA">프로젝트 소개</a></li>
                <li class="headerLi"><a href="#" class="headerA">개발자 1:1 문의</a></li>
                <li class="headerLi"><a href="#" class="headerA">일기</a></li>
                <li class="headerLi"><a href="#" class="headerA">응원메세지</a></li>
            </ul>
        </div>
    </header>

    <div class="headerBottomDiv">
        <audio class="audioMp" autoplay="autoplay" controls="controls" loop src="/res/sound/음악테스트01.mp3">
           <source src="sound/음악테스트01.mp3" type="audio/mp3">
        </audio>
        
        <div class="dateDiv">
            <span id="homeMsg">크롬(Chrome) 기준으로 작성된 홈페이지 입니다</span> 2020.12.14　이재용
        </div>
    </div>
    <!-- Header End -->
    
    
   	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	
    
    <div class="footerDiv">
	
    </div>
    
    
    
<script>


</script>
</body>
</html>