<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<style>
	.container{
		width: 1000px;
		margin: 0 auto;
		margin-top: 400px;
	}
	
	#frm {
		width: 700px;
		height: 500px;
	}
	
	input {
		width: 200px;
		height: 40px;
		font-size: 1em;
	}
	
	#loginBtn {
		width: 200px;
		height: 70px;
	}
	
	#err {
		color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<c:if test="${loginErr != null}">
			<div id="err">${loginErr}</div>
		</c:if>
		
		<form id="frm" action="/admin" method="post" onsubmit="return chk()">
			<input type="text" name="user_id" placeholder="관리자 아이디"><br><br>
			<input type="password" name="user_pw" placeholder="관리자 비밀번호"><br><br>
			<button id="loginBtn" type="submit">로그인</button>
		</form>
		
		<c:if test="${loginUser.i_user != null}">
			<button type="button" onclick="logOut(${loginUser.i_user})">로그아웃</button>
			<div>i_user 값 : ${loginUser.i_user}</div>
		</c:if>
		
	</div>
	
<script>

	

	
	function logOut(i_user) {
		location.href="/logOut?i_user="+i_user
	}
	
</script>
</body>
</html>