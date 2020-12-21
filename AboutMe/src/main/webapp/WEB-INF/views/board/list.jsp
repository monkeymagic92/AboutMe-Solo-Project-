<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자 문의</title>
<link rel="stylesheet" href="/res/css/list.css">
</head>
<body>
	<div class="container">
        <div class="topMsg">
            <h3>개발자에게 하고싶은 말을 자유롭게 작성해 주세요</h3>
        </div>
        <div class="topContainer">
            <form id="frm" action="/board/list" method="post" onsubmit="return chk()">
                <label>
                    제목 <input type="radio" class="searchMenu" name="searchResult" value="1" checked>
                </label>
                <label>
                    작성자 <input type="radio" class="searchMenu" name="searchResult" value="2">
                </label>
                <input id="searchIn" type="text" name="search" placeholder="검색">
                <!--<span id="searchIcon" class="material-icons">search</span>-->
                <input id="searchBtn" type="submit" value="검색">
            </form>
            <button id="writeBtn" type="button" onclick="moveToReg()">글작성</button>
        </div>
        <table cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록날짜</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${data}" var="item">
            		<tr onclick="moveToDetail(${item.i_board})">
	                    <th>${item.title}</th>
	                    <th>${item.nm }</th>
	                    <th>${item.r_dt }</th>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>

        <div class="pageDiv">
            <span id="pageSpan">1</span>
        </div>
        
        <div class="height">

        </div>

    </div>
    
<script>
	function moveToDetail(i_board) {
		location.href="/board/detail?i_board="+i_board
	}

	function moveToReg() {
		location.href="/board/reg"
	}
</script>
</body>
</html>