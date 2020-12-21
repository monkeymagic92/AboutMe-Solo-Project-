<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <tr>
                    <th>뭐지??</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>ㅎㅇㅎㅇ</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>제목입니다</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
                <tr>
                    <th>하이재용이</th>
                    <th>이재용</th>
                    <th>2020-12-24</th>
                </tr>
            </tbody>
        </table>

        <div class="pageDiv">
            <span id="pageSpan">1</span>
        </div>
        
        <div class="height">

        </div>

    </div>
    
<script>
	function moveToReg() {
		location.href="/board/reg"
	}
</script>
</body>
</html>