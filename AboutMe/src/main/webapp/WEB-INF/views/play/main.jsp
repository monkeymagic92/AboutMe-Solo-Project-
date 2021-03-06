<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" onclick="moveToAboutMe()">aboutMe 가기</button>
	play main
	
	
	
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
<script>
	
	function moveToAboutMe() {
		location.href="/"
	}
</script>
</body>
</html>