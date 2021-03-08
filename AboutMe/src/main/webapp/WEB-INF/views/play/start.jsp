<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${Guest != null}">
        <div>${Guest.nickname}</div>
        <img src="${Guest.profile_image}">
        <div>${Guest.email}</div>
        <div>${Guest.gender}</div>
        <div>${Guest.token}</div>
        <input type="button" value="로그아웃" onclick="location.href='/play/logout'">
    </c:if>
</body>
</html>