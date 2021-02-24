<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="/res/img/Monkey.ico">
<%-- summernote 때문에 css 겹치는 관계로 intro와 reg 페이지때문에 나눔
	 reg 페이지가 summernote있기에 dark 테마 적용시킬수 없음
 --%>
<c:choose>
	<c:when test="${cssResult != null}">
		<link rel="stylesheet" href="/res/css/defaultTempDark.css">
	</c:when>
	<c:when test="${cssResult == null}">
		<link rel="stylesheet" href="/res/css/defaultTemp.css">
	</c:when>
</c:choose>

</head>
<body>
	<!-- Header -->
    <header>
        <div class="headerDiv1">
            <br><br>
            <div class="headerDiv2"><a id="mainA" href="/">Monkey Developer</a></div>
            <div class="headerDiv3">Daily coding</div>
            <ul class="headerUl">
                <li class="headerLi1"><a href="/intro" class="headerA">개발자 소개</a></li>
                <li class="headerLi"><a href="/pj/pjList" class="headerA">프로젝트 소개</a></li>
                <li class="headerLi"><a href="/board/list" class="headerA">개발자 문의</a></li>
                <li class="headerLi"><a href="/devel/main" class="headerA">개발 일지</a></li>
            </ul>
        </div>
    </header>

    <div class="headerBottomDiv">
    	<c:if test="${cssResult == null}">
    		<audio class="audioMp" controls="controls" loop src="/res/sound/음악테스트01.mp3">
           		<source src="sound/음악테스트01.mp3" type="audio/mp3">
        	</audio>
    	</c:if>
    	
    	
        <div class="dateDiv">
            <span id="homeMsg">크롬(Chrome) 기준으로 작성된 홈페이지 입니다</span> 2020.12.14　이재용
        </div>
    </div>
    
     <!-- Header End -->
   	<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
   	
   	
</body>
</html>