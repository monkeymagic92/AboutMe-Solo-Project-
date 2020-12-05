<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ㅎㅇ 이거뜨면 성공</h1>
	<br>
	<h1>재용월드 온것을 환영한다 반갑다</h1>
	<div>${hi}</div>
	
	<button onclick="move()">메인</button>
	<button onclick="move2()">jy 다른곳으로</button>	
	
<script>
	function move() {
		location.href="/"
	}
	
	function move2() {
		location.href="/jy"
	}
</script>
</body>
</html>
