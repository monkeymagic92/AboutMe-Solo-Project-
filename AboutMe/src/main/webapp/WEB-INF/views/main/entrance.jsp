<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jy Introduce</title>
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>
<style>
	.container {
		width: 900px;
		margin: 0 auto;
		text-align: center;
	}
	
	.space {
		margin-top: 200px;
	}
	
	#siteId {
		margin-top: 15px;
		font-family: 'Pacifico', cursive;
		font-size: 1.7em;
		
	}
	
	#siteId:hover {
		cursor:pointer;
		
	}
	
</style>
<body>
	<div class="container">
		<div class="container">
			<div class="space"></div>
	        <a href="/main/boarder" id="monkeyId"></a>
	        <a href="/main/boarder" id="developerId"></a>
	        <div id="siteId" onclick="move()" class="animate__rubberBand animate__animated fas fa-check"></div>
	    </div>
    </div>

<script>
	// n초 후 실행하는 함수
	
	setTimeout(function() {
		var monkey = document.createElement('img')
        monkey.setAttribute('src','/res/img/monkey.png')
		monkey.setAttribute('class', 'animate__zoomInDown animate__animated fas fa-check')
		monkeyId.append(monkey)
		
	},300)

    setTimeout(function() {
		var developer = document.createElement('img')
        developer.setAttribute('src', '/res/img/developer.png')
		developer.setAttribute('class', 'animate__zoomInRight animate__animated fas fa-check')
		developerId.append(developer)
		
	},1000)

	
	
	setTimeout(function() {
		var site = document.createElement('div')
		site.setAttribute('class', 'animate__rubberBand animate__animated fas fa-check')
		site.append('Connect')
		siteId.append(site)
		
	},2000)
	
	
	function move() {
		location.href="/main/boarder"
	}
	
	
</script>
</body>
</html>