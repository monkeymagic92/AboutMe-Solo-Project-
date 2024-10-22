<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<link rel="stylesheet" href="/res/css/admin.css">
</head>
<body>
	<div class="adminContainer">
		<div id="adminLogin">관리자 로그인</div>
		<c:if test="${loginErr != null}">
			<div id="err">${loginErr}</div>
		</c:if>
        
        <div class="frmContainer">
            <form id="frm" action="/admin" method="post" onsubmit="return chk()">
                <input class="frmIns" type="text" name="user_id" placeholder="관리자 아이디"><br><br>
                <input class="frmIns" type="password" name="user_pw" placeholder="관리자 비밀번호"><br><br>
                <button id="loginBtn" type="submit">로그인</button>
            </form>
        </div>
		
		<c:if test="${loginUser.i_user != null}">
            <div class="bottomContainer">
                <button id="logOutBtn" type="button" onclick="logOut(${loginUser.i_user})">로그아웃</button>
                <div id="bottomMsg">i_user 값 : ${loginUser.i_user}</div>
            </div>
		</c:if>
	</div>
	
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	if(${loginErr != null}) {
		frm.user_id.focus()
	}
	
	function logOut(i_user) {
		location.href="/logOut?i_user="+i_user
	}
	
	window.onload = function() {
		frm.user_id.focus();
	}
	
</script>
</body>
</html>