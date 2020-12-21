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
            		<c:if test="${loginUser.nm == null}">
           			
           				<c:if test="${item.scr == ''}">
           					<tr onclick="moveToDetailScr(${item.i_board})">
	            				<th>비밀 게시글 입니다</th>
	            				<th>비밀 게시글 입니다</th>
	            				<th>${item.r_dt}</th>
            				</tr>
            			</c:if>
            			
            			<c:if test="${item.scr != ''}">
            				<tr onclick="moveToDetail(${item.i_board})">
		            			<th>${item.title}</th>
		            			<th>${item.nm}</th>
		            			<th>${item.r_dt}</th>
		            		</tr>
            			</c:if>
            			
            		</c:if>
            		<c:if test="${loginUser.nm != null}">
            			<tr onclick="moveToDetail(${item.i_board})">
	            			<c:if test="${item.scr == ''}">
	            				<th>비밀 게시글 입니다</th>
	            				<th>비밀 게시글 입니다</th>
	            				<th>${item.r_dt}</th>
	            			</c:if>
	            			
	            			<c:if test="${item.scr != ''}">
		            			<th>${item.title}</th>
		            			<th>${item.nm}</th>
		            			<th>${item.r_dt}</th>
	            			</c:if>
	            		</tr>
	              	</c:if>
	            	
            		
            		
            		</tr>
            	</c:forEach>
            </tbody>
        </table>

        <div class="pageDiv">
            <span id="pageSpan">1</span>
        </div>
        
        <div class="height">

        </div>
        
        
        
        
        
        
        
        <div id="myModalCer" class="modal">
 
			<!-- Modal content -->
			<div class="modal-content">
			      <h2>비밀번호를 입력해 주세요</h2>
			    <!-- Modal body -->
			    <div class="modal-body">
			    	<form id="frm" action="/board/detail" method="post" onsubmit="return chk()">
			    		<input id="cerCodeIns" type="password" name="scr" placeholder="비밀번호 입력">
			    		<input id="submitIns" type="submit" value="확인">
			    	</form>
			    </div>
			    <button type="button" class="pop_bt" onclick="close_pop()">
						종료
				</button>
			</div>
	    </div>
	        
        
        
        
        
        
        
        

    </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script>
	var userNm = `${loginUser.nm}`
	console.log('유저값 : ' + userNm)
	
	function moveToDetail(i_board) {
		location.href="/board/detail?i_board="+i_board
	}
	
	function moveToDetailScr(i_board) {
		$('#myModalCer').show();
	}

	
	
	// 비밀번호 입력창 --------
	$('#myModalCer').hide();
	
	function moveToReg() {
		location.href="/board/reg"
	}
	
	function close_pop(flag) {
		 $('#myModalCer').hide();
	}
	// 비밀번호 입력------------
	
</script>
</body>
</html>